<%-- 
    Document   : listarUsuarios
    Created on : 08/04/2025, 23:45:04
    Author     : T
--%>

<%@page import="Model.Usuario"%>
<%@page import="Model.Dao.UsuarioDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioDao user=new UsuarioDao();
    List<Usuario> lista=user.Listar_user();
     request.getAttribute("usuarios");

%>
<html>
<head>
  <title>Usuários</title>
  <style>
    body { font-family: Arial; background: #f5f5f5; padding: 20px; }
    table { width: 100%; border-collapse: collapse; background: white; }
    th, td { padding: 12px; border-bottom: 1px solid #ddd; }
    th { background: #eee; }
    .container { max-width: 800px; margin: auto; background: white; padding: 20px; border-radius: 10px; }
    input, button { padding: 10px; margin: 10px 0; }
  </style>
</head>
<body>
  <div class="container">
    <form action="Deletar" method="post">
      <input type="text" name="id" placeholder="eliminar com id">
      <button type="submit">Eliminar</button>
      
   
    </form>

   
      <table>
          
        <tr>
          <th>Id</th>
          <th>Nome</th>
          <th>Email</th>
          <th>Cargo</th>
          <th>Status</th>
        </tr>
        <%
          for (Usuario u : lista) {
        %>
        <tr>
            
          <td><%= u.getId() %></td>
          <td><%= u.getNome() %></td>
          <td><%= u.getEmail() %></td>
          <td><%= u.getCargo() %></td>
          <td>activo</td>
         
        </tr>
        <%
          }
        %>
      </table>
    
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  </div>
</body>
</html>
