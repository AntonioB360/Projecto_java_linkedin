<%-- 
    Document   : Perfil
    Created on : 10/06/2025, 20:38:42
    Author     : T
--%>

<%@page import="Model.Empresa"%>
<%@page import="Model.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = null;
    Empresa empresa = null;

    if (sessao != null) {
        usuario = (Usuario) sessao.getAttribute("usuario");
        empresa = (Empresa) sessao.getAttribute("empresal");
    }

    if (usuario == null && empresa == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
    boolean ehDonoPerfil = (usuario != null && usuario.getId() == id_usuario);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Profissional</title>
    
     <style>
            /* Tailwind-inspired CSS without CDN */
            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                background-color: #f3f4f6;
                margin: 0;
                line-height: 1.5;
            }
            .container {
                max-width: 1280px;
                margin: 0 auto;
                padding: 0 1rem;
            }
            .bg-white {
                background-color: #ffffff;
            }
            .shadow-md {
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }
            .rounded-lg {
                border-radius: 0.5rem;
            }
            .p-6 {
                padding: 1.5rem;
            }
            .mt-6 {
                margin-top: 1.5rem;
            }
            .text-xl {
                font-size: 1.25rem;
            }
            .font-semibold {
                font-weight: 600;
            }
            .text-gray-800 {
                color: #1f2937;
            }
            .text-gray-600 {
                color: #4b5563;
            }
            .text-gray-500 {
                color: #6b7280;
            }
            .text-blue-600 {
                color: #2563eb;
            }
            .text-blue-800 {
                color: #1d4ed8;
            }
            .bg-blue-600 {
                background-color: #2563eb;
            }
            .bg-blue-100 {
                background-color: #dbeafe;
            }
            .bg-gray-50 {
                background-color: #f9fafb;
            }
            .bg-gray-300 {
                background-color: #d1d5db;
            }
            .bg-green-600 {
                background-color: #059669;
            }
            .text-white {
                color: #ffffff;
            }
            .px-4 {
                padding-left: 1rem;
                padding-right: 1rem;
            }
            .py-2 {
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
            }
            .rounded-full {
                border-radius: 9999px;
            }
            .border {
                border-width: 1px;
            }
            .border-gray-300 {
                border-color: #d1d5db;
            }
            .border-blue-600 {
                border-color: #2563eb;
            }
            .hover\:bg-blue-700:hover {
                background-color: #1d4ed8;
            }
            .hover\:bg-gray-400:hover {
                background-color: #9ca3af;
            }
            .hover\:bg-green-700:hover {
                background-color: #047857;
            }
            .hover\:bg-blue-50:hover {
                background-color: #eff6ff;
            }
            .hover\:underline:hover {
                text-decoration: underline;
            }
            .flex {
                display: flex;
            }
            .space-x-4 > * + * {
                margin-left: 1rem;
            }
            .space-y-4 > * + * {
                margin-top: 1rem;
            }
            .justify-between {
                justify-content: space-between;
            }
            .items-center {
                align-items: center;
            }
            .flex-wrap {
                flex-wrap: wrap;
            }
            .gap-2 {
                gap: 0.5rem;
            }
            .text-sm {
                font-size: 0.875rem;
            }
            .text-lg {
                font-size: 1.125rem;
            }
            .font-bold {
                font-weight: 700;
            }
            .font-medium {
                font-weight: 500;
            }
            .w-full {
                width: 100%;
            }
            .border-l-4 {
                border-left-width: 4px;
            }
            .pl-4 {
                padding-left: 1rem;
            }
            .cover-image {
                background-image: url('https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&w=1600&h=400');
                background-size: cover;
                background-position: center;
                height: 13rem;
            }
            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6);
                align-items: center;
                justify-content: center;
                z-index: 1000;
                transition: opacity 0.3s ease;
            }
            .modal-content {
                background-color: #ffffff;
                padding: 2rem;
                border-radius: 0.75rem;
                width: 90%;
                max-width: 600px;
                max-height: 80vh;
                overflow-y: auto;
                transform: scale(0.7);
                transition: transform 0.3s ease;
            }
            .modal-open {
                display: flex;
                opacity: 1;
            }
            .modal-open .modal-content {
                transform: scale(1);
            }
            .skill:hover .remove-skill {
                display: inline;
            }
            .remove-skill {
                display: none;
                cursor: pointer;
                margin-left: 0.5rem;
                color: #ef4444;
            }
            .fade-in {
                animation: fadeIn 0.5s ease-in;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            @media (max-width: 640px) {
                .container {
                    padding: 0 0.5rem;
                }
                .text-xl {
                    font-size: 1.125rem;
                }
                .text-lg {
                    font-size: 1rem;
                }
            }
        </style>
</head>
<body>

<!-- Header -->
<header class="bg-white shadow-md">
    <div class="container py-4 flex justify-between items-center">
        <h1 class="text-xl font-bold text-gray-800">Minha Rede Profissional</h1>
    </div>
</header>

<!-- Main Content -->
<main class="container mt-6">
    <c:forEach var="perfil" items="${listar}">
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <div class="cover-image"></div>
            <div class="relative p-6">
                <img id="profileImage" src="https://via.placeholder.com/128" alt="Foto do perfil" class="w-32 h-32 rounded-full border-4 border-white -mt-16 object-cover">
                <div class="mt-4">
                    <h2 class="text-xl font-bold text-gray-800">${perfil.nome}</h2>
                    <p class="text-lg text-gray-600">${perfil.cargo}</p>
                    <p class="text-sm text-gray-500">${perfil.email} | ${perfil.localizacao}</p>

                    <% if (ehDonoPerfil) { %>
                        <div class="mt-4 flex space-x-4">
                            <button onclick="openEditProfileModal()" class="border border-gray-600 text-gray-600 px-4 py-2 rounded-full hover:bg-gray-50 transition">Editar Perfil</button>
                            <a href="Publicacao.jsp">
                                <button onclick="openAddPostModal()" class="border border-gray-600 text-gray-600 px-4 py-2 rounded-full hover:bg-gray-50 transition">Adicionar Post</button>
                            </a>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Sobre -->
        <div class="bg-white rounded-lg shadow-md mt-6 p-6">
            <h3 class="text-xl font-semibold text-gray-800">Sobre</h3>
            <p class="mt-2 text-gray-600">${perfil.resumo}</p>
        </div>
    </c:forEach>

    <!-- Habilidades -->
    <div class="bg-white rounded-lg shadow-md mt-6 p-6">
        <div class="flex justify-between items-center">
            <h3 class="text-xl font-semibold text-gray-800">Habilidades</h3>
            <% if (ehDonoPerfil) { %>
                <button onclick="openAddSkillModal()" class="text-blue-600 hover:underline text-sm">Adicionar Habilidade</button>
            <% } %>
        </div>
        <div class="flex flex-wrap gap-2 mt-2">
            <span class="skill bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm flex items-center">Java<span class="remove-skill" onclick="removeSkill(this)">✕</span></span>
            <span class="skill bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm flex items-center">SQL<span class="remove-skill" onclick="removeSkill(this)">✕</span></span>
            <span class="skill bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm flex items-center">Spring Boot<span class="remove-skill" onclick="removeSkill(this)">✕</span></span>
        </div>
    </div>

    <!-- Experiência -->
    <div class="bg-white rounded-lg shadow-md mt-6 p-6">
        <div class="flex justify-between items-center">
            <h3 class="text-xl font-semibold text-gray-800">Experiência</h3>
            <% if (ehDonoPerfil) { %>
                <button onclick="openAddExperienceModal()" class="text-blue-600 hover:underline text-sm">Adicionar Experiência</button>
            <% } %>
        </div>
        <div class="mt-4 space-y-4">
            <div class="border-l-4 border-blue-600 pl-4">
                <h4 class="text-lg font-medium text-gray-800">Desenvolvedor Backend Sênior</h4>
                <p class="text-gray-600">Tech Solutions | Jan 2022 - Presente</p>
                <p class="text-gray-600 mt-1">Desenvolvimento de APIs RESTful com Spring Boot...</p>
            </div>
        </div>
    </div>

    <!-- Atividade -->
    <div class="bg-white rounded-lg shadow-md mt-6 p-6">
        <h3 class="text-xl font-semibold text-gray-800">Atividade</h3>
        <div class="mt-4 space-y-4">
            <div class="bg-gray-50 p-4 rounded-lg fade-in">
                <p>🚀 Concluí meu primeiro projeto com Java Web usando Servlets + JSP!</p>
                <p class="text-sm text-gray-500 mt-2">10 de Jun, 2025</p>
            </div>
        </div>
    </div>
</main>

<!-- Modais (somente são exibidos com JS) -->
<!-- Ex: EditProfileModal, AddSkillModal, AddExperienceModal -->

<script src="javascript/Perfil.js"></script>

</body>
</html>
