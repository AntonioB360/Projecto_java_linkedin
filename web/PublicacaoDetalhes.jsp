<%-- 
    Document   : PublicacaoDetalhes
    Created on : 13/04/2025, 08:38:30
    Author     : T
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Model.Postagens"%>
<%@page import="Model.Usuario"%>

<%
    Postagens postagem = (Postagens) request.getAttribute("postagem");
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Publicação</title>
    <link rel="stylesheet" href="css/PublicacaoDetalhes.css">
</head>
<body>
    <nav>
        <!-- Navbar similar ao Feed -->
    </nav>

    <div class="container">
        <div class="post-detalhes">
            <div class="post-author">
                <img src="<%=postagem.getAutor().getFoto_perfil()%>" alt="Autor">
                <div>
                    <h1><%=postagem.getAutor().getNome()%></h1>
                    <small><%=postagem.getDataPostagem()%></small>
                </div>
            </div>
            <p><%=postagem.getConteudo()%></p>
            <% if (postagem.getImagens() != null) { %>
                <img src="<%=postagem.getImagens()%>" alt="Imagem da Publicação" width="100%">
            <% } %>

            <div class="post-actions">
                <a href="CurtirPost?id=<%=postagem.getId()%>">Curtir</a>
                <a href="ComentarPost?id=<%=postagem.getId()%>">Comentar</a>
                <% if (postagem.getAutor().getId() == usuario.getId()) { %>
                    <a href="EditarPost.jsp?id=<%=postagem.getId()%>">Editar</a>
                    <a href="ExcluirPost?id=<%=postagem.getId()%>" onclick="return confirm('Tem certeza que deseja excluir esta publicação?');">Excluir</a>
                <% } %>
            </div>

            <div class="comentarios">
                <h3>Comentários</h3>
                <% for (String comentario : postagem.getComentarios()) { %>
                    <div class="comentario">
                        <p><%=comentario%></p>
                    </div>
                <% } %>
                <form action="AdicionarComentario" method="post">
                    <input type="hidden" name="postId" value="<%=postagem.getId()%>">
                    <textarea name="comentario" placeholder="Adicione um comentário"></textarea>
                    <button type="submit">Comentar</button>
                </form>
            </div>
        </div>
    </div>

    <footer>
        <!-- Footer similar ao Feed -->
    </footer>
</body>
</html>