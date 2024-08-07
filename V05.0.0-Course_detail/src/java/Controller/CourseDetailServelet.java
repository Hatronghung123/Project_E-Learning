/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.CourseDetailDAO;
import Model.Category;
import Model.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
public class CourseDetailServelet extends HttpServlet {

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
            out.println("<title>Servlet CourseDetailServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseDetailServelet at " + request.getContextPath() + "</h1>");
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
        try {
            String course_Id_str = request.getParameter("cid");
            int course_Id = 0;
            if (!course_Id_str.isBlank() && course_Id_str != null) {
                course_Id = Integer.parseInt(course_Id_str);
            }
            CourseDetailDAO cdDao = new CourseDetailDAO();
            ArrayList<Course> listCourst_Relate = cdDao.getRelateCourse(course_Id);
            ArrayList<Category> listAllCategory = cdDao.getCategoryById(course_Id);
            Course getCourseByID = cdDao.getCourseById(course_Id);
            
            //Định dạng khóa học theo giá tiền Việt Nam
            for(Course course : listCourst_Relate) {
                course.setFormattedPrice(formartPrice(course.getPrice()));
            }
            
            getCourseByID.setFormattedPrice(formartPrice(getCourseByID.getPrice()));
            
            request.setAttribute("listCourse_relate", listCourst_Relate);
            request.setAttribute("listAllCategory", listAllCategory);
            request.setAttribute("getCourseByID", getCourseByID);
//            out.print(getCourseByID.getImage());

        } catch (SQLException ex) {
            Logger.getLogger(CourseDetailServelet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
        String cid = request.getParameter("cid");

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

    
    public String formartPrice (int price) {
        NumberFormat formatTer = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatTer.format(price);
    }
    
    
}
