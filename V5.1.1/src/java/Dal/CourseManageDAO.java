/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.CourseManageDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class CourseManageDAO extends DBContext {

    public static void main(String[] args) {
        CourseManageDAO course_manage_DAO = new CourseManageDAO();
        ArrayList<CourseManageDTO> list = course_manage_DAO.getMyManagedCourse(2);
        System.out.println(list.get(4).getNumber_enrollment());
    }

    public ArrayList<CourseManageDTO> getMyManagedCourse(int account_id) {
        connection = getConnection();
        ArrayList<CourseManageDTO> list = new ArrayList<>();
        String sql = """
                     SELECT c.*,p.FullName,tb_number_enrollment.number_student
                     FROM [Project Online Learning].[dbo].[Course] c 
                     left join Teaching t on c.CourseId = t.CourseId join Profile p on t.MentorId = p.ProfileId
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

}
