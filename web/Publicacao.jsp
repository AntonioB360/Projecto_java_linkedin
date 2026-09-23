<%-- 
    Document   : Publicacao
    Created on : 01/04/2025, 11:57:07
    Author     : [Seu Nome ou Nome da Empresa]
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
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
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Criar Publicação </title>
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="css/post.css">
        <link rel="stylesheet" href="css/global.css">
        <style>
        </style>
    </head>

    <body>
        <div class="container">
            <!-- Cabeçalho -->
            <header class="main-header">
                <h1><i class="fas fa-pen-alt"></i> Criar Nova Publicação</h1>
                <a href="Feed.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Voltar ao Feed</a>
            </header>

            <main class="publication-container">
                <!-- Informações do usuário -->
                <div class="user-card">
                    <div class="user-avatar">
                        <img src="<%=usuario.getFoto_perfil()%>" alt="Foto de perfil de <%=usuario.getNome()%>" class="profile-pic">
                    </div>
                    <div class="user-details">
                        <h3><%=usuario.getNome()%></h3>
                        <span class="post-time">Agora</span>
                    </div>
                </div>

                <!-- Formulário de publicação -->
                <form class="publication-form" id="postForm" action="Postagem" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id_usuario" value="<%=usuario.getId()%>">

                    <div class="form-group">
                        <textarea name="conteudo" id="conteudo" placeholder="Compartilhe seus pensamentos..." rows="5"></textarea>
                        <div class="char-counter"><span id="charCount">0</span>/500</div>
                    </div>

                    <div class="preview-container" id="previewContainer" style="display:none;">
                        <div class="preview-header">
                            <h4>Pré-visualização</h4>
                            <button type="button" class="btn-close" id="removeImage"><i class="fas fa-times"></i></button>
                        </div>
                        <img id="preview" src="#" alt="Pré-visualização da imagem" class="preview-image">
                    </div>

                    <div class="form-actions">
                        <div class="attachment-options">
                            <label for="foto" class="btn-attachment">
                                <i class="fas fa-image"></i> Adicionar Imagem
                                <input type="file" name="foto" id="foto" accept="image/png,image/jpeg,image/gif">
                            </label>
                        </div>

                        <input type="hidden" id="id" name="acao" value="postar">
                        <button type="submit" class="btn-publish">
                            <i class="fas fa-paper-plane"></i> Publicar
                        </button>
                    </div>
                </form>
            </main>
        </div>

        <script src="javascript/Post.js">

        </script>
    </body>
</html>