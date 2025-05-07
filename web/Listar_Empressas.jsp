<%-- 
    Document   : Listar_Empressas
    Created on : 30/04/2025, 01:36:28
    Author     : T
--%>

<%@page import="Model.Empresa"%>
<%@page import="Model.Dao.EmpressaDao"%>
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

        EmpressaDao emp=new EmpressaDao();
        List<Empresa> list=emp.listar_empresa();
    
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

            tr button{
                background: #28a745;
                color: white;
            }
            .hidden {
                display: none;
            }
            .search-container {
                display: flex;
                justify-content: center;
                margin: 20px 0;
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
            
             /* Estilo para ocultar o formulário inicialmente */
            .hidden-form {
                display: none;
            }
            /* Exibir o formulário quando o checkbox estiver marcado */
            input[type="checkbox"]:checked + .hidden-form {
                display: block;
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
                    <input type="text" name="search" placeholder="Pesquisar usuários" value="<%= searchQuery != null ? searchQuery : ""%>"><!-- comment -->        
                    <button class="search" type="submit">Pesquisar</button>
                </div>



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
                        <th>Nome da empresa</th>
                        <th>Email</th>
                        <th>setor</th>
                        <th>localizacao</th>
                          <th>Status</th>
                        <th>Acao</th>
                        <th>Acao</th>
                    </tr>
                    <%
                        for (Empresa ep : list) {
                    %>
                    <tr>
                        <td><%= ep.getId()%></td>
                        <td><%= ep.getNome()%></td>
                        <td><%= ep.getEmail()%></td>
                        <td><%= ep.getSetor()%></td>
                        <td><%= ep.getLocalizacao()%></td> 
                        <td><%= ep.getStatus()%></td> 
                        



                     <!-- Checkbox para controlar a visibilidade -->
                        <input type="checkbox" id="toggleForm<%= ep.getId() %>">
                        Satatus
                        <!-- Formulário oculto inicialmente -->
                        <form action="EmpresaStatus" method="post" class="hidden-form">
                            <select name="novoStatus">
                                <option value="bloqueado">Bloquear</option>
                                <option value="activo">Desbloquear</option>
                                <option value="nao verificado">Não verificado</option>
                            </select>
                            <button type="submit" class="block">Mudar Status</button>
                            <input type="hidden" name="id" value="<%= ep.getId() %>">
                            <input type="hidden" name="acao" value="bloquear">
                        </form>

                    <form action="EmpresaStatus" method="post" id="eliminarField" class="hidden">
                        <td><button type="submit" class="block">Eliminar conta</button></td>
                        <input type="hidden" id="id" name="id" value="<%=ep.getId()%>">
                        <input type="hidden" id="id" name="acao" value="eliminar">
                    </form>

                    </tr>
                    <%
                        }
                    %>
                </table>
        </div>
    </body>
</html>