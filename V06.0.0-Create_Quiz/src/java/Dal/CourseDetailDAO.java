/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
    public ArrayList<Course> getRelateCourse(int courseid) throws SQLException {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "  SELECT * \n"
                + "FROM [dbo].[tbl_course] \n"
                + "WHERE [course_category_id] = (SELECT [course_category_id] FROM [dbo].[tbl_course]  WHERE [course_id] = ?) \n"
                + "  AND [course_id] != ? \n"
                + "LIMIT 5";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int course_id = rs.getInt(1);
                String course_name = rs.getString(2);
                String descritption = rs.getString(3);
                String image = rs.getString(4);
                double price = rs.getDouble(5);
                int cate_id = rs.getInt(6);
                int create_by = rs.getInt(7);
                int is_active = rs.getInt(8);

                list.add(new Course(course_id, course_name, descritption, image, price, cate_id, create_by, is_active));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        CourseDetailDAO dao = new CourseDetailDAO();

    }

}
