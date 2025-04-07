<%-- 
    Document   : Perfil
    Created on : 31/03/2025, 09:27:34
    Author     : us
--%>

<%@page import="Model.Usuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

              <%
    HttpSession sessao=request.getSession(false);
    Usuario usuario=(sessao != null) ? (Usuario) sessao.getAttribute("usuario"): null;
    if(usuario == null){
    response.sendRedirect("login.jsp");
    return;
    }
  %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Perfil do Usuário</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            border-bottom: 2px solid #e9e9e9;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .profile-header img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }
        .profile-header h1 {
            margin: 0;
            font-size: 24px;
        }
        .profile-header h2 {
            margin: 5px 0;
            color: #666;
            font-size: 18px;
        }
        .section {
            margin-bottom: 20px;
        }
        .section h3 {
            margin-bottom: 10px;
            border-bottom: 1px solid #e9e9e9;
            padding-bottom: 5px;
        }
        .experience, .education {
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile-header">
            <img src="profile-pic.jpg" alt="Foto do Usuário">
            <div>
                <h1>Nome do Usuário</h1>
                <h2>Título Profissional</h2>
                <p>Localização: Cidade, Estado</p>
                <p>Conexões: 500+ conexões</p>
            </div>
        </div>

        <div class="section">
            <h3>Sobre</h3>
            <p>Breve descrição ou resumo sobre o usuário, suas habilidades, interesses e objetivos profissionais.</p>
        </div>

        <div class="section experience">
            <h3>Experiência Profissional</h3>
            <div>
                <h4>Nome da Empresa 1</h4>
                <p>Cargo Ocupado | Data de Início - Data de Término</p>
                <p>Descrição das responsabilidades e conquistas.</p>
            </div>
            <div>
                <h4>Nome da Empresa 2</h4>
                <p>Cargo Ocupado | Data de Início - Data de Término</p>
                <p>Descrição das responsabilidades e conquistas.</p>
            </div>
        </div>

        <div class="section education">
            <h3>Educação</h3>
            <div>
                <h4>Nome da Instituição 1</h4>
                <p>Curso | Data de Início - Data de Término</p>
            </div>
            <div>
                <h4>Nome da Instituição 2</h4>
                <p>Curso | Data de Início - Data de Término</p>
            </div>
        </div>
    </div>
</body>
</html>
