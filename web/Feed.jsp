<%-- 
    Document   : Feed
    Created on : 28/03/2025, 15:21:11
    Author     : us
--%>

<%@page import="Controler.UsuarioDTO"%>
<%@page import="Controler.LoginDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Model.Dao.PostagemDao"%>
<%@page import="Model.Postagens"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessao = request.getSession(false);
   LoginDTO login = (LoginDTO) sessao.getAttribute("usuario");
     UsuarioDTO dados = (UsuarioDTO) sessao.getAttribute("dados");

    if (login == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    PostagemDao post = new PostagemDao();
    List<Postagens> lista = post.listagem_postagens();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GLAMVC</title>
        <link rel="stylesheet" href="css/Fed.css">
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .liked {
                color: #0a66c2;
                font-weight: bold;
            }
            .like-btn.liked img {
                content: url('images/like-filled.png');
            }
            .post-activity-link {
                transition: all 0.3s ease;
            }
            .post-activity-link:hover {
                background-color: #ebebeb;
                border-radius: 4px;
            }
            .post {
                transition: box-shadow 0.3s ease;
            }
            .post:hover {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }
            .liked-users {
                font-weight: 600;
                color: #666;
            }
            .like-btn.disabled {
                pointer-events: none;
                opacity: 0.7;
            }
        </style>
    </head>
    <body>

        <nav class="navbar">
            <div class="navbar-left">
                <div class="logo">GLAMVC</div>
                <div class="search-box">
                    <img src="images/search.png" >
                    <input type="text" placeholder="Search for anything">
                </div>
            </div>
            <div class="navbar-center">
                <ul>
                    <li><a href="#" class="active-link"><img src="images/home.png" alt="home"> <span>Inicio</span></a></li>
                    <li>
                        <a href="Conexao?id_usuario=<%= dados.getId()%>">
                            <img src="images/network.png" alt="network">
                            <span>Minha rede</span>
                        </a>
                    </li>
                    <li><a href="Premiun.jsp"><img src="images/jobs.png" alt="jobs"> <span>Premiun</span></a></li>
                    <li><a href="Vagas_cand.jsp"><img src="images/jobs.png" alt="jobs"> <span>Trabalho</span></a></li>
                    <li><a href="Processar_Mensagen?id_usuario=<%=dados.getId()%>"><img src="images/message.png" alt="message"> <span>Menssagen</span></a></li>
                    <li><a href="Notificacao?id_usuario=<%= dados.getId()%>"><img src="images/notification.png" alt="notification"> <span>Notificacoes</span></a></li>
                </ul>
            </div>
            <div class="navbar-right">
                <div class="online">
                    <img src="<%=dados.getFoto_perfil()%>" class="nav-profile-img" onclick="toggleMenu()">
                </div> 
            </div>
            <!----Dropdown menu-->
            <div class="profile-menu-wrap" id="profileMenu">
                <div class="profile-menu">
                    <div class="user-info">
                        <img src="<%=dados.getFoto_perfil()%>">
                        <div>
                            <h3><%=dados.getNome()%></h3>
                              
                            <a href="UsuarioPerfil?id_usuario=<%=dados.getId()%>">seu perfil</a>
                        </div>
                    </div>
                    <hr>
                    <a href="#" class="profile-menu-link">
                        <img src="images/feedback.png">
                        <p>Give Feedback</p>
                        <span>></span>
                    </a>
                    <a href="#" class="profile-menu-link">
                        <img src="images/setting.png">
                        <p>Settings & Privacy</p>
                        <span>></span>
                    </a>
                    <a href="#" class="profile-menu-link">
                        <img src="images/help.png">
                        <p>Help & Support</p>
                        <span>></span>
                    </a>
                    <a href="#" class="profile-menu-link">
                        <img src="images/display.png">
                        <p>Display & Accessibility</p>
                        <span>></span>
                    </a>
                    <a href="Logout" class="profile-menu-link">
                        <img src="images/logout.png">
                        <p>Logout</p>
                        <span>></span>
                    </a>
                </div>
            </div>
        </nav>



        <div class="main-content"> 
            <div class="create-post">
                <div class="create-post-input">
                    <img src="<%=dados.getFoto_perfil()%>">
                    <textarea rows="2" placeholder="Write Something"></textarea>
                </div>
                <div class="create-post-links">
                    <li><img src="images/photo.png">Foto</li>
                    <li><img src="images/video.png">Video</li>
                    <li><img src="images/event.png">Evento</li>
                    <a href="Publicacao.jsp"> <li>+ Publicar</li></a> 
                </div>
            </div>
            <div class="sort-by">
                <hr>
                <p>Sort by : <span>top <img src="images/down-arrow.png" ></span> </p>
            </div>
     
            <%for (Postagens postagem : lista) {%>
            <div class="post" id="post-<%=postagem.getId()%>">
                <div class="post-author">
                    <img src="<%=postagem.getUsuario().getFoto_perfil()%>">
                    <div>
                        <h1><%=postagem.getUsuario().getNome()%></h1>
                        <small><%=postagem.getUsuario().getCargo()%> | <%=postagem.getUsuario().getEmpresa()%></small>
                        <br>
                        <small> <%=postagem.getDataPostagem()%></small>
                    </div>
                </div>
                <p><%=postagem.getConteudo()%></p>
                <% if(postagem.getImagens() != null && !postagem.getImagens().isEmpty()) { %>
                <img src="<%=postagem.getImagens()%>" width="70%" class="post-image">
                <% } %>

                <div class="post-stats">
                    <div>
                        <img src="images/thumbsup.png">
                        <img src="images/love.png">
                        <img src="images/clap.png">
                        <span class="liked-users" id="like-count-<%=postagem.getId()%>"><%=postagem.getNumero_curtidas()%></span>
                    </div>
                    <div>
                        <span><%=postagem.getNumero_comentario()%> comments</span>
                    </div>
                </div>
                <div class="post-activity">
                    <div>
                        <img src="<%=dados.getFoto_perfil()%>" class="post-activity-user-icon">
                        <img src="images/down-arrow.png" class="post-activity-arrow-icon">
                    </div>
                    <div class="post-activity-link like-btn" id="like-btn-<%=postagem.getId()%>">
                        <img src="images/like.png">
                        <a href="javascript:void(0);" onclick="likePost(<%=postagem.getId()%>, <%=dados.getId()%>, this)">
                            <span>Like</span>
                        </a>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/comment.png">
                        <span><%=postagem.getNumero_comentario()%></span>
                        <a href="Pagina_Publicacao.jsp?id=<%=postagem.getId()%>"><span>Comment</span></a>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/share.png">
                        <a href="Partilhar_Post.jsp?id=<%=postagem.getId()%>"><span>Share</span></a>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/send.png">
                        <span>Send</span>
                    </div>
                </div>
            </div>
            <%}%>

            <div class="right-sidebar">
                <footer> 
                    <div class="sidebar-useful-links">
                        <a href="#">About</a>
                        <a href="#">Accessibility</a>
                        <a href="#">Help Center</a>
                        <a href="#">Privacy Policy</a>
                        <a href="#">Advertising</a>
                        <a href="#">Get the App</a>
                        <a href="#">More</a>
                        <div class="copyright-msg">
                            <img src="images/logo.png">
                            <p>GLAMVC &#169; 2025. All Rights Reserved</p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

            <script src="javascript/Feed.js">
            
        </script>
    </body>
</html>