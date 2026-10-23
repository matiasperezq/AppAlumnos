<%-- 
    Document   : FormCarrera
    Created on : 20 oct 2026, 8:12:22 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Carrera</title>
    </head>
    <body>
        <h1>${empty carrera ? 'Agregar carrera' : 'Editar carrera'}</h1>
        <a href="${pageContext.request.contextPath}/index.jsp">Volver al inicio</a>
        <hr>
        <form action="${pageContext.request.contextPath}/GuardarCarrera" method="post">
            <input type="hidden" name="id" value="${carrera.idcarrera}">

            <label>Nombre:</label><br>
            <input type="text" name="nombre" value="${carrera.nombre}" maxlength="45" required>
            <br><br>

            <label>Facultad:</label><br>
            <select name="facultad" required>
                <c:forEach var="f" items="${facultades}">
                    <option value="${f.idfacultad}"
                        ${carrera.facultadIdfacultad.idfacultad == f.idfacultad ? 'selected' : ''}>
                        ${f.nombre}
                    </option>
                </c:forEach>
            </select>
            <br><br>

            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
