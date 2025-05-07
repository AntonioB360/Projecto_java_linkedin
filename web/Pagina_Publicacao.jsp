<%-- 
    Document   : Pagina_Publicacao
    Created on : 28/04/2025, 02:52:11
    Author     : T
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Publicação</title>
    <link rel="stylesheet" href="css/pagina.css">
</head>
<body>
    <div class="container">
        <div class="publication">
            <h1 class="publication-title">Título da Publicação</h1>
            <p class="publication-content">
                Este é o conteúdo da publicação. Aqui você pode adicionar suas ideias, reflexões ou qualquer outra informação relevante.
            </p>
            <button class="comment-button" onclick="toggleComments()">Comentar</button>
        </div>
        
        <div class="comments-section" id="commentsSection" style="display: none;">
            <h2>Comentários</h2>
            <form class="comment-form" id="commentForm" onsubmit="addComment(); return false;">
                <textarea id="commentText" placeholder="Escreva um comentário..." required></textarea>
                <button type="submit">Enviar</button>
            </form>
            <div class="comments-list" id="commentsList"></div>
        </div>
    </div>

    <script src="javascript/pagina.js"></script>
</body>
</html>

