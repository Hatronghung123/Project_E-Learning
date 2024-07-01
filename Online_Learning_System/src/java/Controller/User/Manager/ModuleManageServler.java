/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User.Manager;

import Dal.CourseManageDAO;
import Dal.LessonManageDAO;
import Dal.ModuleDAO;
import Model.AccountDTO;
import Model.CourseManageDTO;
import Model.LessonDTO;
import Model.ModuleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tuong
 */
public class ModuleManageServler extends HttpServlet {

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
            out.println("<title>Servlet ModuleManageServler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModuleManageServler at " + request.getContextPath() + "</h1>");
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
        String module_id = request.getParameter("moduleId");
        String cid = request.getParameter("cid");
        LessonManageDAO lesson_manage_dao = new LessonManageDAO();
        ModuleDAO module_dao = new ModuleDAO();
        CourseManageDAO course_manage_DAO = new CourseManageDAO();
        HttpSession session = request.getSession();
        AccountDTO my_account = (AccountDTO) session.getAttribute("account");
        
        ArrayList<LessonDTO> list_lesson_by_moduleId = lesson_manage_dao.getListlessonByModuleId(module_id);
        CourseManageDTO my_managed_course = course_manage_DAO.getMyManagedCourseById(my_account.getAccount_id(), cid);
        request.setAttribute("list_lesson_in_module", list_lesson_by_moduleId);
        ArrayList<ModuleDTO> list_module = module_dao.getListModulByCid(cid);
        request.setAttribute("list_module", list_module);
        request.setAttribute("cid", cid);
        request.setAttribute("module", module_id);
        request.setAttribute("my_managed_course", my_managed_course);
        request.getRequestDispatcher("EditModule.jsp").forward(request, response);
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
        processRequest(request, response);
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

}
