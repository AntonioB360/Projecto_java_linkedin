<%@page import="Model.Comentario"%>
<%@page import="java.util.List"%>
<%@page import="Model.Dao.ComentarioDao"%>
<%@page import="Model.Postagens"%>
<%@page import="Model.Dao.PostagemDao"%>
<%@page import="Model.Usuario"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idPostagemStr = request.getParameter("id");
    if (idPostagemStr == null) {
        out.println("ID da postagem não fornecido.");
        return;
    }

    int idPostagem = Integer.parseInt(idPostagemStr);
    PostagemDao postagemDao = new PostagemDao();
    Postagens post = postagemDao.buscarPorId(idPostagem);

    if (post == null || post.getUsuario() == null) {
        out.println("Postagem não encontrada ou sem usuário.");
        return;
    }

    ComentarioDao cd = new ComentarioDao();
    List<Comentario> listar = cd.listar_comentarios(idPostagem);
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <title><%=post.getUsuario().getNome()%> | Publicação</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #0a66c2;
            --secondary-color: #ffffff;
            --text-color: #000000e6;
            --text-secondary: #666666;
            --border-color: #e0e0e0;
            --background-color: #f3f2ef;
            --comment-bg: #f9fafb;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
        }
        
        body {
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.5;
        }
        
        .main-container {
            display: flex;
            max-width: 800px;
            margin: 10px auto;
            gap: 15px;
        }
        
        .content-container {
            flex: 1;
            max-width: 782px;
        }
        
        .post-container {
            background-color: var(--secondary-color);
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: 0 1px 2px rgba(0,0,0,0.08);
            padding: 16px;
            margin-bottom: 16px;
        }
        
        .post-header {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }
        
        .post-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 12px;
        }
        
        .post-author-info {
            flex: 1;
        }
        
        .post-author-name {
            font-weight: 600;
            font-size: 16px;
            color: var(--text-color);
            text-decoration: none;
        }
        
        .post-author-name:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }
        
        .post-author-details {
            font-size: 14px;
            color: var(--text-secondary);
            margin-top: 2px;
        }
        
        .post-time {
            font-size: 12px;
            color: var(--text-secondary);
            display: flex;
            align-items: center;
        }
        
        .post-time i {
            margin-right: 4px;
            font-size: 10px;
        }
        
        .post-content {
            margin: 12px 0;
            font-size: 14px;
            white-space: pre-line;
            line-height: 1.6;
        }
        
        .post-image {
            width: 100%;
            max-height: 500px;
            object-fit: contain;
            border-radius: 8px;
            margin-top: 12px;
            border: 1px solid var(--border-color);
        }
        
        .post-stats {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 8px 0;
            border-top: 1px solid var(--border-color);
            border-bottom: 1px solid var(--border-color);
            margin: 12px 0;
            color: var(--text-secondary);
            font-size: 14px;
        }
        
        .post-actions {
            display: flex;
            justify-content: space-around;
            padding: 4px 0;
        }
        
        .post-action {
            display: flex;
            align-items: center;
            padding: 8px 12px;
            border-radius: 4px;
            color: var(--text-secondary);
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .post-action:hover {
            background-color: rgba(0,0,0,0.04);
            color: var(--primary-color);
        }
        
        .post-action i {
            margin-right: 6px;
            font-size: 16px;
        }
        
        .comment-form-container {
            background-color: var(--secondary-color);
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: 0 1px 2px rgba(0,0,0,0.08);
            padding: 16px;
            margin-bottom: 16px;
        }
        
        .comment-form {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }
        
        .comment-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .comment-input {
            flex: 1;
            border: 1px solid var(--border-color);
            border-radius: 24px;
            padding: 12px 16px;
            font-size: 14px;
            resize: none;
            min-height: 40px;
            max-height: 120px;
            transition: all 0.2s;
        }
        
        .comment-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(10,102,194,0.2);
        }
        
        .comment-submit {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 24px;
            padding: 10px 20px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .comment-submit:hover {
            background-color: #004182;
        }
        
        .comments-container {
            background-color: var(--secondary-color);
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: 0 1px 2px rgba(0,0,0,0.08);
            padding: 16px;
        }
        
        .comments-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            color: var(--text-color);
        }
        
        .no-comments {
            color: var(--text-secondary);
            font-size: 14px;
            text-align: center;
            padding: 16px 0;
        }
        
        .comment {
            display: flex;
            gap: 12px;
            padding: 12px 0;
            border-bottom: 1px solid var(--border-color);
        }
        
        .comment:last-child {
            border-bottom: none;
        }
        
        .comment-content {
            flex: 1;
        }
        
        .comment-author {
            font-weight: 600;
            font-size: 14px;
            color: var(--text-color);
            text-decoration: none;
        }
        
        .comment-author:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }
        
        .comment-text {
            font-size: 14px;
            margin: 4px 0;
            white-space: pre-line;
        }
        
        .comment-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 4px;
            font-size: 12px;
            color: var(--text-secondary);
        }
        
        .comment-action {
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .comment-action:hover {
            color: var(--primary-color);
        }
        
        .comment-action i {
            margin-right: 4px;
            font-size: 12px;
        }
        
        .comment-time {
            font-size: 12px;
            color: var(--text-secondary);
        }
        
        .sidebar {
            width: 312px;
        }
        
        .sidebar-widget {
            background-color: var(--secondary-color);
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: 0 1px 2px rgba(0,0,0,0.08);
            padding: 16px;
            margin-bottom: 16px;
        }
        
        .widget-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 12px;
            color: var(--text-color);
        }
        
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
                padding: 0 16px;
            }
            
            .content-container {
                max-width: 100%;
            }
            
            .sidebar {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="content-container">
            <!-- Postagem principal -->
            <div class="post-container">
                <div class="post-header">
                    <img src="<%=post.getUsuario().getFoto_perfil()%>" alt="<%=post.getUsuario().getNome()%>" class="post-avatar">
                    <div class="post-author-info">
                        <a href="#" class="post-author-name"><%=post.getUsuario().getNome()%></a>
                        <div class="post-author-details"><%=post.getUsuario().getCargo()%> • <%=post.getUsuario().getEmpresa()%></div>
                        <div class="post-time">
                            <i class="far fa-clock"></i>
                            <%=post.getDataPostagem()%>
                        </div>
                    </div>
                </div>
                
                <div class="post-content">
                    <%=post.getConteudo()%>
                </div>
                
                <% if(post.getImagens() != null && !post.getImagens().isEmpty()) { %>
                    <img src="<%=post.getImagens()%>" alt="Imagem da postagem" class="post-image">
                <% } %>
                
                <div class="post-stats">
                    <span><i class="far fa-thumbs-up"></i> <%=post.getNumero_curtidas()%></span>
                    <span><%=post.getNumero_comentario()%></span>
                </div>
                
                <div class="post-actions">
                    <div class="post-action">
                        <i class="far fa-thumbs-up"></i>
                        <span>Curtir</span>
                    </div>
                   
                    <div class="post-action">
                        <i class="fas fa-share"></i>
                        <span>Compartilhar</span>
                    </div>
                   <% if (usuario.getId() == post.getUsuario().getId()) { %>
    <form action="Postagem" method="post">
        <input type="hidden" name="acao" value="eliminar">
        <input type="hidden" name="idUsuario" value="<%=usuario.getId()%>">
        <input type="hidden" name="idPostagem" value="<%=post.getId()%>">
        <button type="submit">
            <div class="post-action">
                <i class="fas fa-trash-alt"></i>
                <span>Eliminar</span>
            </div>
        </button>
    </form>
<% } %>

                    
                    
                                        
                </div>
            </div>
            
            <!-- Formulário de comentário -->
            <div class="comment-form-container">
                <form action="Postagem" method="post" class="comment-form">
                    <input type="hidden" name="idPostagem" value="<%=post.getId()%>">
                    <input type="hidden" name="idUsuario" value="<%=usuario.getId()%>">
                    <input type="hidden" name="id_remetente" value="<%=post.getUsuario().getId()%>">
                    <input type="hidden" id="id" name="acao" value="comentar">
                   
                    <img src="<%=usuario.getFoto_perfil()%>" alt="Seu perfil" class="comment-avatar">
                    <textarea name="comentario" class="comment-input" rows="1" placeholder="Adicione um comentário..."></textarea>
                    <button type="submit" class="comment-submit">Publicar</button>
                </form>
            </div>
            
            <!-- Lista de comentários -->
            <div class="comments-container">
                <h3 class="comments-title">Comentários</h3>
                
                <% if(listar.isEmpty()) { %>
                    <div class="no-comments">
                        <p>Seja o primeiro a comentar</p>
                    </div>
                <% } else { 
                    for(Comentario c : listar) { %>
                        <div class="comment">
                            <img src="<%=c.getUsuarios().getFoto_perfil()%>" alt="<%=c.getUsuarios().getNome()%>" class="comment-avatar">
                            <div class="comment-content">
                                <a href="#" class="comment-author"><%=c.getUsuarios().getNome()%></a>
                                <p class="comment-text"><%=c.getConteudo()%></p>
                                <div class="comment-actions">
                                    <span class="comment-time"><%=c.getData_comentario()%></span>
                                    <span class="comment-action">
                                        <i class="far fa-thumbs-up"></i>
                                        Curtir
                                    </span>
                                    <span class="comment-action">
                                        <i class="far fa-comment"></i>
                                        Responder
                                    </span>
                                </div>
                            </div>
                        </div>
                <%  }
                } %>
            </div>
        </div>
        
        <!-- Sidebar -->
     
    </div>

    <script>
        // Auto-resize textarea
        const textarea = document.querySelector('.comment-input');
        textarea.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
        
        // Simular contagem de curtidas e comentários
        document.addEventListener('DOMContentLoaded', function() {
            const commentCount = document.querySelectorAll('.comment').length;
            if (commentCount > 0) {
                document.querySelector('.post-stats span:nth-child(2)').textContent = 
                    commentCount + (commentCount === 1 ? ' comentário' : ' comentários');
            }
        });
    </script>
</body>
</html>