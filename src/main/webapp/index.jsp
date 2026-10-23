<%-- 
    Document   : index
    Created on : 19 oct 2026, 6:08:17 p. m.
    Author     : matia
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alumnos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .titulo {
                text-align: center;
                margin: 30px 0 10px;
            }
            .titulo .linea1 {
                color: #3a7ab8;
                font-size: 28px;
                letter-spacing: 8px;
                font-weight: bold;
            }
            .titulo .linea2 {
                color: #2fa58f;
                font-size: 28px;
                letter-spacing: 8px;
                font-weight: bold;
            }
            .navbar-default {
                background: none;
                border: none;
                border-bottom: 3px solid #f0932b;
            }
            .navbar-nav {
                float: none;
                display: inline-block;
            }
            .menu {
                text-align: center;
            }
            .banner {
                height: 300px;
                color: #fff;
                font-size: 40px;
                font-weight: bold;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            footer {
                text-align: right;
                color: #666;
                margin: 20px;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <div class="container">

            <div class="titulo">
                <div class="linea1">SISTEMA</div>
                <div class="linea2">ALUMNOS</div>
            </div>

            <nav class="navbar navbar-default menu">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Alumnos <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/FormAlumno">Agregar</a></li>
                            <li><a href="${pageContext.request.contextPath}/ListarAlumnos">Listar</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Materias <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/FormMateria">Agregar</a></li>
                            <li><a href="${pageContext.request.contextPath}/ListarMaterias">Listar</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Carreras <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/FormCarrera">Agregar</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Facultades <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <c:forEach var="facu" items="${facultades}">
                                <li><a href="Facultad?codigoFacu=${facu.getIdfacultad()}">${facu.getNombre()}</a></li>
                                </c:forEach>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/Consultas">Consultas</a></li>
                </ul>
            </nav>

            <div class="banner" style="background:#f5a65b;">Java</div>

            <footer>Desarrollo Backend</footer>
        </div>
    </body>
</html>