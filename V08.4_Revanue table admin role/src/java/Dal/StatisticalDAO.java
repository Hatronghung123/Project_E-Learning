/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Payment;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class StatisticalDAO {

    Connection con = null; // Kết nối với sql server
    PreparedStatement ps = null; // Ném câu lệnh query sang sql server
    ResultSet rs = null; // Nhận kết quả trả về

    public static void main(String[] args) {
        StatisticalDAO test = new StatisticalDAO();
        try {
            System.out.println(test.getTotalEarningPerMonth());
        } catch (Exception e) {
        }
    }

    public ArrayList<Payment> getTotalEarningPerMonth() throws SQLException {
        ArrayList<Payment> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    DATENAME(MONTH, PaymentDate) AS Month,\n"
                + "    SUM(Money) AS TotalEarnings\n"
                + "FROM \n"
                + "    [Project Online Learning].[dbo].[Payment]\n"
                + "WHERE \n"
                + "    YEAR(PaymentDate) = 2024\n"
                + "GROUP BY \n"
                + "    DATENAME(MONTH, PaymentDate),\n"
                + "    DATEPART(MONTH, PaymentDate)\n"
                + "ORDER BY \n"
                + "    DATEPART(MONTH, PaymentDate);";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                String month = rs.getString("Month");
                int total_earnings = rs.getInt("TotalEarnings");

                list.add(new Payment(total_earnings, month));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi");
        }

        return list;
    }

}
