<%-- 
    Document   : ListarCarreras
    Created on : 20 oct 2026, 8:11:42 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Carreras</title>
    </head>
    <body>
        <h1>Carreras de ${facultad.nombre}</h1>
        <a href="${pageContext.request.contextPath}/FormCarrera">Agregar carrera</a> |
        <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
        <hr>
        <table border="3">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="c" items="${facultad.carreraCollection}">
                <tr>
                    <td>${c.idcarrera}</td>
                    <td>${c.nombre}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/FormCarrera?id=${c.idcarrera}">Editar</a>
                        <a href="${pageContext.request.contextPath}/EliminarCarrera?id=${c.idcarrera}"
                           onclick="return confirm('¿Eliminar?')">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>