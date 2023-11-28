<%@page import="com.emergentes.entidades.Contacto"%>
<%@page import="java.util.List"%>
<% List<Contacto> lista = (List<Contacto>) request.getAttribute("contactos"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Contactos</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        a {
            color: #007bff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
            display: inline-block;
        }

        a:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .delete-link {
            color: #dc3545;
        }

        .delete-link:hover {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Listado de Contactos</h1>
        <a href="MainController?action=add">Nuevo Contacto</a>

    <table>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th></th>
            <th></th>
        </tr>
        <% for (Contacto item : lista) {%>
        <tr>
            <td><%= item.getId()%></td>
            <td><%= item.getNombre()%></td>
            <td><%= item.getTelefono()%></td>
            <td><%= item.getCorreo()%></td>
            <td><a href="MainController?action=edit&id=<%= item.getId()%>">Editar</a></td>
            <td><a href="MainController?action=dele&id=<%= item.getId()%>" class="delete-link" onclick="return(confirm('¿Está seguro?'))">Eliminar</a></td>
        </tr>
        <% }%>
    </table>
</body>
</html>
