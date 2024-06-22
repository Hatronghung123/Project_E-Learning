/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.AccountDAO;
import Dal.MessengerDAO;
import Model.Account;
import Model.DiscussionLesson;
import Model.Enrollment;
import Model.Lesson;
import Model.Messenger;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MessengerSeverlet", urlPatterns = {"/messenger"})
public class MessengerSeverlet extends HttpServlet {

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
            out.println("<title>Servlet MessengerSeverlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessengerSeverlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        MessengerDAO messDAO = new MessengerDAO();
        AccountDAO accDAO = new AccountDAO();
        Account account_exist_session = (Account) session.getAttribute("account");
        int send_id = Integer.parseInt(request.getParameter("send_id"));
        int receiver_id = Integer.parseInt(request.getParameter("receiver_id"));
        if (account_exist_session == null) {
            response.sendRedirect("join?action=login");
            return;
        } else {

            try {

                //Kiểm tra người dùng nếu chưa mua khóa học mà truy cập đường link thì chuyển về home
//                ArrayList<Enrollment> listEnrollment = dao.getEnrollmentByAccountId(acc.getAccount_id());;
//                if (!isPaid(course_id, listEnrollment)) {
//                    response.sendRedirect("home");
//                    return;
//                }

//                ArrayList<Model.Module> moduleList = dao.getListModulByCid(course_id);
//                Lesson lesson = dao.getlessonByCid(course_id, lesson_id);
//                ArrayList<Lesson> lessonList = dao.getListModulByCidd(course_id);

//                List all mess 
                ArrayList<Messenger> listmess = messDAO.getListMessengerBetween2User(send_id,receiver_id);
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
//
//                // Debug: Print out the contents of repliesMap
//                if (repliesMap.isEmpty()) {
//                    out.print("repliesMap is empty.");
//                } else {
//                    out.print("repliesMap has data:");
//                    for (Map.Entry<Integer, List<DiscussionLesson>> entry : repliesMap.entrySet()) {
//                        Integer parentId = entry.getKey();
//                        List<DiscussionLesson> replies = entry.getValue();
//                        out.print("Parent ID: " + parentId + ", Number of replies: " + replies.size());
//
//                        for (DiscussionLesson reply : replies) {
//                            out.print("Reply ID: " + reply.getDisscussionID()+ ", Content: " + reply.getComment());
//                        }
//                    }
//                }

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
