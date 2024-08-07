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
public class joinServlet extends HttpServlet {

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
            out.println("<title>Servlet joinServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet joinServlet at " + request.getContextPath() + "</h1>");
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

        //check account da ton tai trong session chua!
        Account account_exist_session = (Account) session.getAttribute("account");
        if (account_exist_session != null) {
            String action = request.getParameter("action") == null ? "" : request.getParameter("action");
            switch (action) {
                case "logout":
                    logOutDoGet(request, response);
                    break;
                case "hello":
                    out.print("Hello World!");
                    break;
                default:
                    response.sendRedirect("home");
            }
            return;
        } else {
            String action = request.getParameter("action") == null
                    ? ""
                    : request.getParameter("action");
            switch (action) {
                case "login":
                    logInDoGet(request, response);
                    break;
                case "signup":
                    signUpDoGet(request, response);
                    break;
                case "logout":
                    logOutDoGet(request, response);
                    break;
                case "hello":
                    out.print("Hello World!");
                    out.print(session.getMaxInactiveInterval());
                    break;
                default:
                    response.sendRedirect("home");
                //request.getRequestDispatcher("Login.jsp").forward(request, response);
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

        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");

        switch (action) {
            case "login":
                logInDoPost(request, response);
                break;
            case "signup":
                signUpDoPost(request, response);
                break;
            case "logout":
                logOutDoGet(request, response);
                break;

            default:
            //request.getRequestDispatcher("Login.jsp").forward(request, response);
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

    private void logOutDoGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        //Cookie email_remember = new Cookie("email", (String)session.getAttribute("email"));
        Cookie password_remember = new Cookie("password", (String) session.getAttribute("password"));

        //email_remember.setMaxAge(0);
        password_remember.setMaxAge(0);
        //response.addCookie(email_remember);
        response.addCookie(password_remember);

        session.removeAttribute("account");
        response.sendRedirect("home");
    }

    private void logInDoGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        Cookie cookie[] = request.getCookies();
        boolean check_remember_true = false;

        String email = "";
        String password = "";

        for (Cookie c : cookie) {
            if (c.getName().equals("email")) {
                request.setAttribute("email", c.getValue());
                email = c.getValue();
                check_remember_true = true;
            } else {
                check_remember_true = false;
            }
            if (c.getName().equals("password")) {
                check_remember_true = true;
                password = c.getValue();
                request.setAttribute("password", c.getValue());
            } else {
                check_remember_true = false;
            }
        }
        request.setAttribute("check_remember", check_remember_true);
//        // Neu trong cookie da luu tai khoan roi thi tu dong dang nhap luon
//        if (check_remember_true) {
//            AccountDAO accountDAO = new AccountDAO();
//            HttpSession session = request.getSession();
//            Account account_input = new Account(password, email);
//            Account accountFoundByEmailPass = accountDAO.findByEmailAndPass(account_input);
//            if (accountFoundByEmailPass != null) {
//                session.setAttribute("account", accountFoundByEmailPass);
//                session.setMaxInactiveInterval(60 * 30);
//                response.sendRedirect("home");
//                return;
//            } else {
//                request.setAttribute("message", "This account was NOT found!");
//                request.setAttribute("email", email);
//                //request.setAttribute("password", password);
//                request.getRequestDispatcher("Login.jsp").forward(request, response);
//                return;
//            }
//
//        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    private void signUpDoGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
    }

    private void logInDoPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        // get về thông tin người dùng nhậps
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember_me = request.getParameter("remember-me") == null ? "" : "on";
        if (email.isBlank() || password.isBlank()) {
            request.setAttribute("message", "Please input all the fields!");
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        //check format email
        if (!email.matches("[a-zA-Z0-9]+@([a-zA-Z]+.){1,2}[a-zA-Z]+")) {
            request.setAttribute("message", "Please Enter Email matches with fomat email@domain.com");
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        // kiểm tra thông tin có tồn tại trong db hay không
        Account account_input = new Account(password, email);
        Account accountFoundByEmailPass = accountDAO.findByEmailAndPass(account_input);
        Account acc_by_email = accountDAO.checkAccountIsExit(account_input);

        //kiem tra email co chua? Neu co roi ma sai mat khau thi in ra message ban nhap sai mat khau
        if (acc_by_email != null && accountFoundByEmailPass == null) {
            request.setAttribute("message", "The password you entered is incorrect!");
            request.setAttribute("email", email);
            //request.setAttribute("password", password);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        //acc co trong db
        if (accountFoundByEmailPass != null) {
            Cookie email_remember = new Cookie("email", email);
            Cookie password_remember = new Cookie("password", password);
            //check xem co tich vao remember me ko de luu vao cookie
            if (remember_me.equals("on")) {
                email_remember.setMaxAge(60 * 60 * 24); //1 day
                password_remember.setMaxAge(60 * 60 * 24);

                session.setAttribute("account", accountFoundByEmailPass);
                session.setMaxInactiveInterval(60 * 60 * 10);

                response.addCookie(email_remember);
                response.addCookie(password_remember);
                response.sendRedirect("home");
                return;
            } else {
                email_remember.setMaxAge(0);
                password_remember.setMaxAge(0);
                response.addCookie(email_remember);
                response.addCookie(password_remember);

                session.setAttribute("account", accountFoundByEmailPass);
                session.setMaxInactiveInterval(60 * 60 * 10);   //set time account exist in session 10 hours
                //request.getRequestDispatcher("home").forward(request, response);
                response.sendRedirect("home");
                return;
            }

        } else {    //acc ko co trong db
            request.setAttribute("message", "This account was NOT found!");
            request.setAttribute("email", email);
            //request.setAttribute("password", password);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    private void signUpDoPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        //get Parameters
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String re_pass = request.getParameter("re_pass");
        String email = request.getParameter("email");
        String check_agree_terms = request.getParameter("agree-term") == null ? "" : "on";

        //check da nhap du du lieu chua
        if (fullname.isBlank() || password.isBlank() || re_pass.isBlank() || email.isBlank()) {
            request.setAttribute("fullname", fullname);
            //request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("error", "Please input all the fields!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        // kiểm tra xem người dùng đã nhập đúng format chưa
        if (!email.matches("[a-zA-Z0-9]+@([a-zA-Z]+.){1,2}[a-zA-Z]+")) {
            request.setAttribute("error", "Please Enter Email matches with fomat email@domain.com");
            request.setAttribute("email", email);
            request.setAttribute("fullname", fullname);
            //request.setAttribute("password", password);
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        //check pass va re_pass co duplicate ko?
        if (!password.equalsIgnoreCase(re_pass)) {
            request.setAttribute("fullname", fullname);
            //request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        //check pass phai du 6 ki tu, etc.
        if (password.length() < 8) {
            request.setAttribute("fullname", fullname);
            //request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("error", "Password must be at least 8 characters, including uppercase letters, lowercase letters, numbers and special characters!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        //check da tich vao checkbox agree terms chua
        if (!check_agree_terms.equals("on")) {
            request.setAttribute("fullname", fullname);
            request.setAttribute("password", password);
            request.setAttribute("re_pass", re_pass);
            request.setAttribute("email", email);
            request.setAttribute("error", "You must agree all statements in Our Terms!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        // kiểm tra xem username đã tồn tại trong db chưa
        Account account = new Account(fullname, password, email);
        // nếu rồi thì hiển thị lỗi quay trở lại trang sign up
        Account accountFoundByNamePass = accountDAO.checkAccountIsExit(account);
        if (accountFoundByNamePass != null) {
            request.setAttribute("fullname", fullname);
            //request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("error1", "Account is exist !!!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        } else {
            // nếu chưa thì inser vào trong db, chuyển dến trang home
            accountDAO.insertAccount(account);
            Account account_check = new Account(password, email);
            Account account_login = accountDAO.findByEmailAndPass(account_check);
            session.setAttribute("account", account_login);
            session.setMaxInactiveInterval(60 * 60 * 10);
            response.sendRedirect("home");
        }

    }

}
