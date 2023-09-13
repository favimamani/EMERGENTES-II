package com.emergentes.controlador;

import com.emergentes.modelo.Descripcion;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Luis
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    
    private int ultimoId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Descripcion> lista = (ArrayList<Descripcion>) ses.getAttribute("listap");
        
        int idaux = 0;
        for (Descripcion item : lista){
            idaux = item.getId();
        }
        return idaux + 1;
    }
    
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Descripcion> lista = (ArrayList<Descripcion>) ses.getAttribute("listap");
        
        int i = 0;
        if (lista.size() > 0){
            while (i < lista.size()){
                if(lista.get(i).getId() == id){
                    break;
                }else{
                    i++;
                }
            }
        }
        return i;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        
        if(ses.getAttribute("listap") == null){
            ArrayList<Descripcion> listaux = new ArrayList<Descripcion>();
            ses.setAttribute("listap",listaux);
        }
        
        ArrayList<Descripcion> lista = (ArrayList<Descripcion>) ses.getAttribute("listap");
        
        String op = request.getParameter("op");
        String opcion = (op != null) ? request.getParameter("op"): "view";
        
        Descripcion obj1 = new Descripcion();
        int id, pos;
        
        switch (opcion){
            case "nuevo": //Insertar nuevo registro
                request.setAttribute("miPersona", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                    break;
            case "editar": //Editar registro
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarIndice(request,id);
                obj1 = lista.get(pos);
                request.setAttribute("miPersona", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                    break;
            case "eliminar": //Elimina registro
                pos = buscarIndice(request,Integer.parseInt(request.getParameter("id")));
                lista.remove(pos);
                ses.setAttribute("listap", lista);
                response.sendRedirect("index.jsp");
                    break;
            case "view":
            response.sendRedirect("index.jsp");
        }
            
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        
        ArrayList<Descripcion> lista = (ArrayList<Descripcion>) ses.getAttribute("listap");
        
        Descripcion obj1 = new Descripcion();
        
    obj1.setId(Integer.parseInt(request.getParameter("id")));
    obj1.setDescripcion(request.getParameter("descripcion"));
    
    // Convert the "cantidad" parameter to an int
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    obj1.setCantidad(cantidad);
    
    // Convert the "precio" parameter to a double
    double precio = Double.parseDouble(request.getParameter("precio"));
    obj1.setPrecio(precio);
    
    obj1.setCategoria(request.getParameter("categoria"));

        int idt = obj1.getId();
        
        if(idt == 0){
            int ultID;
            ultID = ultimoId(request);
            obj1.setId(ultID);
            lista.add(obj1);
        } else {
            lista.set(buscarIndice(request, idt), obj1);
        }
        ses.setAttribute("listap", lista);
        response.sendRedirect("index.jsp");
    }
    
}
