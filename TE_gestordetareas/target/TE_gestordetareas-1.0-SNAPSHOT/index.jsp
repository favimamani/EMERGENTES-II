<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Tarea"%>
<%
    
    
    if (session.getAttribute("lista_tarea") == null) {
        ArrayList<Tarea> lista_auxiliar = new ArrayList<Tarea>();
        
        Tarea t1 = new Tarea(1,"Reunion con estudiantes de la carrera",true);
        Tarea t2 = new Tarea(2,"Estudiar para el examen de probabilidades",true);
        Tarea t3 = new Tarea(3,"Partido de fultsal",false);
        
        lista_auxiliar.add(t1);
        lista_auxiliar.add(t2);
        lista_auxiliar.add(t3);
        
        session.setAttribute("lista_tarea", lista_auxiliar);

    }
    ArrayList<Tarea> lista_completa = (ArrayList<Tarea>) session.getAttribute("lista_tarea");
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
     <title>Lista de Tareas</title>

        <style>
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #ccc;
                padding: 8px;
            }

            th {
                background-color: cyan;
            }

            .container {
                text-align: center;
                background-color: lightblue
                
            }
        </style>
        
    </head>
    <body>

        <div class="container">
            <h2>GESTOR DE TAREAS</h2>
            <h2>NOMBRE:DAYANA FAVIOLA COLQUE MAMANI</h2>
            <a href="Servlet?opcion=nuevo"><button>NUEVO</button></a>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tarea</th>
                        <th>Completado</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (lista_completa != null) {
                            for (Tarea item : lista_completa) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getTarea()%></td>
                        <td><input type="checkbox" name="check" <% if(item.isCheck() == true ){%> 
                                   value="true" checked <%} else { %> value="false"  <%}%> >  </td>           
                        <td>
                            <a href="Servlet?opcion=editar&id=<%= item.getId()%>&check=<%= item.isCheck()%>"
                               ><button>EDITAR</button></a>
                            <a href="Servlet?opcion=eliminar&id=<%= item.getId()%>" onclick="return(confirm
                                ('ESTA SEGURO DE ELIMINAR LA TAREA ?'))"><button>ELIMINAR</button></a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>