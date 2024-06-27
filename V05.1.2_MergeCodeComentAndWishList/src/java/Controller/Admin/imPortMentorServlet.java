/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Dal.AccountDAO;
import Model.Account;
import Model.ProfileDTO;
import Util.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
@WebServlet(name = "imPortMentorServlet", urlPatterns = {"/dasboard_for_admin/manageAccount"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class imPortMentorServlet extends HttpServlet {

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
            out.println("<title>Servlet imPortMentorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet imPortMentorServlet at " + request.getContextPath() + "</h1>");
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
        //response.getWriter().println("Mentor accounts imported and activated successfully.");

        AccountDAO accDao = new AccountDAO();
        ArrayList<Account> listAllAccount = accDao.getAllAccount();
        
        
        
        request.setAttribute("listAllAccount", listAllAccount);
        request.getRequestDispatcher("tables.jsp").forward(request, response);
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
        SendEmail sendMk = new SendEmail();
        Part filePart = request.getPart("file");
        if (filePart == null) {
            response.getWriter().println("No file uploaded.");
            return;
        }

        // Xử lý file và đọc dữ liệu từ file Excel
        try (InputStream fileContent = filePart.getInputStream(); Workbook workbook = new XSSFWorkbook(fileContent)) {

            Sheet sheet = workbook.getSheetAt(0);
            AccountDAO accDao = new AccountDAO();
            Iterator<Row> rowIterator = sheet.iterator();

            // Bỏ qua hàng tiêu đề
            if (rowIterator.hasNext()) {
                rowIterator.next();
            }

            // Đọc dữ liệu từ các hàng
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                String email = getCellValue(row.getCell(0));

                // Kiểm tra nếu email đã tồn tại
                if (accDao.checkAccountExist(email)) {
                    response.getWriter().println("Email already exists: " + email);
                    continue; // bỏ qua tài khoản này và tiếp tục với tài khoản khác
                }

                // Tạo mật khẩu ngẫu nhiên
                String password = generateRandomPassword(8);

                // Tạo đối tượng tài khoản và hồ sơ
                Account account = new Account(email, password, 3);
                ProfileDTO profile = new ProfileDTO("", 0);

                // Thêm vào database
                accDao.insertUser(account, profile);

                // Gửi email mật khẩu tới mentor
                Runnable sendEmailTask = new Runnable() {
                    @Override
                    public void run() {

                        sendMk.send("hatronghung7777@gmail.com", "chnzvsbysoeesgwe", email, "Account Activation",
                                "Dear mentor,\nYour account has been activated. Your password is: " + password, response);
                    }
                };

                // Thực thi Runnable trong một luồng mới
                new Thread(sendEmailTask).start();
            }

            response.getWriter().println("Mentor accounts imported and activated successfully.");

        } catch (Exception e) {
            response.getWriter().println("An error occurred while processing the file: " + e.getMessage());
            e.printStackTrace(response.getWriter());
        }

        response.sendRedirect("manageAccount");
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

    // Hàm lấy giá trị ô kiểu chuỗi
    private String getCellValue(Cell cell) {
        if (cell == null) {
            return null;
        }
        return cell.getCellType() == CellType.STRING ? cell.getStringCellValue() : cell.toString();
    }

    // Tạo mật khẩu ngẫu nhiên
    private static String generateRandomPassword(int length) {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[length];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes).substring(0, length);
    }

}
