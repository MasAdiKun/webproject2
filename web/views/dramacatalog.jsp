<%-- 
    Document   : dramacatalog
    Created on : Jul 6, 2022, 7:05:35 PM
    Author     : masad
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.DramaDao"%>
<%@page import="Model.DramaModel"%>
<%@page import="java.sql.ResultSet"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/webs/css/ccatalog.css">
	
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
        <% 
          DramaDao dramadaoc = new DramaDao();
          List <DramaModel> listDramaC = dramadaoc.showByType("C-Drama");
        %>
        <div class="card" id="cdrama">
        <div class="card-header">
            <h3 style="color: #ee2e2e">Chinese Drama Catalog</h3>
        </div>
        <table>
        <tr>
            <th class="col-1">#</th>
            <th class="col-2">Title</th>
            <th class="col-1">Year</th>
            <th class="col-1">Total episodes</th>
            <th class="col-1">Genres</th>
            <th class="col-5">Description</th>
            <th class="col-2">Action</th>
        </tr>
        <tr>
            <% 
            for (DramaModel modelc : listDramaC){
            %>
            <td><%= modelc.getId() %></td>
            <td><%= modelc.getTitle()%></td>
            <td><%= modelc.getYear()%></td>
            <td><%= modelc.getEps()%></td>
            <td><%= modelc.getGenres()%></td>
            <td><%= modelc.getDesc() %></td>
            <td style="text-align: center">
                <a href="DramaCRUDS?action=edit&drama_id=<%=modelc.getId()%>"><button type="button" class="action">Edit</button></a>
                <a href="DramaCRUDS?action=delete&drama_id=<%=modelc.getId()%>"><button type="button" class="action">Delete</button></a>
            </td>
        </tr>
            <%
                }
            %>
        </table>
    </div>
        <br><br>
        <%
          DramaDao dramadaok = new DramaDao();
          List <DramaModel> listDramaK = dramadaok.showByType("K-Drama");
          int a=0;
        %>
        <div class="card" id="kdrama">
        <div class="card-header">
            <h3 style="color: #ee2e2e">Korean Drama Catalog</h3>
        </div>
        <table>
        <tr>
            <th class="col-1">#</th>
            <th class="col-2">Title</th>
            <th class="col-1">Year</th>
            <th class="col-1">Total episodes</th>
            <th class="col-1">Genres</th>
            <th class="col-5">Description</th>
            <th class="col-2">Action</th>
        </tr>
        <tr>
            <% 
            for (DramaModel modelk : listDramaK){
            a++;
            %>
            <td><%=a %></td>
            <td><%= modelk.getTitle()%></td>
            <td><%= modelk.getYear()%></td>
            <td><%= modelk.getEps()%></td>
            <td><%= modelk.getGenres()%></td>
            <td><%= modelk.getDesc() %></td>
            <td style="text-align: center">
                <a href="DramaCRUDS?action=edit&drama_id=<%=modelk.getId()%>"><button type="button" class="action">Edit</button></a>
                <a href="DramaCRUDS?action=delete&drama_id=<%=modelk.getId()%>"><button type="button" class="action">Delete</button></a>
            </td>
        </tr>
            <% 
                } 
            %>
        </table>
    </div>
    <div class="type-catalog" id="links">
        <div class="type-link">
           <a href="#cdrama"><h4>C-Drama</h4></a> 
        </div>
        <hr>
        <div class="type-link">
            <a href="#kdrama"><h4>K-Drama</h4></a>
        </div>        
    </div>
        <!---Footer Start--->
        <jsp:include page="layout/footer.jsp"></jsp:include>
	<!---Footer End--->	
        <jsp:include page="/public/webs/js/navbarjs.jsp"></jsp:include>
</body>

</html>
<!-- dynamic -->
