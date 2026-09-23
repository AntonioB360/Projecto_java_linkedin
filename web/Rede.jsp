<%@page import="Model.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <title>Minhas conexoes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/Rede.css"/>
</head>
<body>
    <div class="container">
        <header>
            <div class="profile">
                <img src="<%= usuario.getFoto_perfil()%>" alt="Seu perfil" class="profile-img">
                <div class="profile-info">
                    <h1><%= usuario.getNome()%></h1>
                    <p class="connections">
                        <i class="fas fa-users"></i> 6 conexões
                    </p>
                </div>
            </div>
            <input type="text" class="search-input" placeholder="Pesquisar na rede...">
        </header>

        <main>
            <aside class="sidebar">
                <a href="Status_conexao?id_usuario=<%= usuario.getId()%>" class="btn btn-connect">
                    <i class="fas fa-users"></i> Gerenciar minha rede
                </a>
                
                <input type="hidden" id="id" name="id_usuario" value="<%=usuario.getId()%>">
                
                <div class="connections-list">
                    <h3>Conexões</h3>
                    
                    <c:choose>
                        <c:when test="${empty listar_aceites}">
                            <div class="empty-state">
                                <i class="far fa-user-friends"></i>
                                <p>Você ainda não tem conexões</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="conexao_aceite" items="${listar_aceites}">
                                <div class="connection">
                                    <img src="https://via.placeholder.com/50" alt="${conexao_aceite.usuario.nome}" class="connection-img">
                                    <div class="connection-info">
                                        <strong>${conexao_aceite.usuario.nome}</strong>
                                        <p>${conexao_aceite.usuario.cargo} na(o) ${conexao_aceite.usuario.empresa}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </aside>

            <section class="feed">
                <div class="post">
                    <div class="post-header">
                        <h3>Pessoas que você pode conhecer</h3>
                        <a href="#" class="see-all">Ver todas</a>
                    </div>
                    <p>Expandir sua rede ajuda você a encontrar novas oportunidades</p>

                    <div class="new-connections-grid">
                        <c:choose>
                            <c:when test="${empty listar}">
                                <div class="empty-state">
                                    <i class="far fa-user-plus"></i>
                                    <p>Não há sugestões de conexões no momento</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="pessoa" items="${listar}">
                                    <div class="new-person-card" id="person-${pessoa.id}">
                                        <img src="https://via.placeholder.com/80" alt="${pessoa.nome}" class="new-person-img">
                                        <div class="person-info">
                                            <div class="person-name"><a href="UsuarioPerfil?id_usuario=${pessoa.id}">${pessoa.nome}</a></div>
                                            <div class="person-title">${pessoa.cargo} na ${pessoa.empresa}</div>
                                            <div class="person-mutual">8 conexões em comum</div>
                                        </div>
                                        <button type="button" class="btn btn-connect connect-btn" 
                                            data-user-id="<%=usuario.getId()%>" 
                                            data-other-user-id="${pessoa.id}">
                                            Conectar
                                            <span class="spinner"></span>
                                        </button>
                                        <div class="success-message">Pedido enviado!</div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="post">
                    <h3>Atualizações da sua rede</h3>
                    <p>Veja o que suas conexões estão compartilhando e comentando.</p>
                    <div class="empty-state">
                        <i class="far fa-newspaper"></i>
                        <p>Nenhuma atualização recente</p>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="javascript/Rede.js">
       
    </script>
</body>
</html>