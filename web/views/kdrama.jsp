<%-- 
    Document   : kdrama
    Created on : Jul 6, 2022, 7:34:42 PM
    Author     : masad
--%>

<%@page import="java.util.List"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/webs/css/lista.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Sofia&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <jsp:include page="layout/cnavbar.jsp"></jsp:include>
    <!-- Header End -->
    <!-- Main Content -->
    <main>
        <% 
        DramaDao dramadao = new DramaDao();
        String type = "K-Drama";
        List <DramaModel> listDrama = dramadao.showByType(type);
    %>
        <div class="list-container">
            <h2 class="title-section">Korean Drama</h2>
            <% 
                    for (DramaModel model : listDrama){                    
                %>
            <div class="drama-card">                     
                <!-- Card For Drama Title -->
                <a href="DramaCRUDS?action=details&drama_id=<%=model.getId()%>" class="drama">
                    <img src="${pageContext.request.contextPath}/public/webs/image/<%=model.getImg()%>" alt="<%=model.getTitle() %>">                    
                    <div class="caption">
                            <h3 class="drama-title"><%= model.getTitle() %></h3>
                            <h4 class="drama-detail">Actor : <%= model.getAct()%></h4>
                            <h4 class="drama-detail">Episodes : <%= model.getEps()%></h4>
                     </div>
                </a>
                <!-- Card For Drama Title End -->
            </div>
                <%
                    }
                %>
        </div>
    </main>
    <!-- Main Content End -->
    <!-- Footer -->
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <!-- Footer End -->
    <jsp:include page="/public/webs/js/navbarjs.jsp"></jsp:include>
</body>
</html>
