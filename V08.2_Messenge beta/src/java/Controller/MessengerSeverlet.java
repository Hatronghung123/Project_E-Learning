/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.MessengerDAO;
import Model.Account;
import Model.Messenger;
import Model.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
        
       
        HttpSession session = request.getSession();
        MessengerDAO messDAO = new MessengerDAO();
        int receiver_id = Integer.parseInt(request.getParameter("pid"));
        Account account_exist_session = (Account) session.getAttribute("account");

        // Redirect to login page if no user is logged in
        if (account_exist_session == null) {
            response.sendRedirect("join?action=login");
            return;
        }
        
        try {
            
            int send_id = account_exist_session.getAccount_id();
            
//            String selectedUserIdParam = request.getParameter("selectedUserId");
//            Integer selectedUserId = selectedUserIdParam != null ? Integer.parseInt(selectedUserIdParam) : null;
            Profile listProfile = messDAO.getProfileById(receiver_id);
            ArrayList<Messenger> listMessages = messDAO.getListMessengerBetween2User(send_id, receiver_id);
            ArrayList<Messenger> listUser = messDAO.getUsersWhoMessaged(send_id);
           // response.getWriter().print(listProfile);
            request.setAttribute("listUser", listUser);
            request.setAttribute("listMessages", listMessages);
            request.setAttribute("listProfile", listProfile);
            //System.out.println(listUser);
        } catch (SQLException ex) {
            Logger.getLogger(Messenger.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("errorPage");
        }
        request.getRequestDispatcher("Messenger.jsp").forward(request, response);
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
//        response.setContentType("text/html;charset=UTF-8");
//        
//        HttpSession session = request.getSession();
//        Account accountInSession = (Account) session.getAttribute("account");
//
//        // Redirect to login if no user is in session
//        if (accountInSession == null) {
//            response.sendRedirect("join?action=login");
//            return;
//        }
//        
//        try (PrintWriter out = response.getWriter()) {
//            
//            String receiverIdParam = request.getParameter("receiver_id");
//            String messageText = request.getParameter("message_text");
//            if (receiverIdParam == null || messageText == null || messageText.trim().isEmpty()) {
//                request.setAttribute("errorMessage", "Message text or receiver ID is missing.");
//                request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
//                return;
//            }
//            
//            int receiverId = Integer.parseInt(receiverIdParam);
//            int senderId = accountInSession.getAccount_id();
//            
//            Messenger message = new Messenger(senderId, receiverId, messageText, new Timestamp(System.currentTimeMillis()));
//            MessengerDAO messageDAO = new MessengerDAO();
//            messageDAO.insertNewMessenger(message);
//
//            // Redirect to the messenger page with the receiver's ID to continue the conversation
//            response.sendRedirect("messenger?receiver_id=" + receiverId);
//        } catch (NumberFormatException e) {
//            // If 'receiver_id' is not an integer
//            request.setAttribute("errorMessage", "Invalid receiver ID.");
//            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
//        }
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
