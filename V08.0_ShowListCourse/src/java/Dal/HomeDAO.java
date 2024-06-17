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

    public ArrayList<Course> getAllCourses() {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT cr.[CourseId],\n"
                + "      cr.[CourseName],\n"
                + "      cr.[Description],\n"
                + "      cr.[Image],\n"
                + "      cr.[Price],\n"
                + "      cr.[CourseCateroryId],\n"
                + "      cr.[CreatedBy],\n"
                + "      cr.[DateCreated],\n"
                + "      cr.[StudyTime],\n"
                + "      cr.[Status],\n"
                + "      pro.[FullName]\n"
                + "  FROM [dbo].[Course] cr\n"
                + "  JOIN [dbo].[Teaching] te ON te.[CourseId] = cr.[CourseId]\n"
                + "  JOIN [dbo].[Profile] pro ON pro.[ProfileId] = te.[MentorId]\n";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt(1);
                String courseName = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                int price = rs.getInt(5);
                String courseCategoryId = rs.getString(6);
                int createdBy = rs.getInt(7);
                Date dateCreated = rs.getDate(8);
                String studyTime = rs.getString(9);
                int status = rs.getInt(10);
                String instructor = rs.getString(11);

                Course course = new Course(courseId, courseName, description, instructor, image, price, courseCategoryId, createdBy, dateCreated, studyTime, status);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getCourseByCategoryId(String cateId) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT cr.[CourseId],\n"
                + "                            cr.[CourseName],\n"
                + "                            cr.[Description],\n"
                + "                            cr.[Image],\n"
                + "                            cr.[Price],\n"
                + "                            cr.[CourseCateroryId],\n"
                + "                            cr.[CreatedBy],\n"
                + "                           cr.[DateCreated],\n"
                + "                           cr.[StudyTime],\n"
                + "                            cr.[Status],\n"
                + "                             pro.[FullName]\n"
                + "                     FROM [dbo].[Course] cr\n"
                + "                     JOIN [dbo].[CourseCategory] ct ON ct.[CourseCateroryId] = cr.[CourseCateroryId]\n"
                + "                     JOIN [dbo].[Teaching] te ON te.[CourseId] = cr.[CourseId]\n"
                + "                  JOIN [dbo].[Profile] pro ON pro.[ProfileId] = te.[MentorId]\n"
                + "                     WHERE cr.[CourseCateroryId] =?";

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, cateId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int courseId = rs.getInt(1);
                    String courseName = rs.getString(2);
                    String description = rs.getString(3);
                    String image = rs.getString(4);
                    int price = rs.getInt(5);
                    String courseCategoryId = rs.getString(6);
                    int createdBy = rs.getInt(7);
                    Date dateCreated = rs.getDate(8);
                    String studyTime = rs.getString(9);
                    int status = rs.getInt(10);
                    String instructor = rs.getString(11); // Assuming Instructor column is in Teaching table

                    courses.add(new Course(courseId, courseName, description, instructor, image, price, courseCategoryId, createdBy, dateCreated, studyTime, status));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getPopularCourse() {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = " SELECT TOP 5\n"
                + "    c.[CourseId],\n"
                + "    c.[CourseName],\n"
                + "    c.[Description],\n"
                + "    c.[Image],\n"
                + "    c.[Price],\n"
                + "    c.[Discount],\n"
                + "    c.[CourseCateroryId],\n"
                + "    c.[CreatedBy],\n"
                + "    c.[DateCreated],\n"
                + "    c.[StudyTime],\n"
                + "    c.[Status],\n"
                + "    COUNT(cr.[RatingId]) AS TotalRatings\n"
                + "FROM\n"
                + "    [Project Online Learning].[dbo].[Course] c\n"
                + "LEFT JOIN\n"
                + "    [Project Online Learning].[dbo].[CourseRating] cr ON c.[CourseId] = cr.[CourseId]\n"
                + "WHERE\n"
                + "    c.[Status] = 1  -- Lọc ra các khóa học đang hoạt động (ví dụ)\n"
                + "GROUP BY\n"
                + "    c.[CourseId],\n"
                + "    c.[CourseName],\n"
                + "    c.[Description],\n"
                + "    c.[Image],\n"
                + "    c.[Price],\n"
                + "    c.[Discount],\n"
                + "    c.[CourseCateroryId],\n"
                + "    c.[CreatedBy],\n"
                + "    c.[DateCreated],\n"
                + "    c.[StudyTime],\n"
                + "    c.[Status]\n"
                + "ORDER BY\n"
                + "    TotalRatings DESC;";

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int courseId = rs.getInt(1);
                    String courseName = rs.getString(2);
                    String description = rs.getString(3);
                    String image = rs.getString(4);
                    int price = rs.getInt(5);
                    String courseCategoryId = rs.getString(6);
                    int createdBy = rs.getInt(7);
                    Date dateCreated = rs.getDate(8);
                    String studyTime = rs.getString(9);
                    int status = rs.getInt(10);
                    String instructor = rs.getString(11);

                    courses.add(new Course(courseId, courseName, description, instructor, image, price, courseCategoryId, createdBy, dateCreated, studyTime, status));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        HomeDAO dao = new HomeDAO();
        System.out.println(dao.getCourseByCategoryId("IT"));
    }
}
