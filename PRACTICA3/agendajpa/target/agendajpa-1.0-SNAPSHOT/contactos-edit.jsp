<%@page import="com.emergentes.entidades.Contacto"%>
<%
    Contacto contacto = (Contacto)request.getAttribute("contacto");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Contactos</title>
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
            padding-top: 60px;
            margin-bottom: 20px;
        }

        form {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        td {
            padding: 15px;
        }

        input[type="text"] {
            width: calc(100% - 30px);
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            outline: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Registro de Contactos</h1>
    <form action="MainController" method="post">
        <input type="hidden" name="id" value="<%=contacto.getId()%>">
        <table>
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="nombre" value="<%= contacto.getNombre() %>"></td>
            </tr>
            <tr>
                <td>Teléfono</td>
                <td><input type="text" name="telefono" value="<%= contacto.getTelefono() %>"></td>
            </tr>
            <tr>
                <td>Correo</td>
                <td><input type="text" name="correo" value="<%= contacto.getCorreo() %>"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>