/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import Controller.CourseDetailServlet;
import Dal.AccountDAO;
import Dal.HomeDAO;
import Model.AccountDTO;
import Model.Category;
import Model.ProfileDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class MyCommon {

    public MyCommon(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        ProfileDTO profile = (ProfileDTO) session.getAttribute("profile");
        AccountDTO account = getMyAccount(request, response);
        session.setAttribute("profile", profile);
        session.setAttribute("account", account);
//get list category
        try {
            HomeDAO dao = new HomeDAO();
            ArrayList<Category> listCategory = dao.getAllCategory();
            session.setAttribute("listCategory", listCategory);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        session.setMaxInactiveInterval(60 * 30);
    }

    public static void getHeader(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        ProfileDTO profile = (ProfileDTO) session.getAttribute("profile");
        AccountDTO account = getMyAccount(request, response);
        session.setAttribute("profile", profile);
        session.setAttribute("account", account);
//get list category
        try {
            HomeDAO dao = new HomeDAO();
            ArrayList<Category> listCategory = dao.getAllCategory();
            session.setAttribute("listCategory", listCategory);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        session.setMaxInactiveInterval(60 * 30);
    }

    public static AccountDTO getMyAccount(HttpServletRequest request, HttpServletResponse response) {
        AccountDAO account_dao = new AccountDAO();
        Cookie cookie[] = request.getCookies();
        AccountDTO my_account = new AccountDTO();
        String account_id = "";
        for (Cookie c : cookie) {
            //delete old account_id in cookie
            if (c.getName().equals("account_id")) {
                account_id = c.getValue();
                break;
            }
        }
        return my_account = account_dao.getAccountById(Integer.parseInt(account_id));
    }
    
}
