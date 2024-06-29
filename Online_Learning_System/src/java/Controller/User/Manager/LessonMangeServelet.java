/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User.Manager;

import Model.ModuleDTO;

import Dal.LessonManageDAO;
import Model.LessonDTO;
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
        String action = request.getParameter("action");

        LessonManageDAO dao = new LessonManageDAO();
        try {
            //Lấy ra được list module theo course id khi add hoặc update
            ArrayList<ModuleDTO> listModule = dao.getListModuleByCid(Integer.parseInt(course_id));
            
            // Kiểm tra action
            if ("updatelesson".equals(action)) {
                updateLessonDoGet(request, response);
            }
            
            request.setAttribute("listModule", listModule);
            request.setAttribute("action", action);
            request.setAttribute("cid", course_id);
        } catch (SQLException ex) {
            Logger.getLogger(LessonMangeServelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("mentor_add_update_lesson.jsp").forward(request, response);
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
            case "updatelesson":
                updateLessonDoPost(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action specified.");
                break;
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

    
    //thêm một lesson mới vào database
    private void AddLesson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String lessonName = request.getParameter("lessonName");
        String moduleid = request.getParameter("module");
        String lessonContent = request.getParameter("lessonContent");
        String videoLink = request.getParameter("videoLink");
        long duration = getDuraton(videoLink);
        LessonManageDAO dao = new LessonManageDAO();
        try {
            LessonDTO lesson = new LessonDTO(Integer.parseInt(moduleid), lessonName, lessonContent, videoLink, duration);
            dao.InsertLesson(lesson);
        } catch (Exception e) {
        }

        response.sendRedirect("course-manage?cid=" + cid + "&action=update");
    }

    //xóa lesson ra khỏi database
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

    //Hiện thị thông tin cua lesson cũ lên form
    private void updateLessonDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lessonid = request.getParameter("lessonid");

        LessonManageDAO dao = new LessonManageDAO();
        LessonDTO lesson = null;
        try {
            lesson = dao.getlessonByLessonid(Integer.parseInt(lessonid));
        } catch (SQLException ex) {
            Logger.getLogger(LessonMangeServelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {

        }
        request.setAttribute("lesson", lesson);

    }

    //Update dữ liệu mới vào database
    private void updateLessonDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String lessonid = request.getParameter("lessonid");
        String lessonName = request.getParameter("lessonName");
        String moduleid = request.getParameter("module");
        String lessonContent = request.getParameter("lessonContent");
        String videoLink = request.getParameter("videoLink");
        long duration = getDuraton(videoLink);
        LessonManageDAO dao = new LessonManageDAO();
        try {
            LessonDTO lesson = new LessonDTO(Integer.parseInt(lessonid), Integer.parseInt(moduleid), lessonName, lessonContent, videoLink, duration);
            dao.updateLesson(lesson);
            response.sendRedirect("course-manage?cid=" + cid + "&action=update");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
