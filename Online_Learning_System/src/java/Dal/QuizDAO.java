/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import Model.Answer;
import Model.Category;
import Model.Modules;
import Model.Questions;
import Model.Quiz;
import java.beans.Statement;
import java.sql.Array;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hatro
 */
public class QuizDAO extends DBContext {

    public Quiz insertQuiz(Quiz quiz) {
        connection = getConnection();
        if (connection == null) {
            System.out.println("Failed to make connection!");
            return null;
        }
        String sql = "INSERT INTO [dbo].[Quiz] ([QuizName], [QuizTime]) VALUES (?, ?)";
        try {
            statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setString(1, quiz.getQuizName());
            statement.setTime(2, quiz.getQuizTime());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next()) {
                    quiz.setQuizId(rs.getInt(1));
                }
                rs.close();
            }

            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quiz;
    }

    public Questions insertQuestions(Questions questions) {
        connection = getConnection();
        if (connection == null) {
            System.out.println("Failed to make connection!");
            return null;
        }
        String sql = "INSERT INTO [dbo].[Question] ([QuestionNum], [QuizId], [QuestionName], [Type]) VALUES (?, ?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setInt(1, questions.getQuestionNum());
            statement.setInt(2, questions.getQuizId());
            statement.setString(3, questions.getQuestionName());
            statement.setBoolean(4, questions.isType());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next()) {
                    questions.setQuestionId(rs.getInt(1));
                }
                rs.close();
            }

            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return questions;
    }

    public void insertAnswers(List<Answer> answers) {
        connection = getConnection();
        String sql = "INSERT INTO [dbo].[QuestionChoices] ([QuestionId], [Choices], [IsCorrect]) VALUES (?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);

            for (Answer answer : answers) {
                statement.setInt(1, answer.getQuestionId());
                statement.setString(2, answer.getChoices());
                statement.setBoolean(3, answer.isIsCorrect());
                statement.addBatch();
            }

            statement.executeBatch();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();

        dao.deleteQuestionById(174, 173);
    }

    public ArrayList<Questions> getListQuestions(Questions questions) {
        ArrayList<Questions> listFound = new ArrayList<>();
        // connect with DB
        connection = getConnection();
        // viết câu lệnh sql
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Question] q\n"
                + "  join Quiz qz on q.QuizId = qz.QuizId\n"
                + "  where q.QuizId = ?";
        try {
            // tạo đối tượng preparestatement
            statement = connection.prepareStatement(sql);
            statement.setInt(1, questions.getQuizId());
            // thực thi câu lệnh
            resultSet = statement.executeQuery();
            // trả về kết quả
            while (resultSet.next()) {
                int questionId = resultSet.getInt("questionId");
                int questionNum = resultSet.getInt("questionNum");
                int quizId = resultSet.getInt("quizId");
                String questionName = resultSet.getString("questionName");
                Boolean type = resultSet.getBoolean("type");
                Questions question = new Questions(questionId, questionNum, quizId, questionName, type);
                listFound.add(question);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listFound;
    }

    public ArrayList<Answer> getListAnswers(Questions questions) {
        ArrayList<Answer> listFound = new ArrayList<>();
        // connect with DB
        connection = getConnection();
        // viết câu lệnh sql
        String sql = "SELECT [QuestionId]\n"
                + "      ,[Choices]\n"
                + "      ,[IsCorrect]\n"
                + "  FROM [dbo].[QuestionChoices]";
        try {
            // tạo đối tượng preparestatement
            statement = connection.prepareStatement(sql);
            // thực thi câu lệnh
            resultSet = statement.executeQuery();
            // trả về kết quả
            while (resultSet.next()) {
                int questionId = resultSet.getInt("questionId");
                String choices = resultSet.getString("choices");
                Boolean isCorrect = resultSet.getBoolean("isCorrect");

                Answer answer = new Answer(questionId, choices, isCorrect);
                listFound.add(answer);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listFound;

    }

    public void deleteQuestionById(int questionId, int quizId) {
        connection = getConnection();
        String sql = "BEGIN TRANSACTION;\n"
                + "\n"
                + "\n"
                + "DELETE FROM QuestionChoices\n"
                + "WHERE QuestionId IN (\n"
                + "    SELECT QuestionId FROM Question\n"
                + "    WHERE QuestionId = ?\n"
                + ");\n"
                + "\n"
                + "\n"
                + "DELETE FROM Question\n"
                + "WHERE QuizId = ? and QuestionId =?;\n"
                + "\n"
                + "\n"
                + "COMMIT TRANSACTION;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, questionId);
            statement.setInt(2, quizId);
            statement.setInt(3, questionId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
