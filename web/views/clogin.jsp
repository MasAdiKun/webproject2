<%-- 
    Document   : clogin
    Created on : Jul 6, 2022, 8:06:18 AM
    Author     : masad
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Dlist|This is your drama list</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/webs/css/logins.css">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Sofia&display=swap" rel="stylesheet">
</head>
<body>
	<div class="title">
		<div class="form">
			<div class="button-box">
				<div id="btn"></div>
				<button type="button" class="toggle-btn" onclick="login()">Log In</button>
				<button type="button" class="toggle-btn" onclick="register()">Register</button>
			</div>
			<!-- Login Form -->
			<form id="login" class="input-form" onsubmit="return validation()" action="LoginCRUD">
                                <input type="hidden" name="action" value="loginc"/>
				<input type="text" class="input-field" placeholder="Username"  name="uname" id="uname">
				<div id="username_val">Please fill the username field</div>
				<input type="password" class="input-field" placeholder="Password" name="pass"  id="pass">
				<div id="pass_val">Please fill the password field</div>
				<input type="checkbox" class="check-box"><span>Remember Password</span>
				<button type="submit" class="submit-btn">Log In</button>
				<div id="question">
					<a href="/project2/alogin">Are you admin?</a>
				</div>
			</form>
			<!-- Login Form End -->
			<!-- Register Form -->
                        <form id="register" class="input-form" action="LoginCRUD">
                                <input type="hidden" name="action" value="insertc" />
                                <input type="text" name="username" class="input-field" placeholder="Username" required>
				<input type="email" name="email" class="input-field" placeholder="Email" required>
				<input type="password" name="pass" class="input-field" placeholder="Password" required>
				<input type="checkbox" class="check-box" id="check" onclick="enable()"><span>I agree to the terms & conditions</span>
				<button type="submit" class="submit-btn" id="regis" disabled>Register</button></a>
			</form>	
			<!-- Register Form End -->
		</div>
	</div>
    <jsp:include page="/public/webs/js/loginjs.jsp"></jsp:include>

</body>
</html>