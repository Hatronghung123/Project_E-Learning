/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
@WebServlet(name = "getBillServlet", urlPatterns = {"/bill"})
public class getBillServlet extends HttpServlet {

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
            out.println("<title>Servlet getBillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getBillServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String accId = request.getParameter("accId");
        String coureId = request.getParameter("courseId");
        String date = request.getParameter("date");
        String money = request.getParameter("money");
        String ndtt = request.getParameter("ndck");
        
        
        String err = "";
        if(accId.isBlank() || coureId.isBlank() || date.isBlank() || money.isBlank() || ndtt.isBlank()) {
            err = "Loi roi! Chua Nhap gi dung khong";
        } else {
            String dateFormat = formaDate(date);
        }
        response.sendRedirect("mentee_my_lesson.jsp");
        
        

    }
    
    private String formaDate(String Date) {
        String year = "";
        String month = "";
        String day = "";
        String hour = "";
        String munite = "";
        String second = "";


        for(int i = 0; i < Date.length(); i++) {
            if(i < 4) {
                year += Date.charAt(i);
            } else if(i < 6) {
                month +=Date.charAt(i);
            } else if(i < 8) {
                day += Date.charAt(i);
            } else if(i < 10) {
                hour += Date.charAt(i);
            } else if(i < 12) {
                munite += Date.charAt(i);
            } else {
                second += Date.charAt(i);
            }
        }
        return year +"-"+month+"-"+day+" "+hour+":"+munite+":"+second;
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
