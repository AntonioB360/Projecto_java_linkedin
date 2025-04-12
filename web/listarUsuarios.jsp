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
    UsuarioDao user = new UsuarioDao();
    String searchQuery = request.getParameter("search"); // Obtém o termo de pesquisa
    List<Usuario> lista;

    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        lista = user.buscarUsuarios(searchQuery); // Método para buscar usuários com base no termo
    } else {
        lista = user.Listar_user(); // Lista todos os usuários se não houver pesquisa
    }
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
    <!-- Formulário de pesquisa -->
    <form action="listarUsuarios" method="get">
      <input type="text" name="search" placeholder="Pesquisar usuários" value="<%= searchQuery != null ? searchQuery : "" %>">
      <button type="submit">Pesquisar</button>
    </form>

    <!-- Formulário para deletar -->
    <form action="Deletar" method="post">
      <input type="text" name="id" placeholder="eliminar com id">
      <button type="submit">Eliminar</button>
    </form>

    <!-- Tabela de usuários -->
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