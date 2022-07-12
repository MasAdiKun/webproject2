<%-- 
    Document   : adddrama
    Created on : Jul 6, 2022, 8:07:15 AM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/webs/css/dramaAdd.css">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Sofia&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	
	

	<script src="https://kit.fontawesome.com/c00a46779c.js" crossorigin="anonymous"></script>

</head>

<body>
	<!---Header--->
        <jsp:include page="layout/anavbar.jsp"></jsp:include>
	<!---Header End--->
        <br><br>
    <div class="card">
        <div class="card-header">
            <h3 style="color: #ee2e2e">Add Drama</h3>
        </div>
        <div class="form-container">
            <form action="DramaCRUDS" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="insert">
                <table style="border-style: none">
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="title" value="" required=""></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <select name="type" required="">
                                <option value="C-Drama">C-Drama</option>
                                <option value="K-Drama">K-Drama</option>                                
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Link</td>
                        <td><textarea name="iframe" cols="15" rows="10" required></textarea>
                            <br>
                            <p style="color: red; font-size: .8rem">Remember to remove width and height!</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Picture</td>
                        <td><input type="file" name="img" value="" required></td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td><input type="number" name="year" min="1" pattern="[0-9]+" value="" required></td>
                    </tr>
                    <tr>
                        <td>Genres</td>
                        <td><input type="text" name="genres" value="" required></td>
                    </tr>
                    <tr>
                        <td>Total eps</td>
                        <td><input type="number" name="eps" min="1" pattern="[0-9]+" value="" required></td>
                    </tr>
                    <tr>
                        <td>Actor & Actress</td>
                        <td><input type="text" name="act" value="" required></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><textarea name="desc" cols="20" rows="10" required></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;"><input type="submit">
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <!---Footer Start--->
        <jsp:include page="layout/footer.jsp"></jsp:include>
	<!---Footer End--->	
        <jsp:include page="/public/webs/js/navbarjs.jsp"></jsp:include>
</body>

</html>