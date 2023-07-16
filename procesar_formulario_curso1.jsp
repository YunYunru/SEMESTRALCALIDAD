<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!-- Directivas de la página JSP -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTRO DE ESTUDIANTE</title>
    <link rel="stylesheet" type="text/css" href="Archivos CSS/registrado.css">
    <!-- Importar hoja de estilos CSS desde un archivo externo -->
</head>
<body>

    <%
        // Obtener los parámetros enviados desde el formulario
        String nombre = request.getParameter("nombre_curso1");
        String cedula = request.getParameter("cedula_curso1");
        String fechaInicio = request.getParameter("fecha_inicio_curso1");
        
        // Establecer la conexión con la base de datos
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/Semestral", "root", "");
        Statement dbstatement = dbconect.createStatement();
        
        // Crear la sentencia SQL para insertar los datos en la tabla
        String insertarsql = "INSERT INTO estudiantesC (nombre, cedula, fecha_inicio) VALUES ('" + nombre + "','" + cedula + "','" + fechaInicio + "')";
        
        // Ejecutar la sentencia SQL para insertar los datos en la tabla
        dbstatement.executeUpdate(insertarsql);
    %>
    
    <br><br><h1>Estudiante registrado exitosamente<h1><br><br>
    <!-- Mostrar mensaje de éxito -->
    <a href="home.html">HOME</a>
    <!-- Enlace a la página principal -->
    
</body>
</html>