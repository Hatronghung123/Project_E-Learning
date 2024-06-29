/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Category;
import Model.Course;
import java.sql.Date;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
public class HomeDAO {

    Connection con = null; // Kết nối với sql server
    PreparedStatement ps = null; // Ném câu lệnh query sang sql server
    ResultSet rs = null; // Nhận kết quả trả về
    //Lấy course theo course ID

    //Lấy danh sách category
    //Lấy ra  category theo id
    public ArrayList<Category> getAllCategory() throws SQLException {
        ArrayList<Category> list = new ArrayList<>();
        String sql = " SELECT  cate.[CourseCateroryId]\n"
                + "        ,[CategoryName]\n"
                + " FROM [dbo].[CourseCategory] cate\n";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                String cate_id = rs.getString(1);
                String cate_name = rs.getString(2);

                list.add(new Category(cate_id, cate_name));
            }
        } catch (Exception e) {
            e.printStackTrace();  // In chi tiết lỗi ra console

        }

        return list;
    }

    public ArrayList<Course> getNewCourse() throws SQLException {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "SELECT TOP 2 cr.[CourseId]\n"
                + "      ,[CourseName]\n"
                + "      ,[Description]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[CourseCateroryId]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[DateCreated]\n"
                + "      ,[StudyTime]\n"
                + "      ,[Status]\n"
                + "	  ,pro.FullName\n"
                + "  FROM [dbo].[Course] cr\n"
                + "  join [dbo].[Teaching] te on te.CourseId = cr.CourseId\n"
                + "  join [dbo].[Profile] pro on pro.ProfileId = te.MentorId\n"
                + "  ORDER BY cr.[CourseId] DESC";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int course_id = rs.getInt(1);
                String course_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                int price = rs.getInt(5);
                String cate_id = rs.getString(6);
                int create_by = rs.getInt(7);
                Date date = rs.getDate(8);
                String studyTime = rs.getString(9);
                int status = rs.getInt(10);
                String instructor = rs.getString(11);

                list.add(new Course(course_id, course_name, description, instructor, image, price, cate_id, create_by, date, studyTime, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi");
        }

        return list;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        HomeDAO dao = new HomeDAO();
        System.out.println(dao.getNewCourse());
    }
}
