<%-- 
    Document   : datas
    Created on : 04/05/2017, 00:06:38
    Author     : M
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            
            int ano = Integer.valueOf(request.getParameter("ano"));
                        
            if(ano == 0) {
                %> <option value="0">-- Selecione o Ano --</option> <%
            } else {
                %> <option value="0">-- Selecione --</option> <%
                %> <option value="1">1º Semestre</option> <%
                %> <option value="2">2º Semestre</option> <%
            }            
        %>
    </body>
</html>
