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
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
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
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // kiểm tra xem người dùng đã nhập đúng format chưa
        if (!email.matches("[a-zA-Z0-9]+@([a-zA-Z]+.){1,2}[a-zA-Z]+")) {
            request.setAttribute("error", "Please Enter Email matches with fomat A@gmail.com");
            request.setAttribute("fullname", fullname);
            request.setAttribute("password", password);
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        } else {
            // kiểm tra xem username đã tồn tại trong db chưa
            Account account = new Account(fullname, password, email);
            // nếu rồi thì hiển thị lỗi quay trở lại trang sign up
            Account accountFoundByNamePass = accountDAO.checkAccountIsExit(account);
            if (accountFoundByNamePass != null) {
                request.setAttribute("fullname", fullname);
                request.setAttribute("password", password);
                request.setAttribute("email", email);
                request.setAttribute("error1", "Account is exit !!!");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                return;
            } else {
                // nếu chưa thì chuyển dến trang login, inser vào trong db
                accountDAO.insertAccount(account);
                Account account_check = new Account(password, email);
                Account account_login = accountDAO.findByEmailAndPass(account_check);
                session.setAttribute("account", account_login);
                session.setMaxInactiveInterval(60 * 60 * 10);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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

}
