<%-- 
    Document   : Notificacoes
    Created on : 01/04/2025
    Author     : us
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
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
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <title>Notificações </title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f3f2ef;
                color: #333;
            }

            .container {
                display: flex;
                max-width: 1200px;
                margin: 20px auto;
                gap: 20px;
            }

            .sidebar {
                width: 25%;
                background-color: white;
                border-radius: 10px;
                padding: 15px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                height: fit-content;
            }

            .main-content {
                width: 75%;
            }

            .notification-header {
                background-color: white;
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 15px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .notification-header h1 {
                font-size: 24px;
                color: #333;
            }

            .notification-actions {
                display: flex;
                gap: 15px;
            }

            .notification-actions button {
                background: none;
                border: none;
                color: #666;
                cursor: pointer;
                font-size: 14px;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .notification-actions button:hover {
                background-color: #f3f2ef;
            }

            .notification-actions button.active {
                color: #0a66c2;
                font-weight: bold;
            }

            .notification-card {
                background-color: white;
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 10px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                display: flex;
                gap: 15px;
            }

            .notification-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: #e6e6e6;
                overflow: hidden;
            }

            .notification-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .notification-content {
                flex: 1;
            }

            .notification-user {
                font-weight: bold;
                color: #333;
                text-decoration: none;
            }

            .notification-user:hover {
                text-decoration: underline;
                color: #0a66c2;
            }

            .notification-text {
                margin: 5px 0;
                line-height: 1.4;
            }

            .notification-time {
                color: #666;
                font-size: 12px;
                margin-top: 5px;
            }

            .notification-actions {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .notification-action {
                background: none;
                border: none;
                color: #666;
                cursor: pointer;
                font-size: 14px;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .notification-action:hover {
                background-color: #f3f2ef;
            }

            .notification-unread {
                background-color: #e8f0fe;
                border-left: 3px solid #0a66c2;
            }

            .sidebar-item {
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                margin-bottom: 5px;
            }

            .sidebar-item:hover {
                background-color: #f3f2ef;
            }

            .sidebar-item.active {
                background-color: #e8f0fe;
                color: #0a66c2;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="sidebar">
                <div class="sidebar-item active">Todas</div>
                <div class="sidebar-item">Minhas</div>
                <div class="sidebar-item">Mensagens</div>
                <div class="sidebar-item">Convites</div>
                <div class="sidebar-item">Menções</div>
                <div class="sidebar-item">Postagens</div>
                <div class="sidebar-item">Grupos</div>
                <div class="sidebar-item">Eventos</div>
            </div>

            <div class="main-content">
                <div class="notification-header">
                    <h1>Notificações</h1>
                    <div class="notification-actions">
                        <button class="active">Todas</button>
                        <button>Não lidas</button>
                        <button>Arquivadas</button>
                    </div>
                </div>
                <c:forEach var="notificacao" items="${nt}">
                    <div class="notification-card notification-unread">
                        <div class="notification-avatar">
                            <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="">
                        </div>
                        <div class="notification-content">
                            <a href="#" class="notification-user">${notificacao.mensagem}</a>
                            <p class="notification-text"></p>
                            <div class="notification-actions">
                                <button class="notification-action">Responder</button>
                                <button class="notification-action">Arquivar</button>
                            </div>
                            <div class="notification-time">${notificacao.data_notificacao}</div>
                        </div>
                    </div>
                </c:forEach>



            </div>
        </div>
    </body>
</html>