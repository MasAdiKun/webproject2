<%-- 
    Document   : homepage
    Created on : Jul 4, 2022, 10:55:15 AM
    Author     : masad
--%>

<%@page import="java.util.List"%>
<%@page import="Model.DramaModel"%>
<%@page import="DAO.DramaDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Dlist|This is your drama list</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/webs/css/homepagea.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Sofia&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

	<script src="https://kit.fontawesome.com/c00a46779c.js" crossorigin="anonymous"></script>

</head>

<body>
	<!---Header--->
	<jsp:include page='layout/cnavbar.jsp'></jsp:include>
	<!---Header End--->
	
	<!---Banner--->
	<div class="banner">
		<div class="sliders">
			<div class="slider">
				<img src="${pageContext.request.contextPath}/Mygirl.jpg">		
			</div>
			<div class="slider">
			        <img src="${pageContext.request.contextPath}/SW.jpg">
			</div>
			<div class="slider">
                            <img src="${pageContext.request.contextPath}/PYHOMY.jpg"/>
			</div>
		</div>
	</div>
	<!---Banner End--->
                <% 
                    DramaDao dramadao = new DramaDao();
                    String type = "K-Drama";
                    List <DramaModel> listDrama = dramadao.showTop3(type);
                %>
	<!---Korea Section--->
	<section class="koreation" id="koreation">
		<div class="heading">
			<p>Korean Drama</p>
			<a href="/project2/kdrama"><div class="bx bx-right-arrow-alt" id="right-arrow-alt-icon"></div></a>
		</div>
		<% 
                    for (DramaModel model : listDrama){                    
                %>
                
                    <div class="card-main">
                            <div class="cards">
                                    <div class="image">
                                            <a href="DramaCRUDS?action=details&drama_id=<%=model.getId()%>">
                                                    <img src="${pageContext.request.contextPath}/public/webs/image/<%=model.getImg()%>">
                                            </a>
                                    </div>
                                    <div class="title">
                                            <p><%=model.getTitle() %></p>			
                                    </div>
                                    <div class="year">
                                            <p>(<%=model.getYear() %>)</p>	
                                            <br>
                                    </div>				
                            </div>
                    </div>     
                <!-- Card For Drama Title End -->
            </div>
		<%
                    }
                %>
	</section>
	<!---Korea Section End--->
            <%
                type="C-Drama";
                listDrama= dramadao.showTop3(type);
            %>
	<!---China Section--->
        
	<section class="chination" id="chination">
		<div class="Cheading">
			<p>Chinese Drama</p>
			 <a href="/project2/cdrama"><div class="bx bx-right-arrow-alt" id="right-arrow-alt-icon"></div></a>                        
		</div>
		<% 
                    for (DramaModel model : listDrama){                    
                %>
		<div class="card-main">
                
			<div class="cards">
                            
				<div class="image">
					<a href="DramaCRUDS?action=details&drama_id=<%=model.getId()%>">
						<img src="${pageContext.request.contextPath}/public/webs/image/<%=model.getImg()%>">
					</a>
				</div>
				<div class="title">
					<p><%=model.getTitle() %></p>			
				</div>
				<div class="year">
					<p>(<%=model.getYear() %>)</p>	
					<br>
				</div>
			</div>			
                </div>
		<%
                    }
                %>
	</section>
	<!---China Section End--->
	
	<!---Footer Start--->
        <jsp:include page='layout/footer.jsp'></jsp:include>
	<!---Footer End--->	
        <jsp:include page="../public/webs/js/homepagejs.jsp"></jsp:include>
</body>
</html>