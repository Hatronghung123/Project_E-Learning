/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Course;
import Model.CourseManageDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class CourseManageDAO extends DBContext {

    public CourseManageDTO getMyManagedCourseById(int account_id, String courseId) {
        connection = getConnection();
        String sql = """
                     SELECT c.*,p.FullName,tb_number_enrollment.number_student
                                          FROM [Project Online Learning].[dbo].[Course] c 
                                          left join Teaching t on c.CourseId = t.CourseId left join Profile p on t.MentorId = p.ProfileId
                                          left join  (select CourseId,COUNT(AccountId) as number_student from Enrollment
                                          group by CourseId) tb_number_enrollment
                                          on c.CourseId = tb_number_enrollment.CourseId
                                          where CreatedBy = ? and c.CourseId = ? order by c.CourseId asc""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, account_id);
            statement.setString(2, courseId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int course_id = resultSet.getInt(1);
                String course_name = resultSet.getString(2);
                String description = resultSet.getString(3);
                String image = resultSet.getString(4);
                float price = resultSet.getFloat(5);
                float discount = resultSet.getFloat(6);
                String course_category = resultSet.getString(7);
                String create_date = resultSet.getString(9);
                String study_time = resultSet.getString(10);
                boolean status = resultSet.getBoolean(11);
                String mentor_name = resultSet.getString(12);
                int number_enrollment = resultSet.getInt(13);
                return new CourseManageDTO(course_id, course_name, description, mentor_name, image, price, discount, course_category, create_date, study_time, status, number_enrollment);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<CourseManageDTO> getMyManagedCourses(int account_id) {
        connection = getConnection();
        ArrayList<CourseManageDTO> list = new ArrayList<>();
        String sql = """
                     SELECT c.*,p.FullName,tb_number_enrollment.number_student
                     FROM [Project Online Learning].[dbo].[Course] c 
                     left join Teaching t on c.CourseId = t.CourseId left join Profile p on t.MentorId = p.ProfileId
                     left join  (select CourseId,COUNT(AccountId) as number_student from Enrollment
                     group by CourseId) tb_number_enrollment
                     on c.CourseId = tb_number_enrollment.CourseId
                     where CreatedBy = ? order by c.CourseId asc""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, account_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int course_id = resultSet.getInt(1);
                String course_name = resultSet.getString(2);
                String description = resultSet.getString(3);
                String image = resultSet.getString(4);
                float price = resultSet.getFloat(5);
                float discount = resultSet.getFloat(6);
                String course_category = resultSet.getString(7);
                String create_date = resultSet.getString(9);
                String study_time = resultSet.getString(10);
                boolean status = resultSet.getBoolean(11);
                String mentor_name = resultSet.getString(12);
                int number_enrollment = resultSet.getInt(13);

                list.add(new CourseManageDTO(course_id, course_name, description, mentor_name, image, price, discount, course_category, create_date, study_time, status, number_enrollment));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean deleteCourse(String cid) {

        connection = getConnection();
        String sql = """
                       update Course
                        set Status = 0 where CourseId = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, cid);
            // thực thi câu lệnh
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean activateCourse(String cid) {
        connection = getConnection();
        String sql = """
                       update Course
                        set Status = 1 where CourseId = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, cid);
            // thực thi câu lệnh
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

//        course_manage_DAO.insertCourse(2, new CourseManageDTO("abc", "abccc", null, 0, 0, "IT", "0h"));
    public void insertCourse(int managerId, CourseManageDTO newCourse) {
        connection = getConnection();
        String sql_account = """
                                 INSERT INTO [dbo].[Course]
                                        ([CourseName]
                                        ,[Description]
                                        ,[Image]
                                        ,[Price]
                                        ,[Discount]
                                        ,[CourseCategoryId]
                                        ,[CreatedBy]
                                        ,[DateCreated]

                                        ,[Status])
                                  VALUES
                                        (?
                                        ,?
                                        ,?
                                        ,?
                                        ,?
                                        ,?
                                        ,?
                                        ,GETDATE()
                                        ,1)""";
        try {
            statement = connection.prepareStatement(sql_account);
            statement.setString(1, newCourse.getCourse_name());
            statement.setString(2, newCourse.getDescription());
            statement.setString(3, newCourse.getImage());
            statement.setFloat(4, newCourse.getPrice());
            statement.setFloat(5, newCourse.getDiscount());
            statement.setString(6, newCourse.getCourse_category_id());
            statement.setInt(7, managerId);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateCourse(int managerId, CourseManageDTO newCourse) {
        connection = getConnection();
        String sql_account = """
                                 INSERT INTO [dbo].[Course]
                                        ([CourseName]
                                        ,[Description]
                                        ,[Image]
                                        ,[Price]
                                        ,[Discount]
                                        ,[CourseCategoryId]
                                        ,[CreatedBy]
                                        ,[DateCreated]

                                        ,[Status])
                                  VALUES
                                        (?
                                        ,?
                                        ,?
                                        ,?
                                        ,?
                                        ,?
                                        ,?
                                        ,GETDATE()
                                        ,1)""";
        try {
            statement = connection.prepareStatement(sql_account);
            statement.setString(1, newCourse.getCourse_name());
            statement.setString(2, newCourse.getDescription());
            statement.setString(3, newCourse.getImage());
            statement.setFloat(4, newCourse.getPrice());
            statement.setFloat(5, newCourse.getDiscount());
            statement.setString(6, newCourse.getCourse_category_id());
            statement.setInt(7, managerId);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //kiểm tra xem có sinh viên đang tham gia khóa học hay không
    public boolean canChangeStatusCourse(String cid) {
        connection = getConnection();
        String sql = """
                         SELECT COUNT(*) 
                          FROM [dbo].[Enrollment]
                          WHERE CourseId = ? AND Progress < 100 """;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, cid);
            // thực thi câu lệnh
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1) == 0; // Trả về true nếu tất cả sinh viên dã hoàn thành khóa học hoặc chưa tham gia khóa học
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    public static void main(String[] args) {
        CourseManageDAO dao = new CourseManageDAO();
        System.out.println(dao.getMyManagedCourseById(2, "2").getCourse_category_id());
    }

}
