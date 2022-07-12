<%-- 
    Document   : aboutus
    Created on : Jul 6, 2022, 7:41:06 PM
    Author     : masad
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Dlist|This is your drama list</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/webs/css/about.css">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Sofia&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	
	

	<script src="https://kit.fontawesome.com/c00a46779c.js" crossorigin="anonymous"></script>
</head>

<body>
	<!---Header--->
        <jsp:include page="layout/cnavbar.jsp"></jsp:include>
	<!---Header End--->
    <section class="aboutus" id="aboutus">
        <div class="card">
            <div class="card-header">
                <h3 style="color: #ee2e2e">About Us</h3>
            </div>
            <hr>
            <div class="card-body">
                <p>
					DList stands for Drama List. This website was created to help Asian drama lovers, specifically Korean and Chinese dramas, to find detailed information on drama titles available on this web. By accessing this website, it is hoped that visitors will be helped to choose the title of what drama to watch. Previously, we apologize if on this website there are still many shortcomings because it is still in the development. <br> <br>
				</p>
				<div class="thank">
					Thank You for visiting our website. Have a nice Day :)
				</div>
				<br>
            </div>
        </div>
    </section>

    <!---Footer Start--->
        <jsp:include page="layout/footer.jsp"></jsp:include>
	<!---Footer End--->
        <jsp:include page="../public/webs/js/navbarjs.jsp"></jsp:include>
</body>

</html>
