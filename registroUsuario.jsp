<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
</head>
<body>
    <%
        // Obteniendo los parámetros del formulario de registro
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String contrasena = request.getParameter("contrasena");
        
        // Estableciendo la conexión con la base de datos MySQL
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/Semestral", "root", "");
        Statement dbstatement = dbconect.createStatement();
        
        // Creando la consulta SQL para insertar los datos en la tabla 'usuarios'
        String insertarsql = "INSERT INTO usuarios (nombre, apellido, usuario, edad, contrasena) VALUES ('" + nombre + "','" + apellido + "','" + usuario + "'," + edad + ",'" + contrasena + "')";
        
        // Ejecutando la consulta SQL para insertar los datos en la base de datos
        dbstatement.executeUpdate(insertarsql);
        
        // Redireccionando al usuario a la página de inicio 'home.html'
        response.sendRedirect("home.html");
    %>
</body>
</html>