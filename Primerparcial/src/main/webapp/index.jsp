<%@page import="java.util.ArrayList" %>
<%@page import="com.emergentes.modelo.Descripcion" %>
<%
    ArrayList<Descripcion> lista = (ArrayList<Descripcion>) session.getAttribute("listap");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Primer parcial</title>
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
          <center><table border="1">
       <tr><th>
        <center><h1>PRIMER PARCIAL TEM-742</h1></center><br>
        <center><p>Nombre: Dayana Faviola Colque Mamani<p></center><br>
        <center><p>Carnet: 10936863</p></center><br>
       </th></tr>
       </table></center>
        <center><h1>Gestion de productos</h1></center><br>
            <a href="MainController?op=nuevo">Nuevo producto</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for (Descripcion item : lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getDescripcion()%></td>
                <td><%= item.getCantidad()%></td>
                <td><%= item.getPrecio()%></td>
                <td><%= item.getCategoria()%></td>
                <td><a href="MainController?op=editar&id=<%=item.getId()%>">Editar</a></td>
                <td><a href="MainController?op=eliminar&id=<%=item.getId()%>"
                       onclick='return confirm("Esta seguro de eliminar el registro?");'>Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>        
</html>
