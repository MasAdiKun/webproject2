<%-- 
    Document   : dramadetail
    Created on : Jul 6, 2022, 7:37:00 PM
    Author     : masad
--%>

<%@page import="Model.DramaModel"%>
<%@page import="DAO.DramaDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DList|Chinese Drama</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/webs/css/detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Sofia&display=swap" rel="stylesheet">
</head>
<body>
	<!-- Header -->
        <jsp:include page="layout/cnavbar.jsp"></jsp:include>
	<!-- Header End -->
        <%
            DramaModel model = new DramaModel();
            DramaDao dramadao = new DramaDao();
        %>
    <main>
        <%
            String drama_id= request.getParameter("drama_id");
                    if(!((drama_id)==null)){
                    int id= Integer.parseInt(drama_id);
                    model = dramadao.showByDramaId(id);
        %>
		<div class="content">
			<div class="trailer">
				<!-- Trailer -->
                                <%=model.getLink() %>
			</div>
			<div class="detail">
				<div class="infos">
					<!-- Drama Title -->
					<h3 class="title">
						<%=model.getTitle() %>                                                
					</h3>
					<div class="info">
						<!-- Drama Info -->
						<table>
							<tr>
								<td>Year</td>
								<td>&nbsp;&nbsp; :&nbsp;<%=model.getYear()%></td>
							</tr>
							<tr>
								<td>Total Episodes</td>
								<td>&nbsp;&nbsp; :&nbsp;<%=model.getEps()%></td>
							</tr>
							<tr class="genre">
								<td>Genres</td>
								<td>&nbsp;&nbsp; :&nbsp;<%=model.getGenres()%></td>
							</tr>
							<tr>
								<td>Actor</td>
								<td>&nbsp;&nbsp; :&nbsp;<%=model.getAct() %></td>
							</tr>
						</table>
						<h5 class="act">Synopsis</h5>
					</div>
				</div>
				<!-- Synopsis -->
				<p class="synopsis">
					<%=model.getDesc() %>
				</p>
                                <br><br>
			</div>
		</div>
                <%
                    }
                %>
    </main>
	<!-- Footer -->
        <jsp:include page="layout/footer.jsp"></jsp:include>
        <!-- End Footer -->
        <jsp:include page="/public/webs/js/navbarjs.jsp"></jsp:include>
</body>
</html>
