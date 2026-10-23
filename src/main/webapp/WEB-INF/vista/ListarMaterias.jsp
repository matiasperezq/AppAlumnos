<%-- 
    Document   : ListarMaterias
    Created on : 19 oct 2026, 6:28:55 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Materias</title>
    </head>
    <body>
        <h1>Listado de materias</h1>
        <a href="${pageContext.request.contextPath}/FormMateria">Agregar materia</a> |
        <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
        <hr>
        <table border="3">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="m" items="${lista}">
                <tr>
                    <td>${m.idmateria}</td>
                    <td>${m.nombre}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/FormMateria?id=${m.idmateria}">Editar</a>
                        <a href="${pageContext.request.contextPath}/EliminarMateria?id=${m.idmateria}"
                           onclick="return confirm('¿Eliminar?')">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
