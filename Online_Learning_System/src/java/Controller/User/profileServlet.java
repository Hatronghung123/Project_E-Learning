/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import Controller.CourseDetailServelet;
import Dal.AccountDAO;
import Dal.HomeDAO;
import Model.Account;
import Model.Category;
import Model.ProfileDTO;
import Util.ServerPath;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.client.fluent.Response;

/**
 *
 * @author tuong
 */
@MultipartConfig
public class profileServlet extends HttpServlet {

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
            out.println("<title>Servlet profileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profileServlet at " + request.getContextPath() + "</h1>");
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
        ProfileDTO profile = (ProfileDTO) session.getAttribute("profile");
        Account account = (Account) session.getAttribute("account");

         //hiện thị ra các category trên header
                displaycategory(request, response);
        
        session.setAttribute("profile", profile);
        session.setAttribute("account", account);
        //out.print(profile.isGender());
        request.getRequestDispatcher("Profile.jsp").forward(request, response);
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
        PrintWriter o = response.getWriter();
        HttpSession session = request.getSession();
//start get data from Profile.jsp 
        Part file_avt = request.getPart("avt");
        String fullname = request.getParameter("fullname") == null ? "" : request.getParameter("fullname");
        //String email = request.getParameter("email") == null ? "" : request.getParameter("email");
        String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
        boolean bool_gender = gender.equals("male");

        String password = ((Account) session.getAttribute("account")).getPassword();
        String old_password = request.getParameter("old_password") == null ? "" : request.getParameter("old_password");
        String new_password = request.getParameter("new_password") == null ? "" : request.getParameter("new_password");
        String re_new_password = request.getParameter("re_new_password") == null ? "" : request.getParameter("re_new_password");
//end get data from Profile.jsp

        AccountDAO accountDAO = new AccountDAO();
        ProfileDTO new_profile = (ProfileDTO) session.getAttribute("profile");
        Account new_account = (Account) session.getAttribute("account");

        if (file_avt != null && file_avt.getSize() > 0) {
            String avt_file_name = createFileNameRandom(file_avt);
            //insert selectted_image into server (not build)
            //String test_path = 
            insertImageIntoServer(request, avt_file_name, file_avt);
            String avt_path_in_server = "images/" + avt_file_name;
            new_profile.setAvt(avt_path_in_server);
            accountDAO.updateAvatar_ByAccId(avt_path_in_server, new_account.getAccount_id());
            //o.print();
        }

        if (fullname.isBlank()) {
            request.setAttribute("error", "You must have a name!");
        } else {
            //update db profile name
            Account account = (Account) session.getAttribute("account");
            accountDAO.updateFullName_ByAccId(fullname, account.getAccount_id());
            new_profile.setFullname(fullname);
        }
//        if (email.isBlank()) {
//            request.setAttribute("error", "You must have an email!");
//
//        } else if (!email.matches("[a-zA-Z0-9]+@([a-zA-Z]+.){1,2}[a-zA-Z]+")) {
//            request.setAttribute("error", "Please Enter Email matches with fomat email@domain.com");
//            request.setAttribute("email", email);
//
//        } else {
//            //update email vao db account
//            AccountDAO accountDAO = new AccountDAO();
//            Account account = (Account) session.getAttribute("account");
//            accountDAO.updateEmail_ByAccId(email, account.getAccount_id());
//            new_account.setEmail(email);
//
//            Cookie email_remember = new Cookie("email", email);
//            email_remember.setMaxAge(60 * 60 * 24);
//            response.addCookie(email_remember);
//        }

        if (!gender.equals("")) {
            //update gender vao db profile
            Account account = (Account) session.getAttribute("account");
            accountDAO.updateGender_ByAccId(bool_gender, account.getAccount_id());
            new_profile.setGender(bool_gender);
        }

        if (!(old_password.isBlank() && new_password.isBlank() && re_new_password.isBlank())) {

            if (!password.equals(old_password)) {
                request.setAttribute("error", "You inputed wrong old password!");

            } else {
                if (!new_password.equals(re_new_password)) {
                    request.setAttribute("error", "New passwords are not match!");

                } else {
                    if (new_password.length() < 8) {
                        //request.setAttribute("password", password);
                        request.setAttribute("error", "Password must be at least 8 characters!");
                    } else {
                        //update password
                        Account account = (Account) session.getAttribute("account");
                        accountDAO.updatePassword_ByAccId(new_password, account.getAccount_id());
                        new_account.setPassword(new_password);

                        Cookie password_remember = new Cookie("password", new_password);
                        password_remember.setMaxAge(60 * 60 * 24);
                        response.addCookie(password_remember);

                    }
                }
            }
        }

        session.setAttribute("profile", new_profile);
        session.setAttribute("account", new_account);

        session.setMaxInactiveInterval(60 * 30);

        request.getRequestDispatcher("Profile.jsp").forward(request, response);
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

    private String createFileNameRandom(Part file_avt) {
        String image_file_name = file_avt.getSubmittedFileName();
        String[] image_file_name_split = image_file_name.split("\\.");

        image_file_name_split[0] = image_file_name_split[0] + (int) (Math.random() * 10000);
        image_file_name = image_file_name_split[0] + "." + image_file_name_split[1];

        return image_file_name;
    }

    public static void main(String[] args) {

    }

    private String insertImageIntoServer(HttpServletRequest request, String avt_file_name, Part file_avt) {
        String upload_directory = "/images"; // folder goc cua web khi builded
        //tra ve folder khi not_build
        String upload_path_to_project = ServerPath.getPathImageCouse()+ File.separator + avt_file_name;
        String upload_path_to_server = request.getServletContext().getRealPath(upload_directory).replaceFirst("build", "") + File.separator + avt_file_name;
        
        String replacedPath = upload_path_to_project.replace("\\", "/");
        String replacePath_not_build = replacedPath.replaceFirst("//", "/");
        
        String replacedPath_server = upload_path_to_server.replace("\\", "/");
        String replacePath_server_not_build = upload_path_to_server.replaceFirst("//", "/");
        try {
            FileOutputStream fos = new FileOutputStream(replacePath_not_build);
            InputStream is = file_avt.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            FileOutputStream fos = new FileOutputStream(replacePath_server_not_build);
            InputStream is = file_avt.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return replacePath_not_build;
    }

    
        public void displaycategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HomeDAO dao = new HomeDAO();
            ArrayList<Category> listCategory = dao.getAllCategory();
            request.setAttribute("listCategory", listCategory);
        } catch (SQLException ex) {
            Logger.getLogger(CourseDetailServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
