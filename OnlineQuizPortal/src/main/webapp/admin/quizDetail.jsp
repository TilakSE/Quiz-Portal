<%@ page import="com.quiz.dao.QuizDAO,com.quiz.model.Quiz,com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int quizId = Integer.parseInt(request.getParameter("quizId"));
    QuizDAO dao = new QuizDAO();
    Quiz quiz = dao.getQuizById(quizId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        padding: 20px;
    }
    h2 {
        color: #2d3436;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    th, td {
        border: 1px solid #b2bec3;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #0984e3;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #dfe6e9;
    }
</style>
</head>
<body>

<h2>Quiz: <%= quiz.getQuizName() %> (Category: <%= quiz.getCategory() %>)</h2>

<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Question</th>
            <th>Option A</th>
            <th>Option B</th>
            <th>Option C</th>
            <th>Option D</th>
            <th>Correct Option</th>
        </tr>
    </thead>
    <tbody>
    <%
        int count = 1;
        for(Question q : quiz.getQuestions()) {
    %>
        <tr>
            <td><%= count++ %></td>
            <td><%= q.getQuestion_text() %></td>
            <td><%= q.getOption_a() %></td>
            <td><%= q.getOption_b() %></td>
            <td><%= q.getOption_c() %></td>
            <td><%= q.getOption_d() %></td>
            <td><%= q.getCorrect_option() %></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
