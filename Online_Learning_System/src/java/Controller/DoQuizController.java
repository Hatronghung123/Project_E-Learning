/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.QuizDAO;
import Model.AccountDTO;
import Model.Answer;
import Model.Questions;
import Model.Quiz;
import Model.ScoreQuiz;
import Model.UserAnswer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author hatro
 */
public class DoQuizController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DoQuizController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoQuizController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDTO acc = (AccountDTO) session.getAttribute("account");
        if (acc == null) {
            response.sendRedirect("join?action=login");
            return;
        }

        ArrayList<UserAnswer> listUserAnswer = (ArrayList<UserAnswer>) session.getAttribute("listUserAnswer");
        ArrayList<ScoreQuiz> listScoreQuiz = (ArrayList<ScoreQuiz>) session.getAttribute("listScoreQuiz");
        QuizDAO quizDAO = new QuizDAO();
        int moduleId = Integer.parseInt(request.getParameter("mid"));
        Quiz quiz = quizDAO.findQuizByModuleId(moduleId);
        ArrayList<Questions> listQuestionByModuleId = quizDAO.getListQuestionsByModuleId(moduleId);
        ArrayList<Answer> listAnswerByModuleId = quizDAO.getlistAnswerByModuleId(moduleId);
        ArrayList<Answer> listAnswersCorrect = quizDAO.getlistAnswerCorrectByModuleId(moduleId);
        UserAnswer userAnswer = listUserAnswer.get(listUserAnswer.size() - 1);
        ScoreQuiz scoreQuiz = listScoreQuiz.get(listScoreQuiz.size() - 1);

        // count UserAnswer
        Set<Integer> answerCount = new HashSet<>();
        for (UserAnswer ua : listUserAnswer) {
            answerCount.add(ua.getQuestionId());
        }
        int countAnswer = answerCount.size();

        // Tạo một HashMap để lưu trữ questionId và các câu trả lời của người dùng
        Map<Integer, List<String>> questionAnswersMap = new HashMap<>();
        for (UserAnswer ua : listUserAnswer) {
            int questionId = ua.getQuestionId();
            if (!questionAnswersMap.containsKey(questionId)) {
                questionAnswersMap.put(questionId, new ArrayList<>());
            }
            questionAnswersMap.get(questionId).add(ua.getAnswer());
        }

        // Chuyển đổi List<String> sang String[]
        Map<Integer, String[]> questionAnswersArrayMap = new HashMap<>();
        for (Map.Entry<Integer, List<String>> entry : questionAnswersMap.entrySet()) {
            questionAnswersArrayMap.put(entry.getKey(), entry.getValue().toArray(new String[0]));
        }

        // Lấy danh sách câu trả lời đúng
        Map<Integer, String[]> questionAnswersCorrect = quizDAO.getListQuestionAnswerQuizSubmit(moduleId);

        // Process the user's answers and compare them with the correct answers
        Map<Integer, String> questionResultMap = new HashMap<>();
        for (Map.Entry<Integer, String[]> entry : questionAnswersArrayMap.entrySet()) {
            int questionId = entry.getKey();
            String[] userAnswers = entry.getValue();
            String[] correctAnswers = questionAnswersCorrect.get(questionId);

            Set<String> userAnswersSet = new HashSet<>(Arrays.asList(userAnswers));
            Set<String> correctAnswersSet = new HashSet<>(Arrays.asList(correctAnswers));
            if (userAnswersSet.equals(correctAnswersSet)) {
                questionResultMap.put(questionId, "Correct");
            } else {
                questionResultMap.put(questionId, "Incorrect");
            }
        }

        // Đặt các thuộc tính và chuyển tiếp yêu cầu
        request.setAttribute("listAnswersCorrect", listAnswersCorrect);
        request.setAttribute("questionResultMap", questionResultMap);
        request.setAttribute("listUserAnswer", listUserAnswer);
        request.setAttribute("countAnswer", countAnswer);
        request.setAttribute("scoreQuiz", scoreQuiz);
        request.setAttribute("quizDoQuiz", quiz);
        request.setAttribute("listQuestionsByMId", listQuestionByModuleId);
        request.setAttribute("listAnswerByMId", listAnswerByModuleId);
        request.getRequestDispatcher("do_quiz/doquizsubmit.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
