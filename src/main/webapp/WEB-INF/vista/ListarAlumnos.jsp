<%-- 
    Document   : ListarAlumnos
    Created on : 19 oct 2026, 5:37:30 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alumnos</title>
    </head>
    <body>
        <h1>Listado de alumnos</h1>
        <a href="${pageContext.request.contextPath}/FormAlumno">Agregar alumno</a> |
        <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
        <hr>
        <table border="3">
            <tr>
                <th>Registro</th>
                <th>Nombre</th>
                <th>Carrera</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="a" items="${lista}">
                <tr>
                    <td>${a.registro}</td>
                    <td>${a.nombre}</td>
                    <td>${a.carreraIdcarrera.nombre}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/FormAlumno?id=${a.idalumno}">Editar</a>
                        <a href="${pageContext.request.contextPath}/EliminarAlumno?id=${a.idalumno}"
                           onclick="return confirm('¿Eliminar?')">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
