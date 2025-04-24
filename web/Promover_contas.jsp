<%-- 
    Document   : Promover_contas
    Created on : 20/04/2025, 22:13:25
    Author     : T
--%>

<%@page import="Model.Dao.UsuarioDao"%>
<%@page import="java.util.List"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("Loginadm.jsp");
        return;
    }
    
    
    
 
    
    UsuarioDao user = new UsuarioDao();
    
  List<Usuario> lista=user.Listar_user();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promover contas</title>
          <style>
        /* Estilos Gerais */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background: linear-gradient(to right, #eef2f6, #d0d8df);
            color: #333;
        }
        header {
            text-align: center;
            padding: 20px;
            background: #0073b1;
            color: white;
        }
        header h1 {
            margin: 0;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: white;
            padding: 10px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        nav a {
            text-decoration: none;
            color: #0073b1;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #005582;
        }
        section {
            padding: 20px;
        }
        .card {
            background: white;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .card h2 {
            color: #0073b1;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background: #0073b1;
            color: white;
        }
        table tr:nth-child(even) {
            background: #f9f9f9;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button.block {
            background: #dc3545;
            color: white;
        }
        button.promote {
            background: #28a745;
            color: white;
        }
        button.restrict {
            background: #ffc107;
            color: #333;
        }
        button.publish {
            background: #0073b1;
            color: white;
        }
        button:hover {
            opacity: 0.8;
        }
        .search-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }               

        button.search {
            padding: 10px 15px;
            background: #0073b1;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button.search:hover {
            background: #005580;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 75%;
            margin-right: 10px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 10px;
        }
        textarea:focus {
            outline: none;
            border-color: #0073b1;
        }
        button.publish {
            margin-top: 10px;
        }
        button.publish:hover {
            background: #005580;
        }
        .block-users-section, .promote-accounts-section, .restrict-access-section, .publish-news-section {
            margin: 20px 0;
        }
    </style>
    </head>
    <body>
         <!-- Seção Promover Contas -->
    <section id="promover" class="promote-accounts-section">
        <div class="card">
            <h2>Promover Contas</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <%for(Usuario us: lista){%>
                <tbody>
                    <tr>
                        <td> <%=us.getId()%></td>
                        <td><%=us.getNome()%></td>
                        <td><%=us.getEmail()%></td>
                        <td><button class="promote" onclick="promoverUsuario('João Silva')">Promover</button></td>
                    </tr>
                </tbody>
                 <%}%>
            </table>
        </div>
    </section>
    
          <!-- Script JavaScript -->
    <script>
        function bloquearUsuario(nome) {
            alert(`Usuário ${nome} bloqueado com sucesso!`);
        }

        function promoverUsuario(nome) {
            alert(`Usuário ${nome} promovido com sucesso!`);
        }

        function restringirAcesso(nome) {
            alert(`Acesso ao Premium foi restringido para o usuário ${nome}!`);
        }

        function publicarNoticia() {
            const content = document.getElementById('newsContent').value;
            if (content) {
                alert(`Notícia publicada com sucesso: "${content}"`);
            } else {
                alert('Por favor, digite uma notícia antes de publicar.');
            }
        }
    </script>
    </body>
</html>
