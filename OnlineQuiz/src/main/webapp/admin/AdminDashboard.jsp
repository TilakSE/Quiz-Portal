<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f4f6f8;
        }

        /* HEADER */
        .header {
            background-color: royalblue;
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
        }

        .menu-icon {
            font-size: 26px;
            cursor: pointer;
            margin-right: 15px;
        }

        .logout {
            position: absolute;
            right: 20px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .logout:hover {
            text-decoration: underline;
        }

        /* SIDEMENU */
        .menu {
            height: 100vh;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #333;
            overflow-x: hidden;
            transition: 0.3s;
            padding-top: 60px;
        }

        .menu a {
            padding: 10px 25px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.2s;
        }

        .menu a:hover {
            background-color: #575757;
        }

        .menu .closebtn {
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 30px;
            color: white;
        }

        .sub-menu {
            display: none;
            padding-left: 20px;
            background-color: #444;
        }

        .sub-menu a {
            font-size: 16px;
            color: #ddd;
        }

        .sub-menu a:hover {
            background-color: #575757;
        }

        /* CONTENT */
        .content {
            margin: 40px auto;
            width: 80%;
            text-align: center;
        }

        .welcome {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #333;
        }

        /* DASHBOARD CARDS */
        .dashboard-cards {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .card {
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 25px;
            width: 250px;
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            color: royalblue;
            font-size: 22px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        /* QUICK ACTIONS */
        .quick-actions {
            margin-top: 50px;
        }

        .quick-actions h2 {
            color: #444;
            margin-bottom: 20px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .action-btn {
            background-color: royalblue;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .action-btn:hover {
            background-color: #003d99;
        }
    </style>
</head>
<body>

<div class="header">
    <span class="menu-icon" onclick="openMenu()">☰</span>
    <h2>Admin Dashboard</h2>
    <a class="logout" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
</div>

<div id="sideMenu" class="menu">
    <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times;</a>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('quizSub')">Quiz Manager ▾</a>
        <div id="quizSub" class="sub-menu">
            <a href="<%=request.getContextPath()%>/admin/QuizList.jsp">Quiz List</a>
            <a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">Create New Quiz</a>
        </div>
    </div>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('questionSub')">Question Manager ▾</a>
        <div id="questionSub" class="sub-menu">
            <a href="<%=request.getContextPath()%>/admin/AddQuestion.jsp">Add New Question(s)</a>
            <a href="<%=request.getContextPath()%>/QuestionListServlet">Question List</a>
        </div>
    </div>

    <a href="<%=request.getContextPath()%>/admin/leaderboard.jsp">Leaderboard</a>
</div>

<div class="content">
    <p class="welcome">Welcome, <strong><%= admin.getUsername() %></strong> </p>

    <div class="dashboard-cards">
        <div class="card">
            <h3>Total Quizzes</h3>
            <p><%= request.getAttribute("quizCount") != null ? request.getAttribute("quizCount") : 0 %></p>
        </div>
        <div class="card">
            <h3>Total Questions</h3>
            <p><%= request.getAttribute("questionCount") != null ? request.getAttribute("questionCount") : 0 %></p>
        </div>
        <div class="card">
            <h3>Total Participants</h3>
            <p><%= request.getAttribute("participantCount") != null ? request.getAttribute("participantCount") : 0 %></p>
        </div>
    </div>

    <div class="quick-actions">
        <h2>Quick Actions</h2>
        <div class="action-buttons">
            <button class="action-btn" onclick="window.location.href='<%=request.getContextPath()%>/admin/AddQuestion.jsp'">Add Questions</button>
            <button class="action-btn" onclick="window.location.href='<%=request.getContextPath()%>/admin/createQuiz.jsp'">Create Quiz</button>
            <button class="action-btn" onclick="window.location.href='<%=request.getContextPath()%>/admin/leaderboard.jsp'">View Leaderboard</button>
        </div>
    </div>
</div>

<script>
    function toggleSubMenu(id) {
        var subMenu = document.getElementById(id);
        subMenu.style.display = subMenu.style.display === "block" ? "none" : "block";
    }

    function openMenu() {
        document.getElementById("sideMenu").style.width = "250px";
    }

    function closeMenu() {
        document.getElementById("sideMenu").style.width = "0";
    }
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
