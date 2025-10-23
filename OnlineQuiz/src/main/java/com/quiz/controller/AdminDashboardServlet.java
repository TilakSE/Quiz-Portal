package com.quiz.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.quiz.dao.QuizDAO;
import com.quiz.dao.QuestionDAO;
import com.quiz.dao.UserDao;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/Admin/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Instantiate DAOs
        QuizDAO quizDAO = new QuizDAO();
        QuestionDAO questionDAO = new QuestionDAO();
        UserDao userDao = new UserDao();

        try {
            int quizCount = quizDAO.getTotalQuizCount();
            int questionCount = questionDAO.getQuestionCount();
            int participantCount = userDao.getParticipantCount();

            // Set as request attributes
            request.setAttribute("quizCount", quizCount);
            request.setAttribute("questionCount", questionCount);
            request.setAttribute("participantCount", participantCount);

            // Forward to JSP
            RequestDispatcher rd = request.getRequestDispatcher("/admin/AdminDashboard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load dashboard");
        }
    }
}
