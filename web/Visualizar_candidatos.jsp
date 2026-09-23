<%-- 
    Document   : Visualizar_candidatos
    Created on : 09/06/2025, 21:45:54
    Author     : T
--%>
<%@page import="Model.Empresa"%>
<%
    HttpSession sessao = request.getSession(false);
    Empresa empresa = (sessao != null) ? (Empresa) sessao.getAttribute("empresal") : null;
    if (empresa == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int id_vaga = Integer.parseInt(request.getParameter("id_vaga"));
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <title>Gerenciar Candidatos | GLAMVC Empresas</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Helvetica, Arial, sans-serif;
            }

            body {
                margin: 0;
                padding: 0;
                background-color: #f3f6f8;
                color: #333;
            }

            .navbar {
                background-color: white;
                height: 60px;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
                display: flex;
                align-items: center;
                padding: 0 24px;
            }

            .logo {
                color: #0a66c2;
                font-size: 24px;
                font-weight: bold;
            }

            .container {
                max-width: 1200px;
                margin: 24px auto;
                padding: 0 20px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .job-title {
                font-size: 22px;
                font-weight: 600;
                color: #0a66c2;
            }

            .applicants-count {
                color: #666;
                font-size: 16px;
            }

            .candidates-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
                padding: 20px;
            }

            .candidate-card {
                display: flex;
                padding: 20px 0;
                border-bottom: 1px solid #e0e0e0;
            }

            .candidate-card:last-child {
                border-bottom: none;
            }

            .candidate-avatar {
                width: 72px;
                height: 72px;
                border-radius: 50%;
                background-color: #e0e0e0;
                margin-right: 20px;
                overflow: hidden;
            }

            .candidate-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .candidate-info {
                flex: 1;
            }

            .candidate-name {
                font-size: 18px;
                font-weight: 600;
                margin-bottom: 4px;
            }

            .candidate-title {
                color: #666;
                font-size: 16px;
                margin-bottom: 8px;
            }

            .candidate-skills {
                display: flex;
                flex-wrap: wrap;
                gap: 8px;
                margin-bottom: 12px;
            }

            .skill-tag {
                background-color: #e0e0e0;
                padding: 4px 10px;
                border-radius: 16px;
                font-size: 14px;
            }

            .candidate-actions {
                display: flex;
                gap: 12px;
            }

            .btn {
                padding: 8px 16px;
                border-radius: 4px;
                font-weight: 600;
                cursor: pointer;
                border: none;
                font-size: 14px;
            }

            .btn-accept {
                background-color: #0a66c2;
                color: white;
            }

            .btn-reject {
                background-color: white;
                color: #666;
                border: 1px solid #666;
            }

            .btn-view-profile {
                background-color: white;
                color: #0a66c2;
                border: 1px solid #0a66c2;
            }

            .status-badge {
                padding: 4px 10px;
                border-radius: 16px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 12px;
            }

            .status-pending {
                background-color: #fff3cd;
                color: #856404;
            }

            .status-accepted {
                background-color: #d4edda;
                color: #155724;
            }

            .status-rejected {
                background-color: #f8d7da;
                color: #721c24;
            }

            .search-filter {
                display: flex;
                margin-bottom: 20px;
                gap: 12px;
            }

            .search-input {
                flex: 1;
                padding: 10px 16px;
                border-radius: 4px;
                border: 1px solid #ccc;
                font-size: 16px;
            }

            .filter-select {
                padding: 10px 16px;
                border-radius: 4px;
                border: 1px solid #ccc;
                background-color: white;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar">
            <div class="logo">GLAMVC</div>
        </nav>

        <div class="container">
            <div class="header">
                <div>
                    <h1 class="job-title">Desenvolvedor Front-end Sênior</h1>
                    <p class="applicants-count"></p>
                </div>
            </div>

            <div class="search-filter">
                <input type="text" class="search-input" placeholder="Pesquisar candidatos...">
                <select class="filter-select">
                    <option value="all">Todos os candidatos</option>
                    <option value="pending">Pendentes</option>
                    <option value="accepted">Aceitos</option>
                    <option value="rejected">Rejeitados</option>
                </select>
            </div>

            <div class="candidates-container">
                <!-- Candidato 1 -->
                <c:if test="${not empty lista}">
                    <c:forEach var="vaga" items="${lista}">
                        <div class="candidate-card">
                            <div class="candidate-avatar">
                                <img src="https://randomuser.me/api/portraits/women/43.jpg" alt="Foto do candidato">
                            </div>
                            <div class="candidate-info">
                                <div class="candidate-name">
                                    ${vaga.usuario.nome}
                                    <span class="status-badge status-pending">${vaga.status}</span>
                                </div>
                                <div class="candidate-title">${vaga.usuario.cargo}</div>

                                <div class="candidate-actions">
                                    <form action="Candidatura_Status" method="post">
                                        <input type="hidden" name="acao" value="finalizar">
                                        <input type="hidden" name="id_usuario" value="${vaga.usuario.id}">
                                        <input type="hidden" name="id_vaga" value="<%= id_vaga%>">
                                        <button class="btn btn-accept">Aceitar</button>
                                    </form>

                                    <form action="Candidatura_Status" method="post">
                                        <input type="hidden" name="acao" value="eliminar">
                                        <input type="hidden" name="id_usuario" value="${vaga.usuario.id}">
                                        <input type="hidden" name="id_vaga" value="<%= id_vaga%>">
                                        <button class="btn btn-reject">Rejeitar</button>
                                    </form>

          <a href="UsuarioPerfil?id_usuario=${vaga.usuario.id}"><button class="btn btn-view-profile">Ver perfil completo</button></a>
                                    
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty lista}">
                    <p style="color: #888; padding: 20px;">Nenhum candidato encontrado para esta vaga.</p>
                </c:if>

            </div>
        </div>


    </body>
</html>