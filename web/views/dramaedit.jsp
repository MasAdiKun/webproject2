<%-- 
    Document   : dramaedit
    Created on : Jul 6, 2022, 7:38:28 PM
    Author     : masad
--%>

<%@page import="DAO.DramaDao"%>
<%@page import="Model.DramaModel"%>
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
            <h3 style="color: #ee2e2e">Update Drama</h3>
        </div>
        <div class="form-container">
            <%
                DramaModel model = new DramaModel();
                DramaDao dramadao = new DramaDao();
            %>
            <form action="DramaCRUDS" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update">
                <%
                    String drama_id= request.getParameter("drama_id");
                    if(!((drama_id)==null)){
                    int id= Integer.parseInt(drama_id);
                    model = dramadao.showByDramaId(id);
                %>
                <table style="border-style: none">                    
                    <input type="hidden" name="id" value="<%=drama_id%>">
                    <tr>                        
                        <td>Title</td>
                        <td><input type="text" name="title" value="<%=model.getTitle() %>" required=""></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <select name="type" required="">
                                <option value="<%=model.getType() %>"><%=model.getType() %></option>                             
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Link</td>
                        <td><textarea name="iframe" cols="15" rows="10" required><%=model.getLink() %></textarea>
                            <br>
                            <p style="color: red; font-size: .8rem">Remember to remove width and height!</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Picture</td>
                        <td><input type="file" name="img" value="<%=model.getImg() %>" required>
                            <input type="hidden" name="oldimg" value="<%=model.getImg() %>">
                        </td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td><input type="number" name="year" value="<%=model.getYear() %>" required></td>
                    </tr>
                    <tr>
                        <td>Genres</td>
                        <td><input type="text" name="genres" value="<%=model.getGenres() %>" required></td>
                    </tr>
                    <tr>
                        <td>Total eps</td>
                        <td><input type="number" name="eps" value="<%=model.getEps() %>" required></td>
                    </tr>
                    <tr>
                        <td>Actor & Actress</td>
                        <td><input type="text" name="act" value="<%=model.getAct()  %>" required></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><textarea name="desc" cols="20" rows="10" required><%=model.getDesc() %></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;"><input type="submit"></td>
                    </tr>
                </table>
                <%
                    }else out.println("Id Not Found");
                %>
            </form>
        </div>
    </div>

    <!---Footer Start--->
        <jsp:include page="layout/footer.jsp"></jsp:include>
	<!---Footer End--->	
        <jsp:include page="/public/webs/js/navbarjs.jsp"></jsp:include>
</body>

</html>
