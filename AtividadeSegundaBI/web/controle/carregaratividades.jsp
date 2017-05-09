<%-- 
    Document   : carregaratividades
    Created on : 05/05/2017, 18:15:43
    Author     : M
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.FichaDAO"%>
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
            ResultSet rs;
                        
            SimpleDateFormat formaDia = new SimpleDateFormat("dd");
            SimpleDateFormat formaMes = new SimpleDateFormat("MM");
            SimpleDateFormat formaHora = new SimpleDateFormat("HH:mm");
            
            String ano = request.getParameter("ano");
            String semestre = request.getParameter("semestre");
            String matricula = request.getParameter("matricula");
                        
            rs = FichaDAO.pesquisarFichas(ano, semestre, matricula);
                        
            while(rs.next()) {
                %>
                <tr>
                    <td> <%= rs.getInt(2) %> </td>
                    <td> <%= formaDia.format(rs.getDate(6)) %> </td>
                    <td> <%= formaMes.format(rs.getDate(6)) %> </td>
                    <td> <%= formaHora.format(rs.getTime(7)) %> </td>
                    <td> <%= rs.getString(8) %> / <%= rs.getString(9) %> </td>
                    <td> <%= rs.getString(10) %> </td>
                </tr>
                <%
            }
        %>
        
    </body>
</html>
