
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Etiquetas de JSTL Core</h1>
        <h2>1. Uso de set</h2>
        <p>Se utiliza para crear variables con algun valor</p>
        <c:set var="Carrera" value="Ingenieria de Sistemas" />
        <c:set var="Ciudad" value="El Alto" />
        <hr>

        <h2>2. Uso de out</h2>
        <p>El valor de carrera es: <c:out value="${Carrera}" /> </p>
        <p>El bvalor de ciudad es: ${Ciudad} </p>

        <p>El valor de universidad es: <c:out value="${Univesidad}" default="NO HAY DATO"/> </p>

        <h2>3.Uso de remove</h2>
        <p>Se usa oara eliminar variables</p>
        <c:remove var="Ciudad" />
        <p>El valor de ciudad es: <c:out value="${Ciudad}" default="SIN CIUDAD" /></p>
        <hr>
        <h2>4.Uso de catch</h2>
        <p>Se usa para capturar excepciones</p>
        <c:catch var="excep">
            <%= 3 / 3%>
        </c:catch>
        <c:if test="${excep!=null}" var="prueba">
            <p style="color:red;">Ocurrio una excepcion: ${excep}</p>
            <p>El valor de prueba es: ${prueba}</p>
        </c:if>
        <hr>
        <h2>Uso de if</h2>
        <p>Se definen dos variables a y b</p>
        <c:set var="a" value="25" />
        <c:set var="b" value="25" />
        <c:if test="${a > b}">
            <p>${a} es mayor que ${b}</p>
        </c:if>
        <c:if test="${b > a}">
            <p>${b} es mayor que ${a}</p>
        </c:if>
        <c:if test="${b == a}">
            <p>Ambas variables son iguales</p>
        </c:if>

        <h2>Probando el if con un parametro desde la URL</h2>
        <c:if test="${param.usuario == 'admin'}" >
            <p style="color: green;">Bienvnido Administrador </p>
        </c:if>
        <c:if test="${param.usuario != 'admin'}" >
            <p>Bienvnido usuario comun</p>
        </c:if>
        <hr>
        <h1>Uso de if choose for each</h1>
        <h2>Uso de if</h2>
        <p>Para definir si una persona es mayor o menor de edad</p>

        <c:set var="Mario" value="25" />
        <c:set var="Maria" value="10" />

        <c:if test="${Mario < 18}">
            <p style="color: red;">Mario es menor de edad</p>
        </c:if>

        <c:if test="${Maria < 18}">
            <p style="color: red;">Maria es menor de edad</p>
        </c:if>

        <c:if test="${Mario >= 18}">
            <p>Mario es mayor de edad</p>
        </c:if>

        <c:if test="${Maria >= 18}">
            <p>Maria es mayor de edad</p>
        </c:if>
        <hr>
        <h2>Uso de choose</h2>
        <p>Para de definir las calificaciones </p>
        <c:set var="Maria" value="85" />
        <c:set var="Alicia" value="0" />
        <c:set var="Rodrigo" value="49" />

        <c:choose>
            <c:when test="${Maria >= 51 && Maria <= 100}">
                <div style="background-color: green;">Aprobado</div>
            </c:when>
            <c:when test="${Maria>=1 && Maria <= 50}">
                <div style="background-color: red;">Reprobado</div>
            </c:when>
            <c:when test="${Maria == 0}">
                <div style="background-color: yellow;">No se presento</div>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${ Rodrigo>= 51 && Rodrigo <= 100}">
                <div style="background-color: green;">Aprobado</div>
            </c:when>
            <c:when test="${Rodrigo>=1 && Rodrigo <= 50}">
                <div style="background-color: red;">Reprobado</div>
            </c:when>
            <c:when test="${Rodrigo == 0}">
                <div style="background-color: yellow;">No se presento</div>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${ Alicia>= 51 && Alicia <= 100}">
                <div style="background-color: green;">Aprobado</div>
            </c:when>
            <c:when test="${Alicia>=1 && Alicia <= 50}">
                <div style="background-color: red;">Reprobado</div>
            </c:when>
            <c:when test="${Alicia == 0}">
                <div style="background-color: yellow;">No se presento</div>
            </c:when>
        </c:choose>
                <hr>
                <h2>Uso de For Each</h2>
                <p>Para definir la suma de los numeros</p>
                <c:set var="suma" value="0" />

                <c:forEach begin="1" end="10" var="numero">
                    <c:set var="suma" value="${suma + numero}" />
                </c:forEach>

                <p>La suma de los números del 1 al 10 es: ${suma}</p>
                <c:forEach begin="1" end="100" var="numero">
                    <c:set var="suma" value="${suma + numero}" />
                </c:forEach>

                <p>La suma de los números del 1 al 100 es: ${suma}</p>




    </body>
</html>

