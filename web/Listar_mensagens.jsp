<%-- 
    Document   : Listar_mensagens
    Created on : 04/06/2025, 16:28:24
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
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Mensagens</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            gap: 20px;
        }
        
        /* Header */
        header {
            background: linear-gradient(to right, #0077b5, #00a0dc);
            color: white;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        a{
            text-decoration: none;
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .logo i {
            font-size: 28px;
        }
        
        .logo h1 {
            font-size: 24px;
            font-weight: 600;
        }
        
        .user-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .user-actions button {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
            font-weight: 500;
        }
        
        .user-actions button:hover {
            background: rgba(255, 255, 255, 0.3);
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(45deg, #ff6b6b, #ffa502);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: white;
        }
        
        /* Sidebar */
        .sidebar {
            width: 250px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            height: fit-content;
        }
        
        .sidebar-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            color: #0077b5;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            padding: 12px 0;
            border-bottom: 1px solid #f5f5f5;
        }
        
        .sidebar-menu li:last-child {
            border-bottom: none;
        }
        
        .sidebar-menu li a {
            text-decoration: none;
            color: #666;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: color 0.3s;
        }
        
        .sidebar-menu li a:hover {
            color: #0077b5;
        }
        
        .sidebar-menu li a.active {
            color: #0077b5;
            font-weight: 500;
        }
        
        /* Main Content */
        .main-content {
            flex: 1;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            overflow: hidden;
        }
        
        .messages-header {
            padding: 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .messages-header h2 {
            font-size: 22px;
            color: #333;
        }
        
        .search-bar {
            display: flex;
            background: #f0f2f5;
            border-radius: 20px;
            padding: 8px 15px;
            width: 300px;
        }
        
        .search-bar input {
            flex: 1;
            border: none;
            background: transparent;
            outline: none;
            padding: 0 10px;
        }
        
        .search-bar i {
            color: #666;
        }
        
        /* Messages List */
        .messages-list {
            max-height: 600px;
            overflow-y: auto;
        }
        
        .message-item {
            display: flex;
            padding: 20px;
            border-bottom: 1px solid #eee;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .message-item:hover {
            background-color: #f9fbfd;
        }
        
        .message-item.unread {
            background-color: #f0f7ff;
            border-left: 3px solid #0077b5;
        }
        
        .message-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: white;
            font-size: 24px;
            margin-right: 15px;
            flex-shrink: 0;
        }
        
        .message-content {
            flex: 1;
        }
        
        .message-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        
        .sender-name {
            font-weight: 600;
            color: #333;
        }
        
        .message-time {
            color: #666;
            font-size: 13px;
        }
        
        .message-preview {
            color: #666;
            font-size: 14px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            margin-bottom: 8px;
        }
        
        .unread-badge {
            background-color: #0077b5;
            color: white;
            font-size: 12px;
            padding: 2px 8px;
            border-radius: 10px;
            display: inline-block;
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
            }
            
            .search-bar {
                width: 200px;
            }
        }
        
        @media (max-width: 480px) {
            .messages-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .search-bar {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="header-content">
            <div class="logo">
                <i class="fab fa-linkedin"></i>
                <h1>Mensagens</h1>
            </div>
            <div class="user-actions">
                <button><i class="fas fa-cog"></i> Configurações</button>
                <div class="user-profile">
                    
                    <span><%=usuario.getNome()%></span>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Main Content -->
    <div class="container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <h2 class="sidebar-title">Menu</h2>
            <ul class="sidebar-menu">
                <li><a href="#" class="active"><i class="fas fa-inbox"></i> Caixa de Entrada <span class="unread-badge"></span></a></li>
               
                <li><a href="#"><i class="fas fa-trash"></i> Lixeira</a></li>
 
            </ul>
        </aside>
        
        <!-- Messages -->
        <main class="main-content">
            <div class="messages-header">
                <h2>Caixa de Entrada</h2>
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Pesquisar mensagens...">
                </div>
            </div>
            
            <div class="messages-list">
                <!-- Mensagem 1 -->
                  <c:forEach var="mensagem" items="${listar_mensagens}">
                    
                     <div class="message-item unread">
                    <div class="message-avatar"></div>
                    <div class="message-content">
                        <div class="message-header">
                            <a href="Processar_Mensagen?id_usuario1=<%=usuario.getId()%>&id_usuario2=${mensagem.usuario.id}"><div class="sender-name">${mensagem.usuario.nome}</div></a>    
                            <div class="message-time">${mensagem.data_envio}</div>
                        </div>
                        <div class="message-preview">${mensagem.conteudo}</div>
                      
                    </div>
                </div>
            
                </c:forEach>
               
                
             
            </div>
        </main>
    </div>


</body>
</html>