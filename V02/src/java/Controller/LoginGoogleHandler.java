/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.AccountDAO;
import Entities.Account;
import Entities.AccountGoogle;
import Until.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

/**
 *
 * @author hatro
 */
public class LoginGoogleHandler extends HttpServlet {

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
            out.println("<title>Servlet LoginGoogleHandler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginGoogleHandler at " + request.getContextPath() + "</h1>");
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
        SendEmail sendPassword = new SendEmail();
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        //neu nguoi dung huy uy quyen
        if (error != null) {
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        AccountGoogle acc = gg.getUserInfo(accessToken);

        // tạo mật khẩu ngẫu nhiên cho chức năng login with google
        String password = generateRandomPassword();
        AccountDAO accountDAO = new AccountDAO();
        
        
        Account account_to_find = new Account(acc.getName(), password, acc.getEmail());
        if(accountDAO.findByEmail(account_to_find) == null){
            accountDAO.insertAccount(account_to_find);
            sendPassword.send("hatronghung7777@gmail.com", "chnzvsbysoeesgwe", acc.getEmail(), "đây là mật khẩu của bạn",password, response );
            
        }
            Account account_login = accountDAO.findByEmail(account_to_find);
            
        
        HttpSession session = request.getSession();
        session.setAttribute("account", account_login);
        request.getRequestDispatcher("Home.jsp").forward(request, response);

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

    private String generateRandomPassword() {
        Random random = new Random();
        String password = "";
        int number;
        for (int i = 0; i < 8; i++) {
            int randomNumber = Math.abs(random.nextInt()) % 62;
            // if radom number < 26 -> plus with 65 to get A - Z char
            if (randomNumber < 26) {
                number = randomNumber + 65;
            } // if radom number < 52 - > plus base with 71 to get a - z char
            else if (randomNumber < 52) {
                number = (randomNumber - 26) + 97;
            } // else sub random number with 4 to get 0 -> 9 digit
            else {
                number = randomNumber - 4;
            }
            char character = (char) number;
            password = password + character;
        }
        return password;
    }

}
