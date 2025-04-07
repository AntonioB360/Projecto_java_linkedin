<%-- 
    Document   : Home
    Created on : 07/04/2025, 00:19:00
    Author     : T
--%>

<%@page import="Model.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sessao = request.getSession(false);
    Empresa empresa = (sessao != null) ? (Empresa) sessao.getAttribute("empresal") : null;
    if (empresa == null) {
        response.sendRedirect("login.jsp");
        return;
    }
   
%>
<!DOCTYPE html>
<html lang="pt-BR" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Painel corporativo para gerenciamento de projetos e equipes">
    <title><%=empresa.getNome()%> | Painel Corporativo</title>
    
    <link rel="stylesheet" href="css/Emp.css"/>
</head>
<body>
    <div class="app-container">
        <header class="navbar" role="banner">
            <div class="navbar__content">
                <a href="/" class="navbar__brand">Empresa Connect</a>
                <nav class="navbar__nav" role="navigation" aria-label="Navegação principal">
                    <a href="/perfil" class="nav-link">Perfil</a>
                    <a href="/projetos" class="nav-link">Projetos</a>
                    <a href="Vagas.jsp" class="nav-link">Publicar Vagas</a>
                    <a href="/usuarios" class="nav-link">Usuários</a>
                    <a href="Logout" class="nav-link">Sair</a>
                </nav>
            </div>
        </header>

        <div class="main-container">
            <aside class="sidebar" role="complementary" aria-label="Menu lateral">
                <nav aria-label="Navegação rápida">
                    <h2 class="visually-hidden">Atalhos</h2>
                    <ul class="sidebar__list">
                        <li><a href="/dashboard" class="sidebar__link">Dashboard</a></li>
                        <li><a href="/relatorios" class="sidebar__link">Relatórios</a></li>
                        <li><a href="/configuracoes" class="sidebar__link">Configurações</a></li>
                    </ul>
                </nav>
            </aside>

            <main class="main-content" role="main">
                <section class="card" aria-labelledby="welcome-heading">
                    <h2 id="welcome-heading">Bem-vindo, <%=empresa.getNome()%> </h2>
                    <p>Gerencie suas atividades, projetos e equipes de forma eficiente.</p>
                </section>

                <section class="card" aria-labelledby="projects-heading">
                    <h2 id="projects-heading">Projetos Recentes</h2>
                    <ul class="card__list">
                        <li class="card__list-item">Projeto Alpha - Desenvolvimento de Nova Plataforma</li>
                        <li class="card__list-item">Projeto Beta - Sistema de Gestão Interna</li>
                        <li class="card__list-item">Projeto Gamma - Campanha de Marketing Digital</li>
                    </ul>
                </section>

                <section class="card" aria-labelledby="activity-heading">
                    <h2 id="activity-heading">Atividades Recentes</h2>
                    <div class="card__list">
                        <p class="card__list-item">Nenhuma atividade recente</p>
                    </div>
                </section>
            </main>
        </div>
    </div>
</body>
</html>