/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.AccountDAO;
import Entities.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tuong
 */
public class homeServlet extends HttpServlet {

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
            out.println("<title>Servlet homeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        Cookie cookie[] = request.getCookies();
        
        //check xem trong cookie co luu email va password ko
        boolean check_remember_email = false;
        boolean check_remember_password = false;

        String email = "";
        String password = "";

        for (Cookie c : cookie) {
            if (c.getName().equals("email")) {
                request.setAttribute("email", c.getValue());
                email = c.getValue();
                check_remember_email = true;
            } 
            if (c.getName().equals("password")) {
                check_remember_password = true;
                password = c.getValue();
                request.setAttribute("password", c.getValue());
            } 
        }
        
        // Neu trong cookie da luu tai khoan roi thi tu dong dang nhap luon
        if (check_remember_email && check_remember_password) {
            AccountDAO accountDAO = new AccountDAO();
            HttpSession session = request.getSession();
            Account account_input = new Account(password, email);
            Account accountFoundByEmailPass = accountDAO.findByEmailAndPass(account_input);
            Account account_email_exist = accountDAO.findByEmail(email);

            session.setAttribute("account", accountFoundByEmailPass);
            session.setMaxInactiveInterval(60 * 30);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;

        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
