/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Category;
import Model.Course;
import Model.Enrollment;
import Model.StarRatingDTO;
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
public class CourseDetailDAO {

    Connection con = null; // Kết nối với sql server
    PreparedStatement ps = null; // Ném câu lệnh query sang sql server
    ResultSet rs = null; // Nhận kết quả trả về

    //======== LOAD DỮ LIỆU TỪ DATABASE ============
    //Lấy ra tất cả 5 khóa học liên quan với khóa học hiện tại trong database  theo category
    public ArrayList<Course> getRelateCourse(int courseId) throws SQLException {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "SELECT TOP 4 cr.[CourseId]\n"
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
                + "   WHERE [CourseCategoryId] = (SELECT  [CourseCategoryId] FROM Course WHERE  [CourseId] = ?) AND cr.[CourseId] != ?\n"
                + "   Group by cr.CourseId, cr.CourseName, cr.[Description], cr.[Image],cr.[Price], cr.[CourseCategoryId],cr.[CreatedBy], cr.[DateCreated],cr.[StudyTime],cr.[Status],pro.[FullName]\n"
                + "   ORDER BY StudentCount DESC;";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseId);
            ps.setInt(2, courseId);

            rs = ps.executeQuery();
            while (rs.next()) {
                int course_id = rs.getInt(1);
                String course_name = rs.getString(2);
                String description = rs.getString(3);
                String image = rs.getString(4);
                int price = rs.getInt(5);
                String cate_id = rs.getString(6);  // Nếu giá trị là "IT", dùng getString để tránh lỗi
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

    //Lấy ra  category theo id
    public ArrayList<Category> getCategoryById(int courseId) throws SQLException {
        ArrayList<Category> list = new ArrayList<>();
        String sql ="""
                    SELECT cate.[CourseCategoryId],
                           cate.[CategoryName],
                    	   count(cr.[CourseId]) as numberCourseInCategory
                    FROM [dbo].[CourseCategory] cate
                    JOIN [dbo].[Course] cr ON cr.[CourseCategoryId] = cate.[CourseCategoryId]
                    Where  cate.[CourseCategoryId] = (Select [CourseCategoryId] from Course where CourseId = ? )
                    Group By cate.[CourseCategoryId],cate.[CategoryName]
                    """;
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {

                String cate_id = rs.getString(1);
                String cate_name = rs.getString(2);
                int numberCourseInCate = rs.getInt(3);
                list.add(new Category(cate_id, cate_name, numberCourseInCate));
            }
        } catch (Exception e) {
            e.printStackTrace();  // In chi tiết lỗi ra console

        }

        return list;
    }

    //Lấy ra list enrollment để kiểm tra người dùng đã mua khóa học này hay chưa
    public ArrayList<Enrollment> getEnrollmentByAccountId(int courseId) throws SQLException {
        ArrayList<Enrollment> list = new ArrayList<>();
        String sql = " SELECT [EnrollmentId]\n"
                + "      ,[AccountId]\n"
                + "      ,[CourseId]\n"
                + "      ,[EnrollmentDate]\n"
                + "      ,[Progress]\n"
                + "  FROM [dbo].[Enrollment]\n"
                + "  WHERE [AccountId] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {

                int enrollId = rs.getInt(1);
                int accId = rs.getInt(2);
                int courseid = rs.getInt(3);
                Date enrollmentDate = rs.getDate(4);
                int progress = rs.getInt(5);

                list.add(new Enrollment(enrollId, accId, courseid, enrollmentDate, progress));
            }
        } catch (Exception e) {
            e.printStackTrace();  // In chi tiết lỗi ra console

        }

        return list;
    }

    //Lấy course theo course ID
    public Course getCourseById(int courseId) throws SQLException {
        String sql = "SELECT cr.[CourseId]\n"
                + "      ,[CourseName]\n"
                + "      ,[Description]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[CourseCategoryId]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[DateCreated]\n"
                + "      ,[StudyTime]\n"
                + "      ,cr.[Status]\n"
                + "	  ,pro.FullName\n"
                + "  FROM [dbo].[Course] cr\n"
                + "  join [dbo].[Teaching] te on te.CourseId = cr.CourseId\n"
                + "  join [dbo].[Profile] pro on pro.ProfileId = te.MentorId\n"
                + "  where cr.[CourseId] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseId);

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

                return new Course(course_id, course_name, description, instructor, image, price, cate_id, create_by, date, studyTime, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi");
        }

        return null;
    }
    
    
    
    //Lấy ra thông tin các đánh giá của khóa học 
    
        public ArrayList<StarRatingDTO> getRatings(int courseId) throws SQLException {
        ArrayList<StarRatingDTO> list = new ArrayList<>();
        String sql = """
                     SELECT [RatingId]
              ,[Star]
              ,[Comment]
              ,[DateCreated]
              ,[CourseId]
              ,cr.[AccountId]
        	  ,p.Avatar
        	  ,p.FullName
          FROM [dbo].[CourseRating] cr
          Join Profile p on p.ProfileId = cr.[AccountId]
          Where cr.[CourseId] = ?
                     """;
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseId);

            rs = ps.executeQuery();
            while (rs.next()) {
                int ratingid = rs.getInt(1);
                int star  = rs.getInt(2);
                String comment = rs.getString(3);
                Date datecreate = rs.getDate(4);
                int courseid = rs.getInt(5);
                int accountid = rs.getInt(6);  // Nếu giá trị là "IT", dùng getString để tránh lỗi
                String avatar = rs.getString(7);
                String fullname = rs.getString(8);
              
                list.add(new StarRatingDTO(ratingid, star, comment, datecreate, courseid, accountid, avatar, fullname));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi");
        }

        return list;
    }
    

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        CourseDetailDAO dao = new CourseDetailDAO();
        System.out.println(dao.getRatings(1));
    }

}
