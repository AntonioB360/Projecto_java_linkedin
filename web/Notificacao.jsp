<%-- 
    Document   : Notificacoes
    Created on : 01/04/2025
    Author     : us
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Dao.Usuario"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Notificacoes.css">
    <title>Notificações</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .notification {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        .notification:last-child {
            border-bottom: none;
        }

        .notification img {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-right: 15px;
        }

        .notification-content {
            flex: 1;
        }

        .notification-content p {
            margin: 0;
            color: #555;
        }

        .notification-content span {
            font-size: 12px;
            color: #888;
        }

        .notification-actions button {
            background-color: #0073b1;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .notification-actions button:hover {
            background-color: #005f8d;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Notificações</h1>

        <div class="notification">
            <img src="img/user1.jpg" alt="User">
            <div class="notification-content">
                <p><strong>João Silva</strong> curtiu sua postagem.</p>
                <span>2 horas atrás</span>
            </div>
            <div class="notification-actions">
                <button>Ver</button>
            </div>
        </div>

        <div class="notification">
            <img src="img/user2.jpg" alt="User">
            <div class="notification-content">
                <p><strong>Maria Oliveira</strong> comentou na sua postagem.</p>
                <span>5 horas atrás</span>
            </div>
            <div class="notification-actions">
                <button>Ver</button>
            </div>
        </div>

        <div class="notification">
            <img src="img/user3.jpg" alt="User">
            <div class="notification-content">
                <p><strong>Pedro Santos</strong> começou a seguir você.</p>
                <span>1 dia atrás</span>
            </div>
            <div class="notification-actions">
                <button>Ver</button>
            </div>
        </div>

        <div class="notification">
            <img src="img/user4.jpg" alt="User">
            <div class="notification-content">
                <p><strong>Ana Costa</strong> compartilhou sua postagem.</p>
                <span>2 dias atrás</span>
            </div>
            <div class="notification-actions">
                <button>Ver</button>
            </div>
        </div>
    </div>
</body>

</html>