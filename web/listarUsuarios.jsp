<!-- filepath: c:\xampp\htdocs\Loja de Materias\listarUsuarios.jsp -->
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
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                margin: 0;
                background: linear-gradient(to right, #eef2f6, #d0d8df);
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
            }
            th, td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }
            th {
                background: #0073b1;
                color: white;
            }
            .container {
                background: white;
                border-radius: 10px;
                margin: 20px 0;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            input, button {
                padding: 10px;
                margin: 10px 0;
            }
            tr button {
                background: #28a745;
                color: white;
                border: none;
                cursor: pointer;
            }
            tr button:hover {
                background: #218838;
            }
            .search-container {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }
            /* Estilo para ocultar o formulário inicialmente */
            .hidden-form {
                display: none;
            }
            /* Exibir o formulário quando o checkbox estiver marcado */
            input[type="checkbox"]:checked + .hidden-form {
                display: block;
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

            .hi {
                display: none;
            }

           

            nav a:hover {
                color: #005582;
            }
            section {
                padding: 20px;
            }
            .card{
                background: white;
                border-radius: 10px;
                margin: 20px 0;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            
                <nav>
                    <a href="DashbordAdm.jsp">Home</a>
            <a href="Promover_contas.jsp">Promover Contas</a>
            <a href="Restringir_premiun.jsp">Restringir ao Premium</a>
            <a href="Publicar_feed.jsp">Publicar no Feed</a>
        </nav>
            <!-- Formulário de pesquisa -->
            <form action="listarUsuarios.jsp" method="get">
                <div class="search-container">
                    <input type="text" name="search" placeholder="Pesquisar usuários" value="<%= searchQuery != null ? searchQuery : ""%>">
                    <button class="search" type="submit">Pesquisar</button>
                </div>
            </form>

            <!-- Tabela de usuários -->
            <table>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Cargo</th>
                    <th>Status</th>
                    <th>Ação</th>
                    <th>Ação</th>
                </tr>
                <%
                    for (Usuario u : lista) {
                %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getNome() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getCargo() %></td>
                    <td><%= u.getStatus() %></td>
                    <td>
                        <!-- Checkbox para controlar a visibilidade -->
                        <input type="checkbox" id="toggleForm<%= u.getId() %>">
                        Satatus
                        <!-- Formulário oculto inicialmente -->
                        <form action="Deletar" method="post" class="hidden-form">
                            <select name="novoStatus">
                                <option value="bloqueado">Bloquear</option>
                                <option value="activo">Desbloquear</option>
                                <option value="nao verificado">Não verificado</option>
                            </select>
                            <button type="submit" class="block">Mudar Status</button>
                            <input type="hidden" name="id" value="<%= u.getId() %>">
                            <input type="hidden" name="acao" value="bloquear">
                        </form>
                            
                          <form action="Deletar" method="post" id="eliminarField" class="hidden">
                        <td><button type="submit" class="block">Eliminar conta</button></td>
                        <input type="hidden" id="id" name="id" value="<%= u.getId()%>">
                        <input type="hidden" id="id" name="acao" value="eliminar">
                    </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>