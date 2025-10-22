<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Portal</title>
<style>
form {
    background-color: white;
    padding: 1rem 2rem;
    border-radius: 8px;
    max-width: 400px;
    margin: 2rem auto;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

form input[type=text], form input[type=password] {
    width: 100%;
    padding: 0.5rem;
    margin: 0.3rem 0 1rem 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

form input[type=submit] {
    background-color: royalblue;
    color: white;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 0.5rem;
}

form input[type=submit]:hover {
    background-color: #34495e;
}

.message {
    text-align: center;
    margin-top: 1rem;
    color: blue;
}

.wlcm-img {
            width: 90%;
            max-width: 500px;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: block;
            margin:0 auto;
            
}

</style>
</head>
<body>

<h2 style="text-align:center;">User Portal</h2>

<form action="<%= request.getContextPath() %>/user" method="post">
    <label>Username:</label>
    <input type="text" name="username" required>

    <label>Password:</label>
    <input type="password" name="password" required>

    <input type="submit" name="action" value="Register">
    <input type="submit" name="action" value="Login">
</form>

<% 
String message = request.getParameter("msg");
if(message != null) {
%>
    <div class="message"><%= message %></div>
<% } %>
<br>
<img class="wlcm-img" src="data:image/webp;base64,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" alt="Welcome image">

</body>
</html>