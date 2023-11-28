package com.emergentes.controller;

import com.emergentes.bean.BeanContacto;
import com.emergentes.entidades.Contacto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanContacto daoContacto = new BeanContacto();
        int id;
        Contacto c = new Contacto();
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        switch (action) {
            case "add":
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("contactos-edit.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                c = daoContacto.buscar(id);
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("contactos-edit.jsp").forward(request, response);
                break;
            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoContacto.eliminar(id);
                response.sendRedirect("MainController");

                break;
            case "view":
                List<Contacto> lista = daoContacto.listarTodos();
                request.setAttribute("contactos", lista);
                request.getRequestDispatcher("contactos.jsp").forward(request, response);

            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanContacto daoContacto = new BeanContacto();
        Contacto c = new Contacto();
        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNombre(request.getParameter("nombre"));
        c.setTelefono(request.getParameter("telefono"));
        c.setCorreo(request.getParameter("correo"));

        if (c.getId() == 0) {
            System.out.println("Registro nuevo...");
            daoContacto.insertar(c);
        } else {
            daoContacto.editar(c);
        }
        response.sendRedirect("MainController");
    }

    private void nuevo() {
        BeanContacto dao = new BeanContacto();
        Contacto c = new Contacto();
        c.setNombre("Richard Erick");
        c.setTelefono("4322423");
        c.setCorreo("richard@gmail.com");

        dao.insertar(c);
    }

    private void editar() {
        BeanContacto dao = new BeanContacto();
        //id para editar
        Integer id = 6;
        Contacto c = dao.buscar(id);
        c.setNombre("Ricardin erickis");
        c.setCorreo("ricard@gmail.com");

        dao.editar(c);
    }

    private void eliminar() {

        BeanContacto dao = new BeanContacto();
        //id para eliminar
        Integer id = 7;
        dao.eliminar(id);
    }

    private void mostrar() {
        BeanContacto dao = new BeanContacto();

        List<Contacto> lista = dao.listarTodos();
        for (Contacto item : lista) {
            System.out.println(item.toString());
        }

    }
}
