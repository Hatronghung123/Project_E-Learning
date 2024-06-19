/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Model.DiscussionLesson;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class DisscussionDAO {

    Connection con = null; // Kết nối với sql server
    PreparedStatement ps = null; // Ném câu lệnh query sang sql server
    ResultSet rs = null; // Nhận kết quả trả về

    public void InsertComment(int accountId, int lessonId, String comment) {
        String sql = "INSERT INTO DiscussionLesson (AccountId, LessonId, Comment) VALUES (?, ?, ?)";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.setInt(2, lessonId);
            ps.setString(3, comment);
            ps.executeUpdate();
            System.out.println("Chèn dữ liệu thành công");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteComment(int discussionId) {
        String sql = "DELETE FROM DiscussionLesson WHERE DisscussionId = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, discussionId);
            ps.executeUpdate();
            System.out.println("Xóa dữ liệu thành công");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

// public ArrayList<DiscussionLesson> getCommentsFromDatabase(int lessonId) {
//    ArrayList<DiscussionLesson> comments = new ArrayList<>();
//    String sql = "SELECT d.DisscussionId, d.AccountId, d.LessonId, d.Comment, p.FullName, p.Avatar " +
//                 "FROM DiscussionLesson d " +
//                 "INNER JOIN Profile p ON d.AccountId = p.ProfileId " +
//                 "WHERE d.LessonId = ?";
//    try (Connection con = new DBContext().getConnection();
//         PreparedStatement ps = con.prepareStatement(sql)) {
//        ps.setInt(1, lessonId);
//        try (ResultSet rs = ps.executeQuery()) {
//            while (rs.next()) {
//                int discussionId = rs.getInt("DisscussionId");
//                int accountId = rs.getInt("AccountId");
//                String comment = rs.getString("Comment");
//                String fullName = rs.getString("FullName");
//                String avatar = rs.getString("Avatar");
//                DiscussionLesson discussion = new DiscussionLesson(discussionId, accountId, lessonId, comment, fullName, avatar);
//                comments.add(discussion);
//            }
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//    return comments;
//}
public ArrayList<DiscussionLesson> getCommentsFromDatabase(int lessonID) {
    ArrayList<DiscussionLesson> listComment = new ArrayList<>();
    String sql = "SELECT \n"
            + "    d.DisscussionId, \n"
            + "    d.LessonId, \n"
            + "    d.AccountId, \n"
            + "    d.Comment, \n"
            + "    p.FullName, \n"
            + "    p.Avatar \n"
            + "FROM \n"
            + "    DiscussionLesson d \n"
            + "INNER JOIN \n"
            + "    Account a ON d.AccountId = a.AccountId \n"
            + "LEFT JOIN \n"
            + "    Profile p ON d.AccountId = p.ProfileId \n"
            + "WHERE \n"
            + "    d.LessonId = ? \n"
            + "ORDER BY \n"
            + "    d.DisscussionId ASC;";

    try (Connection con = new DBContext().getConnection(); 
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, lessonID);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int commentId = rs.getInt("DisscussionId");
                int lessonId = rs.getInt("LessonId");
                int userId = rs.getInt("AccountId");
                String content = rs.getString("Comment");
                String name = rs.getString("FullName");
                String avatar = rs.getString("Avatar");

                DiscussionLesson comment = new DiscussionLesson(commentId, lessonId, userId, content, name, avatar);
                listComment.add(comment);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return listComment;
}

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        DisscussionDAO dao = new DisscussionDAO();
        System.out.println(dao.getCommentsFromDatabase(1));
        //    dao.deleteComment(1);
    }
}
