<%-- 
    Document   : Aceitar_Conexoes
    Created on : 03/06/2025, 08:07:28
    Author     : T
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Conexões</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #0a66c2;
            --secondary-color: #378fe9;
            --dark-gray: #666666;
            --light-gray: #f3f3f3;
            --white: #ffffff;
            --black: #000000;
            --border-radius: 8px;
            --box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            --success-color: #2ecc71;
            --danger-color: #e74c3c;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }
        
        .header {
            background-color: var(--white);
            box-shadow: var(--box-shadow);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 1rem;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary-color);
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .main-content {
            background-color: var(--white);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
        }
        
        .tab-container {
            display: flex;
            border-bottom: 1px solid #eee;
        }
        
        .tab {
            padding: 1rem 1.5rem;
            cursor: pointer;
            font-weight: 600;
            color: var(--dark-gray);
            border-bottom: 3px solid transparent;
            transition: all 0.3s ease;
        }
        
        .tab:hover {
            color: var(--primary-color);
            background-color: rgba(10, 102, 194, 0.05);
        }
        
        .tab.active {
            color: var(--primary-color);
            border-bottom: 3px solid var(--primary-color);
        }
        
        .tab-content {
            display: none;
            padding: 1.5rem;
        }
        
        .tab-content.active {
            display: block;
        }
        
        h2 {
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            font-size: 1.5rem;
        }
        
        .search-box {
            margin-bottom: 1.5rem;
        }
        
        .search-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
        }
        
        .connection-request, .connection {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s;
        }
        
        .connection-request:hover, .connection:hover {
            background-color: var(--light-gray);
        }
        
        .profile-pic {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1rem;
            border: 2px solid #eee;
        }
        
        .connection-info {
            flex: 1;
        }
        
        .connection-name {
            font-weight: 600;
            color: #333;
            margin-bottom: 0.25rem;
        }
        
        .connection-title {
            color: var(--dark-gray);
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }
        
        .connection-mutual {
            color: var(--dark-gray);
            font-size: 0.8rem;
        }
        
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn {
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-accept {
            background-color: var(--primary-color);
            color: var(--white);
        }
        
        .btn-accept:hover {
            background-color: var(--secondary-color);
        }
        
        .btn-reject {
            background-color: var(--light-gray);
            color: var(--dark-gray);
        }
        
        .btn-reject:hover {
            background-color: #e0e0e0;
        }
        
        .btn-message {
            background-color: transparent;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }
        
        .btn-message:hover {
            background-color: rgba(10, 102, 194, 0.1);
            border-width: 2px;
        }
        
        .empty-state {
            text-align: center;
            padding: 2rem;
            color: var(--dark-gray);
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #ddd;
        }
        
        @media (max-width: 768px) {
            .connection-request, .connection {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .action-buttons {
                width: 100%;
                margin-top: 1rem;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <div class="logo">Minha Rede</div>
            <div>Bem-vindo, <%= usuario.getNome()%></div>
        </div>
    </div>
    
    <div class="container">
        <div class="main-content">
            <div class="tab-container">
                <div class="tab active" onclick="switchTab('requests')">Solicitações</div>
                <div class="tab" onclick="switchTab('connections')">Minhas Conexões</div>
            </div>
            
            <div class="tab-content active" id="requests">
                <h2><i class="fas fa-user-plus"></i> Solicitações de Conexão</h2>
                
                <c:choose>
                    <c:when test="${empty listar}">
                        <div class="empty-state">
                            <i class="fas fa-user-friends"></i>
                            <p>Nenhuma solicitação de conexão pendente</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="conexao" items="${listar}">
                            <div class="connection-request">
                                <img src="https://randomuser.me/api/portraits/men/${conexao.usuario.id % 100}.jpg" alt="Profile" class="profile-pic">
                                <div class="connection-info">
                                    <div class="connection-name">${conexao.usuario.nome}</div>
                                    <div class="connection-title">${conexao.usuario.cargo} na ${conexao.usuario.empresa}</div>
                                    <div class="connection-mutual">12 conexões em comum</div>
                                </div>
                                <div class="action-buttons">
                                    <form method="post" action="Status_conexao">
                                     
                                        <input type="hidden" name="acao" value="aceito">
                                        <input type="hidden" name="usuario_id" value="${conexao.usuario.id}">
                                        <button class="btn btn-accept" type="submit"><i class="fas fa-check"></i> Aceitar</button>
                                    </form>
                                    <form method="post" action="Status_conexao">
                             
                                        <input type="hidden" name="acao" value="rejeitado">
                                        <input type="hidden" name="usuario_id" value="${conexao.usuario.id}">
                                        <button class="btn btn-reject" type="submit"><i class="fas fa-times"></i> Rejeitar</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="tab-content" id="connections">
                <div class="search-box">
                    <input type="text" class="search-input" placeholder="Pesquisar conexões...">
                    <i class="fas fa-search"></i>
                </div>
                
                <c:choose>
                    <c:when test="${empty listar_aceites}">
                        <div class="empty-state">
                            <i class="fas fa-user-friends"></i>
                            <p>Você ainda não tem conexões</p>
                            <p>Conecte-se com outros profissionais para expandir sua rede</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="conexao_aceite" items="${listar_aceites}">
                            <div class="connection">
                                <img src="https://randomuser.me/api/portraits/women/${conexao_aceite.usuario.id % 100}.jpg" alt="Profile" class="profile-pic">
                                <div class="connection-info">
                                    <div class="connection-name">${conexao_aceite.usuario.nome}</div>
                                    <div class="connection-title">${conexao_aceite.usuario.cargo} na(o) ${conexao_aceite.usuario.empresa}</div>
                                    <div class="connection-mutual">Conectado desde Janeiro 2023</div>
                                </div>
                                <div class="action-buttons">
                                    <a href="Processar_Mensagen?id_usuario1=<%=usuario.getId()%>&id_usuario2=${conexao_aceite.usuario.id}">
                                        <button class="btn btn-message"><i class="fas fa-envelope"></i> Mensagem</button>
                                    </a> 
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    <script>
        function switchTab(tabId) {
            // Esconde todos os conteúdos de tab
            document.querySelectorAll('.tab-content').forEach(content => {
                content.classList.remove('active');
            });
            
            // Remove a classe active de todas as tabs
            document.querySelectorAll('.tab').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Mostra o conteúdo da tab selecionada
            document.getElementById(tabId).classList.add('active');
            
            // Adiciona a classe active na tab clicada
            event.currentTarget.classList.add('active');
        }
               
        // Adiciona evento de pesquisa
        const searchInput = document.querySelector('.search-input');
        if (searchInput) {
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                const connections = document.querySelectorAll('#connections .connection');
                
                connections.forEach(connection => {
                    const name = connection.querySelector('.connection-name').textContent.toLowerCase();
                    const title = connection.querySelector('.connection-title').textContent.toLowerCase();
                    
                    if (name.includes(searchTerm) || title.includes(searchTerm)) {
                        connection.style.display = 'flex';
                    } else {
                        connection.style.display = 'none';
                    }
                });
            });
        }
    </script>
</body>
</html>