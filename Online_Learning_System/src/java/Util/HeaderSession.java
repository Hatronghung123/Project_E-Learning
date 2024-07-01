/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import Controller.CourseDetailServelet;
import Dal.HomeDAO;
import Model.AccountDTO;
import Model.Category;
import Model.ProfileDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tuong
 */
public class HeaderSession {

    public HeaderSession(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        ProfileDTO profile = (ProfileDTO) session.getAttribute("profile");
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        session.setAttribute("profile", profile);
        session.setAttribute("account", account);
//get list category
        try {
            HomeDAO dao = new HomeDAO();
            ArrayList<Category> listCategory = dao.getAllCategory();
            session.setAttribute("listCategory", listCategory);
        } catch (SQLException ex) {
            Logger.getLogger(CourseDetailServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        session.setMaxInactiveInterval(60 * 30);
    }

//    public void displaycategory(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            HomeDAO dao = new HomeDAO();
//            ArrayList<Category> listCategory = dao.getAllCategory();
//            request.setAttribute("listCategory", listCategory);
//        } catch (SQLException ex) {
//            Logger.getLogger(CourseDetailServelet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

}