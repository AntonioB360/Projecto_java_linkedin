<%-- 
    Document   : mensagem
    Created on : 31/03/2025, 19:09:25
    Author     : us
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
    
  String idDestinatario = request.getParameter("id_usuario2");
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mensagens</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #0a66c2; /* Azul do LinkedIn */
            --secondary-color: #f3f6f8;
            --text-color: #000000e6;
            --light-text: #666666;
            --border-color: #e0e0e0;
            --white: #ffffff;
            --message-received-bg: #f0f2f5;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, system-ui, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
        }
        
        body {
            background-color: var(--secondary-color);
            color: var(--text-color);
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* Layout principal */
        .messaging-container {
            display: flex;
            flex: 1;
            max-width: 1128px;
            margin: 0 auto;
            width: 100%;
            height: calc(100vh - 60px);
            background-color: var(--white);
            box-shadow: 0 0 0 1px rgba(0,0,0,0.08);
        }
        
        /* Barra lateral de conversas */
        .conversations-sidebar {
            width: 360px;
            border-right: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        
        .sidebar-header {
            padding: 16px 24px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .sidebar-header h2 {
            font-size: 20px;
            font-weight: 600;
        }
        
        .new-message-btn {
            background-color: transparent;
            border: none;
            color: var(--primary-color);
            font-size: 24px;
            cursor: pointer;
        }
        
        .search-bar {
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-color);
        }
        
        .search-bar input {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            font-size: 14px;
        }
        
        .conversation-list {
            flex: 1;
            overflow-y: auto;
        }
        
        .conversation-item {
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-color);
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .conversation-item:hover {
            background-color: var(--secondary-color);
        }
        
        .conversation-item.active {
            background-color: #e6f0f8;
        }
        
        /* Área de mensagens */
        .messages-area-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        
        .messages-header {
            padding: 16px 24px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
        }
        
        .recipient-info {
            display: flex;
            align-items: center;
        }
        
        .recipient-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            font-weight: bold;
        }
        
        .recipient-name {
            font-weight: 600;
        }
        
        /* Container das mensagens */
        .messages-area {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            background-color: var(--white);
        }
        
        .message-day-divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
            color: var(--light-text);
            font-size: 12px;
        }
        
        .message-day-divider::before,
        .message-day-divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid var(--border-color);
        }
        
        .message-day-divider::before {
            margin-right: 16px;
        }
        
        .message-day-divider::after {
            margin-left: 16px;
        }
        
        /* Estilo das mensagens */
        .message-wrapper {
            display: flex;
            flex-direction: column;
            max-width: 65%;
            margin-bottom: 8px;
        }
        
        .message-wrapper.sent {
            align-self: flex-end;
            align-items: flex-end;
        }
        
        .message-wrapper.received {
            align-self: flex-start;
            align-items: flex-start;
        }
        
        .message-bubble {
            padding: 12px 16px;
            border-radius: 16px;
            line-height: 1.4;
            position: relative;
            word-break: break-word;
        }
        
        .message-wrapper.sent .message-bubble {
            background-color: var(--primary-color);
            color: var(--white);
            border-bottom-right-radius: 4px;
        }
        
        .message-wrapper.received .message-bubble {
            background-color: var(--message-received-bg);
            color: var(--text-color);
            border-bottom-left-radius: 4px;
        }
        
        .message-time {
            font-size: 12px;
            color: var(--light-text);
            margin-top: 4px;
        }
        
        .message-wrapper.sent .message-time {
            text-align: right;
            color: rgba(255,255,255,0.8);
        }
        
        .message-wrapper.received .message-time {
            text-align: left;
        }
        
        /* Área de envio de mensagens */
        .message-composer {
            padding: 16px;
            border-top: 1px solid var(--border-color);
            background-color: var(--white);
        }
        
        .message-input-container {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .message-input {
            flex: 1;
            border: 1px solid var(--border-color);
            border-radius: 24px;
            padding: 12px 16px;
            resize: none;
            font-size: 14px;
            min-height: 48px;
            outline: none;
        }
        
        .message-input:focus {
            border-color: var(--primary-color);
        }
        
        .send-button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            width: 48px;
            height: 48px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .send-button:hover {
            background-color: #004182;
        }
        
        /* Estado vazio */
        .empty-conversation {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            color: var(--light-text);
            text-align: center;
            padding: 40px;
        }
        
        .empty-conversation i {
            font-size: 48px;
            margin-bottom: 16px;
            color: var(--border-color);
        }
    </style>
</head>
<body>
    <div class="messaging-container">
        <!-- Barra lateral de conversas -->
        <div class="conversations-sidebar">
            <div class="sidebar-header">
                <h2>Mensagens</h2>
                <button class="new-message-btn" title="Nova mensagem">+</button>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Pesquisar mensagens">
            </div>
            <div class="conversation-list" id="conversationList">
                <!-- Lista de conversas será preenchida aqui -->
            </div>
        </div>
        
        <!-- Área principal de mensagens -->
        <div class="messages-area-container">
            <div class="messages-header">
                <div class="recipient-info">
                    <div class="recipient-avatar">${destinatario.nome.charAt(0)}</div>
                    <div class="recipient-name">${destinatario.nome}</div>
                </div>
            </div>
            
            <div class="messages-area" id="messagesArea">
                <c:choose>
                    <c:when test="${empty mensagens_conversa}">
                        <div class="empty-conversation">
                            <i class="far fa-comment-dots"></i>
                            <h3>Nenhuma mensagem nesta conversa</h3>
                            <p>Envie sua primeira mensagem para iniciar a conversa</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="message-day-divider">Hoje</div>
                        
                        <c:forEach var="mensagem" items="${mensagens_conversa}">
                            <div class="message-wrapper ${mensagem.remetente.id == usuario.id ? 'sent' : 'received'}">
                                <div class="message-bubble">
                                    ${mensagem.conteudo}
                                </div>
                                <div class="message-time">
                                    ${mensagem.remetente.id == usuario.id ? 'Você' : mensagem.remetente.nome} • 
                                    ${mensagem.data_envio}
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- Área de composição de mensagem -->
            <div class="message-composer">
                <form action="Processar_Mensagen" method="post">
                    <div class="message-input-container">
                        <textarea class="message-input" name="conteudo" placeholder="Escreva uma mensagem..." required></textarea>
                        <button type="submit" class="send-button">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                    <input type="hidden" name="remetente" value="<%=usuario.getId()%>">
                    <input type="hidden" name="destinatario" value="<%=idDestinatario%>">
                </form>
            </div>
        </div>
    </div>
    
    <script>
        // Rolagem automática para a última mensagem
        window.onload = function() {
            const messagesArea = document.getElementById('messagesArea');
            if (messagesArea) {
                messagesArea.scrollTop = messagesArea.scrollHeight;
            }
        };
    </script>
</body>
</html>