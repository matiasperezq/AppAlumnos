<%-- 
    Document   : FormAlumno
    Created on : 19 oct 2026, 6:16:21 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alumno</title>
    </head>
    <body>
        <h1>${empty alumno ? 'Agregar alumno' : 'Editar alumno'}</h1>
        <a href="${pageContext.request.contextPath}/ListarAlumnos">Volver al listado</a>
        <hr>
        <form action="${pageContext.request.contextPath}/GuardarAlumno" method="post">
            <input type="hidden" name="id" value="${alumno.idalumno}">

            <label>Registro:</label><br>
            <input type="number" name="registro" value="${alumno.registro}" required>
            <br><br>

            <label>Nombre:</label><br>
            <input type="text" name="nombre" value="${alumno.nombre}" maxlength="45" required>
            <br><br>

            <label>Carrera:</label><br>
            <select name="carrera" required>
                <c:forEach var="c" items="${carreras}">
                    <option value="${c.idcarrera}"
                        ${alumno.carreraIdcarrera.idcarrera == c.idcarrera ? 'selected' : ''}>
                        ${c.nombre}
                    </option>
                </c:forEach>
            </select>
            <br><br>

            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
