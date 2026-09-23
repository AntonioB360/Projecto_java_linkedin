<%-- 
    Document   : PublicacaoDetalhes
    Created on : 13/04/2025, 08:38:30
    Author     : T
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Dao.PostagemDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Model.Postagens"%>
<%@page import="Model.Usuario"%>

<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
 PostagemDao post=new PostagemDao();
    List<Postagens> lista=post.listagem_postagens();

  
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Publicação</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/PublicacaoDetalhes.css">
</head>
<body>
    <nav>
        <!-- Navbar similar ao Feed -->
    </nav>

    <div class="container">
        <div class="post-detalhes">
            <div class="post-author">
                <%for(Postagens postagem: lista){%>
                <img src="<%=postagem.getUsuario().getFoto_perfil()%>" alt="Autor">
                <div>
                    <h1><%=postagem.getUsuario().getNome()%></h1>
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
                <% if (postagem.getUsuario().getId() == usuario.getId()) { %>
                    <a href="EditarPost.jsp?id=<%=postagem.getId()%>">Editar</a>
                    <a href="ExcluirPost?id=<%=postagem.getId()%>" onclick="return confirm('Tem certeza que deseja excluir esta publicação?');">Excluir</a>
                <% } %>
            </div>

            <div class="comentarios">
                <h3>Comentários</h3>
        
                    <div class="comentario">
                        <p></p>
                    </div>
               
                <form action="AdicionarComentario" method="post">
                    <input type="hidden" name="postId" value="<%=postagem.getId()%>">
                    <textarea name="comentario" placeholder="Adicione um comentário"></textarea>
                    <button type="submit">Comentar</button>
                </form>
            </div>
                    <%}%>
        </div>
    </div>

    <footer>
        <!-- Footer similar ao Feed -->
    </footer>
</body>
</html>