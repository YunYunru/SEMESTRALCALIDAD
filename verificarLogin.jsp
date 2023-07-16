<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verificar Login</title>
    <script>
        function redirigirRegistro() {
            // Mostrar un pop-up de alerta y redirigir a la p�gina de registro
            alert("Usuario o contrase�a incorrectos. Ser�s redirigido a la p�gina de registro.");
            window.location.href = "registroDeUsuario.html";
        }
    </script>
</head>
<body>
    <h2>Verificar Login</h2>
    <%
        // Obtener los valores de usuario y contrase�a enviados desde el formulario
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        try {
            // Cargar el controlador de la base de datos y establecer la conexi�n
            Class.forName("com.mysql.jdbc.Driver");
            Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/Semestral", "root", "");
            
            // Verificar usuario y contrase�a en la tabla de usuarios
            String consultaSql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
            PreparedStatement preparedStatement = dbconect.prepareStatement(consultaSql);
            preparedStatement.setString(1, usuario);
            preparedStatement.setString(2, contrasena);
            ResultSet resultado = preparedStatement.executeQuery();
            
            if (resultado.next()) {
                // Usuario y contrase�a v�lidos
                response.sendRedirect("home.html");
            } else {
                // Usuario o contrase�a incorrectos
                out.println("<script>redirigirRegistro();</script>");
            }
            
            // Cerrar la conexi�n y liberar recursos
            preparedStatement.close();
            dbconect.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>

