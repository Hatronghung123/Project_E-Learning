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

    // Lấy tất cả course
    public ArrayList<Course> getAllCourses() {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT cr.[CourseId],\n"
                + "      cr.[CourseName],\n"
                + "      cr.[Description],\n"
                + "      cr.[Image],\n"
                + "      cr.[Price],\n"
                + "      cr.[CourseCategoryId],\n"
                + "      cr.[CreatedBy],\n"
                + "      cr.[DateCreated],\n"
                + "      cr.[StudyTime],\n"
                + "      cr.[Status],\n"
                + "      pro.[FullName],\n"
                + "	 COUNT(e.EnrollmentId) as StudentCount\n"
                + "  FROM [dbo].[Course] cr\n"
                + "  JOIN [dbo].[Teaching] te ON te.[CourseId] = cr.[CourseId]\n"
                + "  JOIN [dbo].[Profile] pro ON pro.[ProfileId] = te.[MentorId]\n"
                + "   LEFT JOIN Enrollment e ON cr.CourseId = e.CourseId\n"
                + "   Group by cr.CourseId, cr.CourseName, cr.[Description], cr.[Image],cr.[Price], cr.[CourseCategoryId],cr.[CreatedBy], cr.[DateCreated],cr.[StudyTime],cr.[Status],pro.[FullName]\n"
                + "   ORDER BY StudentCount DESC;";

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
                int amountSudentJoin = rs.getInt(12);
                Course course = new Course(courseId, courseName, description, instructor, image, price, courseCategoryId, createdBy, dateCreated, studyTime, status, amountSudentJoin);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    //Lấy danh sách category
    public ArrayList<Category> getAllCategory() throws SQLException {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "SELECT [CourseCategoryId]\n"
                + "      ,[CategoryName]\n"
                + "  FROM [Project Online Learning].[dbo].[CourseCategory]";
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

    public ArrayList<Course> getCourseByCategoryId(String cateId) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "  SELECT cr.[CourseId],\n"
                + "                                     cr.[CourseName],\n"
                + "                                            cr.[Description],\n"
                + "                                            cr.[Image],\n"
                + "                                           cr.[Price],\n"
                + "                                            ct.[CourseCategoryId],\n"
                + "                                            cr.[CreatedBy],\n"
                + "                                           cr.[DateCreated],\n"
                + "                                          cr.[StudyTime],\n"
                + "                                            cr.[Status],\n"
                + "                                             pro.[FullName],\n"
                + "	 COUNT(e.EnrollmentId) as StudentCount\n"
                + "                                   FROM [dbo].[Course] cr\n"
                + "                                  JOIN [dbo].[CourseCategory] ct ON ct.[CourseCategoryId] = cr.[CourseCategoryId]\n"
                + "                                   JOIN [dbo].[Teaching] te ON te.[CourseId] = cr.[CourseId]\n"
                + "                                 JOIN [dbo].[Profile] pro ON pro.[ProfileId] = te.[MentorId]\n"
                + "   LEFT JOIN Enrollment e ON cr.CourseId = e.CourseId\n"
                + "                                    WHERE ct.CourseCategoryId =?\n"
                + "   Group by cr.CourseId, cr.CourseName, cr.[Description], cr.[Image],cr.[Price], ct.[CourseCategoryId],cr.[CreatedBy], cr.[DateCreated],cr.[StudyTime],cr.[Status],pro.[FullName]\n"
                + "   ORDER BY StudentCount DESC;";

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
int amountSudentJoin = rs.getInt(12);
                    courses.add(new Course(courseId, courseName, description, instructor, image, price, courseCategoryId, createdBy, dateCreated, studyTime, status, amountSudentJoin));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public ArrayList<Course> getNewCourse() throws SQLException {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "SELECT TOP 2 cr.[CourseId]\n"
                + "      ,[CourseName]\n"
                + "      ,[Description]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[CourseCategoryId]\n"
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

    public ArrayList<Course> getPopulerCourse() throws SQLException {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "SELECT TOP (3) cr.[CourseId]\n"
                + "      ,cr.[CourseName]\n"
                + "      ,cr.[Description]\n"
                + "      ,cr.[Image]\n"
                + "      ,cr.[Price]\n"
                + "      ,cr.[CourseCategoryId]\n"
                + "      ,cr.[CreatedBy]\n"
                + "      ,cr.[DateCreated]\n"
                + "      ,cr.[StudyTime]\n"
                + "      ,cr.[Status]\n"
                + "	  ,pro.[FullName] AS MentorName\n"
                + "	  ,COUNT(e.EnrollmentId) as StudentCount\n"
                + "  FROM [dbo].[Course] cr\n"
                + "   join [dbo].[Teaching] te on te.CourseId = cr.CourseId\n"
                + "   join [dbo].[Profile] pro on pro.ProfileId = te.MentorId\n"
                + "   LEFT JOIN Enrollment e ON cr.CourseId = e.CourseId\n"
                + "   Group by cr.CourseId, cr.CourseName, cr.[Description], cr.[Image],cr.[Price], cr.[CourseCategoryId],cr.[CreatedBy], cr.[DateCreated],cr.[StudyTime],cr.[Status],pro.[FullName]\n"
                + "   ORDER BY StudentCount DESC;";
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
                int amountSudentJoin = rs.getInt(12);

                list.add(new Course(course_id, course_name, description, instructor, image, price, cate_id, create_by, date, studyTime, status, amountSudentJoin));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi");
        }

        return list;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        HomeDAO dao = new HomeDAO();
        System.out.println(dao.getCourseByCategoryId("IT"));
    }
}
