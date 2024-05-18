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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hatro
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "logout":
                loginOutDoGet(request, response);
                break;
            default:
                request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        // get về thông tin người dùng nhậps
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // kiểm tra thông tin có tồn tại trong db hay không
        Account account = new Account(password, email);
        Account accountFoundByNamePass = accountDAO.findByEmailAndPass(account);
        if (accountFoundByNamePass != null) {
            session.setAttribute("account", accountFoundByNamePass);
            session.setMaxInactiveInterval(60 * 60 * 10);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        } else {
            session.setAttribute("error2", "Email or Password incorrect !!");
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            response.sendRedirect("index.jsp?openModal=true");
            //request.getRequestDispatcher("index.jsp?openModal=true").forward(request, response);
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

    private void loginOutDoGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession();
        session.removeAttribute("account");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
