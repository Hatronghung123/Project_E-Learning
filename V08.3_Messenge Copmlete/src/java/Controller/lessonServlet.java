
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.DisscussionDAO;
import Dal.LessonDAO;
import Dal.MessengerDAO;
import Model.Account;
import Model.Course;
import Model.DiscussionLesson;
import Model.Enrollment;
import Model.Lesson;
import Model.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
public class lessonServlet extends HttpServlet {

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
            out.println("<title>Servlet lessonServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lessonServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        LessonDAO dao = new LessonDAO();
        DisscussionDAO discussDao = new DisscussionDAO();
     
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        

        String courseid_str = request.getParameter("cid");
        String lessonid_str = request.getParameter("lessonid");
        
        int course_id = 0;
        int lesson_id = 0;
//        int profile_id =0;
        
        if (courseid_str != null && lessonid_str != null ) {
            course_id = Integer.parseInt(courseid_str);
            lesson_id = Integer.parseInt(lessonid_str);
             
        }

        // Kiểm tra nếu session không có thuộc tính 'user' thì chuyển hướng về trang đăng nhập
        if (acc == null) {
            response.sendRedirect("join?action=login");
            return;
        } else {

            try {

                //Kiểm tra người dùng nếu chưa mua khóa học mà truy cập đường link thì chuyển về home
                ArrayList<Enrollment> listEnrollment = dao.getEnrollmentByAccountId(acc.getAccount_id());
                if (!isPaid(course_id, listEnrollment)) {
                    response.sendRedirect("home");
                    return;
                }

                ArrayList<Model.Module> moduleList = dao.getListModulByCid(course_id);
                Lesson lesson = dao.getlessonByCid(course_id, lesson_id);
                ArrayList<Lesson> lessonList = dao.getListModulByCidd(course_id);
                
             
                
//                List all comment 
                ArrayList<DiscussionLesson> allComments = discussDao.getCommentsByLesson(lesson_id);
//                    // Phân tách comments chính và các replies
                ArrayList<DiscussionLesson> mainComments = new ArrayList<>();
                Map<Integer, List<DiscussionLesson>> repliesMap = new HashMap<>();

                for (DiscussionLesson comment : allComments) {
                    if (comment.getParentId() == null || comment.getParentId() == 0) {
                        mainComments.add(comment);
                    } else {
                        int parentId = comment.getParentId();
                        if (!repliesMap.containsKey(parentId)) {
                            repliesMap.put(parentId, new ArrayList<>());
                        }
                        repliesMap.get(parentId).add(comment);
                    }
                }


                // Đặt các thuộc tính cho JSP
                request.setAttribute("mainComments", mainComments);
                request.setAttribute("repliesMap", repliesMap);

//                out.print(parentCommentid);
                request.setAttribute("lesson", lesson);
                request.setAttribute("moduleList", moduleList);
                request.setAttribute("lessonList", lessonList);
                request.setAttribute("listEnrollment", listEnrollment);
            } catch (SQLException ex) {
                Logger.getLogger(lessonServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.getRequestDispatcher("mentee_my_lesson.jsp").forward(request, response);

    }

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
       
        String status = (request.getParameter("status") == null) ? "" : request.getParameter("status");
        
        switch (status) {
            case "insert":
                 insertComent(request, response);
                break;
            case "delete":
                deleteComent(request, response);
                break;
            default:
                throw new AssertionError();
        }
        
    }

    public void deleteComent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String parentCommentId = request.getParameter("parent");
        String disscusionId = request.getParameter("disscussID");
        String cid = request.getParameter("cid");
        String lessonid= request.getParameter("lessonid");
        
//        out.print(parentCommentId);
        DisscussionDAO dao = new DisscussionDAO();
        if(parentCommentId.equals("null")) {
            //delete comment cha và delete tất comment reply
            
            dao.deleteComent(Integer.parseInt(disscusionId));
           
            response.sendRedirect("lesson?cid=" + cid + "&lessonid=" + lessonid);
        } else {
            //delete 1 comment repy
            dao.deleteMainComment(Integer.parseInt(disscusionId));
            response.sendRedirect("lesson?cid=" + cid + "&lessonid=" + lessonid);
        }
        
        
    }

    public void insertComent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String parentComentId_str = request.getParameter("parent");

        Integer parentCommentId = null;
        if (parentComentId_str != null && !parentComentId_str.isEmpty() && !"null".equals(parentComentId_str)) {
            parentCommentId = Integer.parseInt(parentComentId_str);
        }

        String comment = request.getParameter("content");
        String cid = request.getParameter("cid");
        Account acc = (Account) session.getAttribute("account");
        String lession_id = request.getParameter("lessonid");

        DisscussionDAO dao = new DisscussionDAO();
        DiscussionLesson discuss = new DiscussionLesson(parentCommentId, acc.getAccount_id(), Integer.parseInt(lession_id), comment, new Timestamp(System.currentTimeMillis()));
        dao.InsertComment(discuss);
        response.sendRedirect("lesson?cid=" + cid + "&lessonid=" + lession_id);
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

    //Kiểm tra xem người dùng đã mua khóa học này hay chưa nếu chưa thì chuyển về home
    private boolean isPaid(int cid, ArrayList<Enrollment> enrollmentList) {
        for (Enrollment e : enrollmentList) {
            if (cid == e.getCourseid()) {
                return true;
            }
        }

        return false;
    }

}
