
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Consultas</title>
    </head>
    <body>
        <h1>Consultas</h1>
        <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
        <hr>

        <h2>6.1 Mesas de examen - turno de julio</h2>
        <table border="3">
            <tr>
                <th>Fecha</th>
                <th>Materia</th>
                <th>Alumno</th>
                <th>Nota</th>
            </tr>
            <c:forEach var="e" items="${mesasJulio}">
                <tr>
                    <td><fmt:formatDate value="${e.examenPK.fecha}" pattern="dd/MM/yyyy HH:mm"/></td>
                    <td>${e.materia.nombre}</td>
                    <td>${e.alumno.nombre}</td>
                    <td>${e.nota}</td>
                </tr>
            </c:forEach>
        </table>

        <h2>6.2 Alumnos que no rindieron ninguna materia este año</h2>
        <table border="3">
            <tr>
                <th>Registro</th>
                <th>Nombre</th>
                <th>Carrera</th>
            </tr>
            <c:forEach var="a" items="${sinExamenes}">
                <tr>
                    <td>${a.registro}</td>
                    <td>${a.nombre}</td>
                    <td>${a.carreraIdcarrera.nombre}</td>
                </tr>
            </c:forEach>
        </table>

        <h2>6.3 Docentes que dictan más de dos materias</h2>
        <table border="3">
            <tr>
                <th>Nombre</th>
                <th>Cargo</th>
                <th>Cantidad de materias</th>
            </tr>
            <c:forEach var="d" items="${docentesMasDeDos}">
                <tr>
                    <td>${d.nombre}</td>
                    <td>${d.cargo}</td>
                    <td>${d.materiaCollection.size()}</td>
                </tr>
            </c:forEach>
        </table>   

    </body>
</html>
