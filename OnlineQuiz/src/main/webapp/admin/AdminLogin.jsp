<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login | Quiz Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #e8f0ff, #ffffff);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            display: flex;
            background: white;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            width: 900px;
            max-width: 95%;
        }

        .login-left {
            flex: 1;
            background: royalblue;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .login-left h1 {
            font-size: 1.8rem;
            margin-bottom: 0.8rem;
        }

        .login-left p {
            font-size: 1rem;
            text-align: center;
            line-height: 1.5;
            opacity: 0.9;
        }

        .login-left img {
            width: 85%;
            max-width: 350px;
            margin-top: 1rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.3);
        }

        .login-right {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 3rem;
        }

        .login-right h2 {
            color: royalblue;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        form {
            width: 100%;
            max-width: 350px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: royalblue;
        }

        button {
            width: 100%;
            background-color: royalblue;
            color: white;
            font-size: 16px;
            margin-top: 10px;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #34495e;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
                width: 95%;
            }

            .login-left {
                display: none;
            }

            .login-right {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>

    <div class="login-container">

        <!-- Left Section (Welcome Image & Text) -->
        <div class="login-left">
            <h1>Welcome Back, Admin!</h1>
            <p>Manage users, create quizzes, and view reports efficiently.</p>
            <img src="https://tse3.mm.bing.net/th/id/OIP.kWiuUFSQFk3toqMAFB8sXgHaEc?w=299&h=181&c=7&r=0&o=7&cb=12&pid=1.7&rm=3" alt="Admin Illustration">
        </div>

        <!-- Right Section (Login Form) -->
        <div class="login-right">
            <h2>Admin Login</h2>

            <% 
                String error = (String) request.getAttribute("error");
                if(error != null) {
            %>
                <div class="error"><%= error %></div>
            <% } %>

            <form action="<%=request.getContextPath()%>/Admin/AdminLoginServlet" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>

                <button type="submit">Login</button>
            </form>
        </div>

    </div>

</body>
</html>
