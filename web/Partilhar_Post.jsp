<%-- 
    Document   : Partilhar_Post
    Created on : 26/05/2025, 08:40:12
    Author     : T
--%>
<%@page import="Model.Postagens"%>
<%@page import="Model.Dao.PostagemDao"%>
<%@page import="Model.Usuario"%>
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

    int idPostagem=Integer.parseInt(idPostagemStr);
    
    PostagemDao postagemDao = new PostagemDao();
    Postagens post = postagemDao.buscarPorId(idPostagem);

    if (post == null || post.getUsuario() == null) {
        out.println("Postagem não encontrada ou sem usuário.");
        return;
    
    }

    


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Partilhar Post</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/Partilha.css"/>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="logo">GLAMVC</div>
            <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="<%=usuario.getNome()%>" class="user-avatar">
        </div>
    </header>

    <div class="container">
        <main>
            <div class="post-container">
                <div class="post-header">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Author" class="post-avatar">
                    <div>
                        <div class="post-author"><%=post.getUsuario().getNome()%></div>
                        <div class="post-time"><%=post.getUsuario().getCargo()%> • Publicado há <%=post.getDataPostagem()%></div>
                    </div>
                </div>
                <div class="post-content">
                  
                    <p> <%=post.getConteudo()%></p>
                    <img src="<%=post.getImagens()%>"width="70%">
                </div>
                <div class="post-actions">
                 
                    <button class="action-btn" id="repost-btn">
                        <i>🔄</i> Republicar
                    </button>
                    <button class="action-btn" id="send-btn">
                        <i>✉️</i> Enviar
                    </button>
                </div>
            </div>
        </main>

        <aside class="share-options">
            <h3>Suas conexões</h3>
            <ul class="connection-list">
                <li class="connection-item">
                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Connection" class="connection-avatar">
                    <span>Ana Oliveira</span>
                </li>
                <li class="connection-item">
                    <img src="https://randomuser.me/api/portraits/men/22.jpg" alt="Connection" class="connection-avatar">
                    <span>Pedro Santos</span>
                </li>
                <li class="connection-item">
                    <img src="https://randomuser.me/api/portraits/women/33.jpg" alt="Connection" class="connection-avatar">
                    <span>Mariana Costa</span>
                </li>
                <li class="connection-item">
                    <img src="https://randomuser.me/api/portraits/men/55.jpg" alt="Connection" class="connection-avatar">
                    <span>João Pereira</span>
                </li>
                <li class="connection-item">
                    <img src="https://randomuser.me/api/portraits/women/28.jpg" alt="Connection" class="connection-avatar">
                    <span>Beatriz Almeida</span>
                </li>
            </ul>

            <div id="share-section" style="display: none;">
                <h3>Compartilhar post</h3>
                <form class="share-form">
                    <textarea placeholder="Adicione um comentário (opcional)"></textarea>
                    <button type="submit">Compartilhar</button>
                </form>
            </div>

            <div id="send-section" style="display: none;">
                <h3>Enviar para conexão</h3>
                <form class="share-form">
                    <select>
                        <option value="">Selecione uma conexão</option>
                        <option value="1">Ana Oliveira</option>
                        <option value="2">Pedro Santos</option>
                        <option value="3">Mariana Costa</option>
                        <option value="4">João Pereira</option>
                        <option value="5">Beatriz Almeida</option>
                    </select>
                    <textarea placeholder="Adicione uma mensagem (opcional)"></textarea>
                    <button type="submit">Enviar</button>
                </form>
            </div>
        </aside>
    </div>

    <div class="modal" id="repost-modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Republicar post</h3>
                <button class="close-btn" id="close-repost-modal">&times;</button>
            </div>
            <form class="share-form">
                <div style="margin-bottom: 15px;">
                    <label>
                        <input type="radio" name="repost-type" value="share" checked> Compartilhar imediatamente
                    </label>
                </div>
                <div style="margin-bottom: 15px;">
                    <label>
                        <input type="radio" name="repost-type" value="comment"> Compartilhar com comentário
                    </label>
                </div>
                <textarea placeholder="Adicione seu comentário" style="display: none;" id="repost-comment"></textarea>
                <button type="submit">Republicar</button>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Elementos
            const repostBtn = document.getElementById('repost-btn');
            const sendBtn = document.getElementById('send-btn');
            const shareSection = document.getElementById('share-section');
            const sendSection = document.getElementById('send-section');
            const repostModal = document.getElementById('repost-modal');
            const closeRepostModal = document.getElementById('close-repost-modal');
            const repostComment = document.getElementById('repost-comment');
            const repostTypeRadios = document.querySelectorAll('input[name="repost-type"]');

            // Alternar entre republicar e enviar
            repostBtn.addEventListener('click', function() {
                repostModal.style.display = 'flex';
            });

            sendBtn.addEventListener('click', function() {
                shareSection.style.display = 'none';
                sendSection.style.display = 'block';
            });

            // Fechar modal
            closeRepostModal.addEventListener('click', function() {
                repostModal.style.display = 'none';
            });

            // Mostrar/ocultar textarea de comentário
            repostTypeRadios.forEach(radio => {
                radio.addEventListener('change', function() {
                    if (this.value === 'comment') {
                        repostComment.style.display = 'block';
                    } else {
                        repostComment.style.display = 'none';
                    }
                });
            });

            // Fechar modal ao clicar fora
            window.addEventListener('click', function(event) {
                if (event.target === repostModal) {
                    repostModal.style.display = 'none';
                }
            });

            // Simular envio de formulários
            document.querySelectorAll('.share-form').forEach(form => {
                form.addEventListener('submit', function(e) {
                    e.preventDefault();
                    alert('Post compartilhado com sucesso!');
                    shareSection.style.display = 'none';
                    sendSection.style.display = 'none';
                    repostModal.style.display = 'none';
                    this.reset();
                });
            });
        });
    </script>
</body>
</html>
