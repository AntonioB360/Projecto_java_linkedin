<%@page import="Model.Usuario"%>
<%@page import="Model.Dao.UsuarioDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("Loginadm.jsp");
        return;
    }


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
    .hidden { display: none; }
  </style>
  <script>
    function toggleField(action) {
      const field = document.getElementById(action + "Field");
      field.classList.toggle("hidden");
    }
  </script>
</head>
<body>
  <div class="container">
    <!-- Formulário de pesquisa -->
   <form action="listarUsuarios.jsp" method="get">
  <input type="text" name="search" placeholder="Pesquisar usuários" value="<%= searchQuery != null ? searchQuery : "" %>">
  <button type="submit">Pesquisar</button>
</form>
    <!-- Botão para eliminar -->
    <button type="button" onclick="toggleField('eliminar')">Eliminar</button>
    <form action="Deletar" method="post" id="eliminarField" class="hidden">
      <input type="text" name="id" placeholder="Digite o ID para eliminar">
      <button type="submit">Confirmar Eliminação</button>
    </form>

    <!-- Botão para bloquear -->
    <button type="button" onclick="toggleField('bloquear')">Bloquear</button>
    <form action="Bloquear" method="post" id="bloquearField" class="hidden">
      <input type="text" name="id" placeholder="Digite o ID para bloquear">
      <button type="submit">Confirmar Bloqueio</button>
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
        <td><%= u.getStatus()%></td>
      </tr>
      <%
        }
      %>
    </table>
  </div>
</body>
</html>