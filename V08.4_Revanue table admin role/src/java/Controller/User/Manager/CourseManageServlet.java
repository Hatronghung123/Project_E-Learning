/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User.Manager;

import Dal.CourseDetailDAO;
import Dal.CourseManageDAO;
import Dal.HomeDAO;
import Dal.LessonManageDAO;
import Model.Account;
import Model.Category;
import Model.CourseManageDTO;
import Model.Lesson;
import Util.ServerPath;
import Util.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.taglibs.standard.lang.jstl.ELException;

/**
 *
 * @author tuong
 */
@MultipartConfig
public class CourseManageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseManageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter o = response.getWriter();
        String cid = (String) request.getParameter("cid") == null ? "" : (String) request.getParameter("cid");
        String action = (String) request.getParameter("action") == null ? "" : (String) request.getParameter("action");
        
        
        HttpSession session = request.getSession();
        Account my_account = (Account) session.getAttribute("account");
        CourseManageDAO course_manage_DAO = new CourseManageDAO();
        ArrayList<CourseManageDTO> list_managed_course = course_manage_DAO.getMyManagedCourse(my_account.getAccount_id());
        request.setAttribute("list_managed_couse", list_managed_course);
        
        
//        read data lesson from database
        LessonManageDAO dao = new LessonManageDAO();
        ArrayList<Lesson> lessonList = null;
        try {
            lessonList = dao.getListlessonByCid(Integer.parseInt(cid));
            //o.print(lessonList);
        } catch (SQLException ex) {
            Logger.getLogger(CourseManageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }catch (Exception e) {
            
        }
        

        if (!(cid.isEmpty() && action.isEmpty())) {
            switch (action) {
                case "update":
                    request.setAttribute("cid", cid);
                    if(lessonList != null) {
                        request.setAttribute("lessonList", lessonList);
                    }
                    request.getRequestDispatcher("UpdateCourse.jsp").forward(request, response);
                    return;
                case "add_new_course": {
                    try {
                        addCourse(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(CourseManageServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                return;
                default:
                    throw new AssertionError();
            }
        }
        request.getRequestDispatcher("CourseManage.jsp").forward(request, response);
    }
//    public static void main(String[] args) {
//        CourseManageDAO course_manage_DAO = new CourseManageDAO();
//        ArrayList<CourseManageDTO> list_managed_course = course_manage_DAO.getMyManagedCourse(2);
//        System.out.println(list_managed_course.get(0).getCourse_name());
//    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String cid = (String) request.getParameter("cid") == null ? "" : (String) request.getParameter("cid");
        switch (action) {
            case "add_new_course":
                addNewCouseDoPost(request, response);
                break;
            case "delete":
                deleteCourse(cid, request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void deleteCourse(String cid, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseManageDAO course_manage_DAO = new CourseManageDAO();
        course_manage_DAO.deleteCourse(cid);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"success\": true}");
        out.flush();
    }
//    public static void main(String[] args) {
//        CourseManageServlet c = new CourseManageServlet();
//        c.deleteCourse("1");
//    }

    private void addCourse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HomeDAO dao = new HomeDAO();
        CourseDetailDAO cdDao = new CourseDetailDAO();
        ArrayList<Category> listCategory = dao.getAllCategory();

        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("AddNewCourse.jsp").forward(request, response);
    }

    private String createFileNameRandom(Part file_image_course) {
        String image_file_name = file_image_course.getSubmittedFileName();
        String[] image_file_name_split = image_file_name.split("\\.");

        image_file_name_split[0] = image_file_name_split[0] + (int) (Math.random() * 10000);
        image_file_name = image_file_name_split[0] + "." + image_file_name_split[1];

        return image_file_name;
    }

    private String insertImageIntoServer(HttpServletRequest request, String image_file_name, Part file_image_course) {
        String upload_directory = "/image_course"; // folder goc cua web khi builded
        //tra ve folder khi not_build
        String upload_path_to_project = ServerPath.getPathImageCouse() + File.separator + image_file_name;
        String upload_path_to_server = request.getServletContext().getRealPath(upload_directory).replaceFirst("build", "") + File.separator + image_file_name;

        String replacedPath = upload_path_to_project.replace("\\", "/");
        String replacePath_not_build = replacedPath.replaceFirst("//", "/");

//        String replacedPath_server = upload_path_to_server.replace("\\", "/");
        String replacePath_server_not_build = upload_path_to_server.replaceFirst("//", "/");
        try {
            FileOutputStream fos = new FileOutputStream(replacePath_not_build);
            InputStream is = file_image_course.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            FileOutputStream fos = new FileOutputStream(replacePath_server_not_build);
            InputStream is = file_image_course.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return replacePath_not_build;
    }

    private void addNewCouseDoPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Part file_image_course = request.getPart("image");
        String course_name = request.getParameter("courseName") == null ? "" : request.getParameter("courseName");
        String description = request.getParameter("description") == null ? "" : request.getParameter("description");
        String price = request.getParameter("price") == null ? "0" : request.getParameter("price");
        String discount = request.getParameter("discount") == null ? "0" : request.getParameter("discount");
        String category = request.getParameter("category") == null ? "" : request.getParameter("category");
        String study_time = request.getParameter("studyTime") == null ? "0h" : request.getParameter("studyTime");

        String[] fullFields = {course_name, description, category};

        request.setAttribute("price", price);
        request.setAttribute("discount", discount);
        request.setAttribute("study_time", study_time);

        String avt_path_in_server = "";
        if (file_image_course != null && file_image_course.getSize() > 0) {
            String image_file_name = createFileNameRandom(file_image_course);
            insertImageIntoServer(request, image_file_name, file_image_course);
            avt_path_in_server = "image_course/" + image_file_name;
            request.setAttribute("image", avt_path_in_server);
        }
        request.setAttribute("study_time", study_time);
        if (!Validation.checkString(course_name)) {
            request.setAttribute("course_name", course_name);
            request.setAttribute("error_name", "You must input course name!");
            request.getRequestDispatcher("AddNewCourse.jsp").forward(request, response);
        }
        if (!Validation.checkString(description)) {
            request.setAttribute("description", description);
            request.setAttribute("error_desciption", "You must input desciption!");
            request.getRequestDispatcher("AddNewCourse.jsp").forward(request, response);

        }
        if (!Validation.checkString(category)) {
            request.setAttribute("category", category);
            request.setAttribute("error_category", "You must choose category!");
            request.getRequestDispatcher("AddNewCourse.jsp").forward(request, response);
        }
        if (Validation.checkStringArray(fullFields)) {
            HttpSession session = request.getSession();
            Account my_account = (Account) session.getAttribute("account");
            CourseManageDAO course_manage_DAO = new CourseManageDAO();
            CourseManageDTO new_course = new CourseManageDTO(course_name, description, avt_path_in_server, Float.parseFloat(price), Float.parseFloat(discount), category, study_time);
            course_manage_DAO.insertCourse(my_account.getAccount_id(), new_course);
            response.sendRedirect("course-manage");
        }
    }

}
