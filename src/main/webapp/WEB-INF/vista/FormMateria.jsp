<%-- 
    Document   : FormMateria
    Created on : 19 oct 2026, 6:29:48 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Materia</title>
    </head>
    <body>
        <h1>${empty materia ? 'Agregar materia' : 'Editar materia'}</h1>
        <a href="${pageContext.request.contextPath}/ListarMaterias">Volver al listado</a>
        <hr>
        <form action="${pageContext.request.contextPath}/GuardarMateria" method="post">
            <input type="hidden" name="id" value="${materia.idmateria}">

            <label>Nombre</label><br>
            <input type="text" name="nombre" value="${materia.nombre}" required>
            <br><br>

            <input type="submit" value="Guardar">
        </form>
    </body>
</html>