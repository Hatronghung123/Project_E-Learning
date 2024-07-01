/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.AccountDTO;
import Model.Answer;
import Model.Category;
import Model.Modules;
import Model.Questions;
import Model.Quiz;
import Model.ScoreQuiz;
import Model.UserAnswer;
import java.beans.Statement;
import java.sql.Array;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        String sql = "INSERT INTO [dbo].[Quiz] ([QuizName], [QuizTime], [PassScore]) VALUES (?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setString(1, quiz.getQuizName());
            statement.setTime(2, quiz.getQuizTime());
            statement.setInt(3, quiz.getPassScore());

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

    public ArrayList<Answer> getListAnswersByID(Questions questions) {
        ArrayList<Answer> listFound = new ArrayList<>();
        // connect with DB
        connection = getConnection();
        // viết câu lệnh sql
        String sql = """
                     SELECT [QuestionId]
                           ,[Choices]
                           ,[IsCorrect]
                       FROM [dbo].[QuestionChoices] where QuestionId = ? and IsCorrect =  1""";
        try {
            // tạo đối tượng preparestatement
            statement = connection.prepareStatement(sql);
            statement.setInt(1, questions.getQuestionId());
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

    public Questions editQuestionsById(Questions questions, int idQuestionEdit) {
        connection = getConnection();
        if (connection == null) {
            System.out.println("Failed to make connection!");
            return null;
        }
        String sql = "UPDATE [dbo].[Question]\n"
                + "   SET [QuestionNum] = ?\n"
                + "      ,[QuizId] = ?\n"
                + "      ,[QuestionName] = ?\n"
                + "      ,[Type] = ?\n"
                + " WHERE [QuestionId] = ?";
        try {
            statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setInt(1, questions.getQuestionNum());
            statement.setInt(2, questions.getQuizId());
            statement.setString(3, questions.getQuestionName());
            statement.setBoolean(4, questions.isType());
            statement.setInt(5, idQuestionEdit);

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

    public void editAnswers(ArrayList<Answer> answers) {
        connection = getConnection();
        deleteAnswers(answers);
        String sql = "insert into QuestionChoices\n"
                + "  values(?,?,?)";
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

    public void deleteAnswers(ArrayList<Answer> answers) {
        connection = getConnection();
        String sql_Delete = "delete from [dbo].[QuestionChoices]"
                + "where [QuestionId] = ?";
        try {
            statement = connection.prepareStatement(sql_Delete);
            statement.setInt(1, answers.get(0).getQuestionId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // get list question by module id
    public ArrayList<Questions> getListQuestionsByModuleId(int moduleId) {
        ArrayList<Questions> listFound = new ArrayList<>();
        connection = getConnection();
        String sql = "select * \n"
                + "from Question que\n"
                + "join Quiz qui on que.QuizId = qui.QuizId \n"
                + "where qui.ModuleId = ?";
        try {
            // tạo đối tượng preparestatement
            statement = connection.prepareStatement(sql);
            statement.setInt(1, moduleId);
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

    public Map<String, String[]> getListQuestionAnswer(int moduleId) {
        Map<String, String[]> new_map = new HashMap<String, String[]>();
        ArrayList<Questions> list_question = getListQuestionsByModuleId(moduleId);
        for (int i = 0; i < list_question.size(); i++) {
            ArrayList<Answer> ans = getListAnswersByID(list_question.get(i));
            String[] anw_string = new String[ans.size()];
            for (int j = 0; j < ans.size(); j++) {
                anw_string[j] = ans.get(j).getChoices().toString();
                System.out.println((String.valueOf(list_question.get(i).getQuestionId()) + " " + anw_string[j]));
            }
            new_map.put(String.valueOf(list_question.get(i).getQuestionId()), anw_string);
        }
        return new_map;
    }


    // get list Answer by module id
    public ArrayList<Answer> getlistAnswerByModuleId(int moduleId) {
        ArrayList<Answer> listFound = new ArrayList<>();
        // connect with DB
        connection = getConnection();
        // viết câu lệnh sql
        String sql = "select qc.QuestionId, qc.Choices, qc.IsCorrect, que.QuestionNum, que.QuestionName, qi.QuizId, que.Type, qi.ModuleId\n"
                + "from QuestionChoices qc\n"
                + "join Question que on qc.QuestionId = que.QuestionId\n"
                + "join Quiz qi on que.QuizId = qi.QuizId \n"
                + "where qi.ModuleId = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, moduleId);
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

    // find quiz by module id
    public Quiz findQuizByModuleId(int moduleIdSelect) {
        connection = getConnection();

        String sql = "select *\n"
                + "from Quiz q \n"
                + "join Module m on  q.ModuleId = m.ModuleId\n"
                + "where m.ModuleId = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, moduleIdSelect);
            // thực thi câu lệnh
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int quizId = resultSet.getInt(1);
                int moduleId = resultSet.getInt(2);
                int quizNum = resultSet.getInt(3);
                String quizName = resultSet.getString(4);
                Time quizTime = resultSet.getTime(5);
                int passScore = resultSet.getInt(6);

                Quiz quiz = new Quiz(quizId, moduleId, quizNum, quizName, quizTime, passScore);
                return quiz;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    // select questionId where question have one or more than 2 correct question
    public void updateTypeQuestion(Questions questions1) {
        connection = getConnection();
        String sql = "select * from (SELECT QuestionId, COUNT(*) AS CorrectCount\n"
                + "FROM QuestionChoices\n"
                + "WHERE isCorrect = 1\n"
                + "GROUP BY QuestionId) tbl1 where tbl1.QuestionId = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, questions1.getQuestionId());
            resultSet = statement.executeQuery();
            int is_correct = 0;
            while (resultSet.next()) {
                is_correct = resultSet.getInt(2);
            }
            if (is_correct > 1) {
                updatetypeQuestByQuestionId(questions1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Update type question by question id select
    public void updatetypeQuestByQuestionId(Questions questions1) {
        connection = getConnection();
        String sql = "update Question\n"
                + "set Type = 1 where QuestionId = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, questions1.getQuestionId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Answer> getlistAnswerCorrectByModuleId(int moduleId) {
        ArrayList<Answer> listFound = new ArrayList<>();
        // connect with DB
        connection = getConnection();
        // viết câu lệnh sql
        String sql = "select qc.QuestionId, qc.Choices, qc.IsCorrect, que.QuestionNum, que.QuestionName, qi.QuizId, que.Type, qi.ModuleId\n"
                + "from QuestionChoices qc\n"
                + "join Question que on qc.QuestionId = que.QuestionId\n"
                + "join Quiz qi on que.QuizId = qi.QuizId \n"
                + "where qi.ModuleId = ? and qc.IsCorrect = 1;";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, moduleId);
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

    public void insertUserAnser(ArrayList<UserAnswer> userAnswer) {
        connection = getConnection();
        String sql = "INSERT INTO [dbo].[AnswerQuestion]\n"
                + "           ([AccountId]\n"
                + "           ,[QuestionId]\n"
                + "           ,[Answer]\n"
                + "           ,[IsCorrect])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            statement = connection.prepareStatement(sql);

            for (UserAnswer useranswer : userAnswer) {
                statement.setInt(1, useranswer.getAccountId());
                statement.setInt(2, useranswer.getQuestionId());
                statement.setString(3, useranswer.getAnswer());
                statement.setBoolean(4, useranswer.isIsCorrectUserAnswer());
                statement.addBatch();
            }

            statement.executeBatch();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void insertScoreQuiz(ScoreQuiz scorequiz) {
        connection = getConnection();
        String sql = "INSERT INTO [dbo].[ScoreQuiz]\n"
                + "           ([AccountId]\n"
                + "           ,[QuizId]\n"
                + "           ,[Score])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, scorequiz.getAccountId());
            statement.setInt(2, scorequiz.getQuizId());
            statement.setFloat(3, scorequiz.getScore());
            statement.executeQuery();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
    
    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();
        ScoreQuiz score = new ScoreQuiz(3, 269, 10);
        dao.insertScoreQuiz(score);
    }
}
