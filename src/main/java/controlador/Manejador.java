/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import entidad.Alumno;
import entidad.Carrera;
import entidad.Materia;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import sesion.AlumnoFacade;
import sesion.CarreraFacade;
import sesion.MateriaFacade;
import sesion.FacultadFacade;
import sesion.ExamenFacade;
import sesion.DocenteFacade;

/**
 *
 * @author matia
 */
@WebServlet(name = "Manejador", loadOnStartup = 1,
        urlPatterns = {"/Inicio",
            "/ListarAlumnos", "/FormAlumno", "/GuardarAlumno", "/EliminarAlumno",
            "/ListarMaterias", "/FormMateria", "/GuardarMateria", "/EliminarMateria",
            "/FormCarrera", "/GuardarCarrera", "/EliminarCarrera", "/Facultad", "/Consultas"})
public class Manejador extends HttpServlet {

    @EJB
    private AlumnoFacade alumnoF;
    @EJB
    private CarreraFacade carreraF;
    @EJB
    private MateriaFacade materiaF;
    @EJB
    private FacultadFacade facultadF;
    @EJB
    private ExamenFacade examenF;
    @EJB
    private DocenteFacade docenteF;

    @Override
    public void init() throws ServletException {
        // Almacena la lista de facultades en el contexto del Servlet
        getServletContext().setAttribute("facultades", facultadF.findAll());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        String url = "/index.jsp";

        switch (path) {
            // ---------- ALUMNO ----------
            case "/ListarAlumnos":
                request.setAttribute("lista", alumnoF.findAll());
                url = "/WEB-INF/vista/ListarAlumnos.jsp";
                break;
            case "/FormAlumno":
                String idA = request.getParameter("id");
                if (idA != null) {
                    request.setAttribute("alumno", alumnoF.find(Integer.valueOf(idA)));
                }
                request.setAttribute("carreras", carreraF.findAll());
                url = "/WEB-INF/vista/FormAlumno.jsp";
                break;
            case "/GuardarAlumno":
                Alumno a = new Alumno();
                String idAlumno = request.getParameter("id");
                if (idAlumno != null && !idAlumno.isBlank()) {
                    a = alumnoF.find(Integer.valueOf(idAlumno));
                }
                a.setNombre(request.getParameter("nombre"));
                a.setRegistro(Integer.valueOf(request.getParameter("registro")));
                a.setCarreraIdcarrera(carreraF.find(Integer.valueOf(request.getParameter("carrera"))));
                if (idAlumno != null && !idAlumno.isBlank()) {
                    alumnoF.edit(a);
                } else {
                    alumnoF.create(a);
                }
                response.sendRedirect(request.getContextPath() + "/ListarAlumnos");
                return;
            case "/EliminarAlumno":
                alumnoF.remove(alumnoF.find(Integer.valueOf(request.getParameter("id"))));
                response.sendRedirect(request.getContextPath() + "/ListarAlumnos");
                return;

            // ---------- MATERIA ----------
            case "/ListarMaterias":
                request.setAttribute("lista", materiaF.findAll());
                url = "/WEB-INF/vista/ListarMaterias.jsp";
                break;
            case "/FormMateria":
                String idM = request.getParameter("id");
                if (idM != null) {
                    request.setAttribute("materia", materiaF.find(Integer.valueOf(idM)));
                }
                url = "/WEB-INF/vista/FormMateria.jsp";
                break;
            case "/GuardarMateria":
                Materia m = new Materia();
                String idMateria = request.getParameter("id");
                if (idMateria != null && !idMateria.isBlank()) {
                    m = materiaF.find(Integer.valueOf(idMateria));
                }
                m.setNombre(request.getParameter("nombre"));
                if (idMateria != null && !idMateria.isBlank()) {
                    materiaF.edit(m);
                } else {
                    materiaF.create(m);
                }
                response.sendRedirect(request.getContextPath() + "/ListarMaterias");
                return;
            case "/EliminarMateria":
                materiaF.remove(materiaF.find(Integer.valueOf(request.getParameter("id"))));
                response.sendRedirect(request.getContextPath() + "/ListarMaterias");
                return;

            // ---------- CARRERA ----------
            case "/FormCarrera":
                String idC = request.getParameter("id");
                if (idC != null) {
                    request.setAttribute("carrera", carreraF.find(Integer.valueOf(idC)));
                }
                request.setAttribute("facultades", facultadF.findAll());
                url = "/WEB-INF/vista/FormCarrera.jsp";
                break;
            case "/GuardarCarrera":
                Carrera c = new Carrera();
                String idCarrera = request.getParameter("id");
                if (idCarrera != null && !idCarrera.isBlank()) {
                    c = carreraF.find(Integer.valueOf(idCarrera));
                }
                c.setNombre(request.getParameter("nombre"));
                c.setFacultadIdfacultad(facultadF.find(Integer.valueOf(request.getParameter("facultad"))));
                if (idCarrera != null && !idCarrera.isBlank()) {
                    carreraF.edit(c);
                } else {
                    carreraF.create(c);
                }
                response.sendRedirect(request.getContextPath() + "/Facultad?codigoFacu=" + c.getFacultadIdfacultad().getIdfacultad());
                return;

            case "/EliminarCarrera":
                Carrera carreraBorrar = carreraF.find(Integer.valueOf(request.getParameter("id")));
                Integer idFacu = carreraBorrar.getFacultadIdfacultad().getIdfacultad();
                carreraF.remove(carreraBorrar);
                response.sendRedirect(request.getContextPath() + "/Facultad?codigoFacu=" + idFacu);
                return;

            case "/Facultad":
                Integer nroFacultad = Integer.parseInt(request.getParameter("codigoFacu"));
                entidad.Facultad miFacu = facultadF.find(nroFacultad);
                getServletContext().setAttribute("facultad", miFacu);
                url = "/WEB-INF/vista/ListarCarreras.jsp";
                break;

            // ---------- EJ 6 ----------
            case "/Consultas":
                request.setAttribute("mesasJulio", examenF.findMesasJulio());
                request.setAttribute("sinExamenes", alumnoF.findSinExamenesAnioActual());
                request.setAttribute("docentesMasDeDos", docenteF.findConMasDeDosMaterias());
                url = "/WEB-INF/vista/Consultas.jsp";
                break;

        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
