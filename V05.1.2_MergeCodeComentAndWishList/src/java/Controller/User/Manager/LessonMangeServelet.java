/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User.Manager;

import Model.Module;

import Dal.LessonManageDAO;
import Model.Lesson;
import YoutubeAPI.YoutubeDuration;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
@WebServlet(name = "LessonManageServelet", urlPatterns = {"/LessonManage"})
public class LessonMangeServelet extends HttpServlet {

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
            out.println("<title>Servlet LessonMangeServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonMangeServelet at " + request.getContextPath() + "</h1>");
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
        String course_id = request.getParameter("cid");

        LessonManageDAO dao = new LessonManageDAO();
        try {
            ArrayList<Module> listModule = dao.getListModuleByCid(Integer.parseInt(course_id));
            request.setAttribute("listModule", listModule);
        } catch (SQLException ex) {
            Logger.getLogger(LessonMangeServelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            e.printStackTrace();
        }

        updateLessonDoGet(request, response);
        request.getRequestDispatcher("mentor_add_lesson.jsp").forward(request, response);

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
        String action = (request.getParameter("action") == null) ? "" : request.getParameter("action");

        switch (action) {
            case "addlesson":
                AddLesson(request, response);
                break;
            case "deletelesson":
                 deleteLesson(request, response);
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

    public long getDuraton(String videoLink) {
        String videoId = YoutubeDuration.extractVideoId(videoLink);
        long duration = YoutubeDuration.getVideoDuration(videoId);

        return duration;
    }

    private void AddLesson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String lessonName = request.getParameter("lessonName");
        String moduleid = request.getParameter("module");
        String lessonContent = request.getParameter("lessonContent");
        String videoLink = request.getParameter("videoLink");
        long duration = getDuraton(videoLink);
        LessonManageDAO dao = new LessonManageDAO();
        Lesson lesson = new Lesson(Integer.parseInt(moduleid), lessonName, lessonContent, videoLink, duration);
        dao.InsertComment(lesson);
        response.sendRedirect("course-manage?cid=" + cid + "&action=update");
    }

    private void deleteLesson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonid = request.getParameter("lessonid");
        String cid = request.getParameter("cid");
        LessonManageDAO dao = new LessonManageDAO();
        try {
            dao.deleteLessonByLessonId(Integer.parseInt(lessonid));
        } catch (Exception e) {
        }

        response.sendRedirect("course-manage?cid=" + cid + "&action=update");
    }

    
     private void updateLessonDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonid = request.getParameter("lessonid");
        
        LessonManageDAO dao = new LessonManageDAO();
        Lesson lesson = null;
        try {
           lesson = dao.getlessonByLessonid(Integer.parseInt(lessonid));
        } catch (SQLException ex) {
            Logger.getLogger(LessonMangeServelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            
        }
        request.setAttribute("lesson", lesson);
        
    }
    
    
     private void updateLessonDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String lessonName = request.getParameter("lessonName");
        String moduleid = request.getParameter("moduleid");
        String lessonContent = request.getParameter("lessonContent");
        String videoLink = request.getParameter("lessonVideo");
        long duration = getDuraton(videoLink);
        LessonManageDAO dao = new LessonManageDAO();
        Lesson lesson = new Lesson(Integer.parseInt(moduleid), lessonName, lessonContent, videoLink, duration);
        dao.InsertComment(lesson);
        response.sendRedirect("course-manage?cid=" + cid + "&action=update");
    }
    
}
