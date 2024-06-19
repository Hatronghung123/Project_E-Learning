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

        List<Answer> answers = new ArrayList<>();
        answers.add(new Answer(10, "Choice A", true));
        answers.add(new Answer(10, "Choice B", false));
        answers.add(new Answer(10, "Choice C", false));
        answers.add(new Answer(10, "Choice D", false));

        dao.insertAnswers(answers);
    }
}
