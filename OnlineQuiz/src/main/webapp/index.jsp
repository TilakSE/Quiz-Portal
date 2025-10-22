<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Welcome | Login Portal</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      font-family: "Segoe UI", Arial, sans-serif;
      background: linear-gradient(135deg, #e8f0ff, #ffffff);
    }

    header {
      background-color: royalblue;
      color: white;
      text-align: center;
      padding: 1.2rem 0;
      font-size: 1.5rem;
      font-weight: bold;
      letter-spacing: 0.5px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    }

    .container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 2rem;
      padding: 2rem;
      flex-wrap: wrap;
    }

    .card {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
      padding: 2rem;
      width: 280px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
    }

    .card img {
      width: 100px;
      height: 100px;
      object-fit: contain;
      margin-bottom: 1rem;
    }

    .card h3 {
      margin-bottom: 0.5rem;
      color: royalblue;
    }

    .card p {
      color: #333;
      font-size: 0.95rem;
      margin-bottom: 1.2rem;
    }

    .card a {
      text-decoration: none;
      background-color: royalblue;
      color: white;
      padding: 0.5rem 1rem;
      border-radius: 5px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .card a:hover {
      background-color: #34495e;
    }

    footer {
      background-color: royalblue;
      color: white;
      text-align: center;
      padding: 10px 0;
      width: 100%;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>

  <header>Welcome to Quiz Portal</header>

  <div class="container">
    <!-- User Login Card -->
    <div class="card">
      <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="User Icon">
      <h3>User Login</h3>
      <p>Access your personal dashboard, attempt quizzes, and view leaderboard.</p>
      <a href="<%= request.getContextPath() %>/User/User.jsp">Go to User Login</a>
    </div>

    <!-- Admin Login Card -->
    <div class="card">
      <img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png" alt="Admin Icon">
      <h3>Admin Login</h3>
      <p>Manage users, create quizzes, add questions, and view leaderboard.</p>
      <a href="<%= request.getContextPath() %>/admin/AdminLogin.jsp">Go to Admin Login</a>
    </div>
  </div>
<%@ include file="./admin/footer.jsp" %>
</body>
</html>
