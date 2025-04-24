<%-- 
    Document   : Feed
    Created on : 28/03/2025, 15:21:11
    Author     : us
--%>


<%@page import="Model.Dao.PostagemDao"%>
<%@page import="Model.Postagens"%>
<%@page import="java.util.List"%>
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
    
 PostagemDao post=new PostagemDao();
    List<Postagens> lista=post.listagem_postagens();

  
%>



      <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linkedin</title>
    <link rel="stylesheet" href="css/Fed.css">
</head>
<body>

    <nav class="navbar">
       <div class="navbar-left">
        <a href="index.html" class="logo"><img src="images/logo.png" alt="logo"></a>
        <div class="search-box">
            <img src="images/search.png" >
            <input type="text" placeholder="Search for anything">
        </div>
       </div>
       <div class="navbar-center">
        <ul>
            <li><a href="#" class="active-link"><img src="images/home.png" alt="home"> <span>Inicio</span></a></li>
            <li><a href="Rede.jsp"><img src="images/network.png" alt="network"> <span>Minha rede</span></a></li>
            <li><a href="Vagas_cand.jsp"><img src="images/jobs.png" alt="jobs"> <span>Trabalho</span></a></li>
            <li><a href="mensagem.jsp"><img src="images/message.png" alt="message"> <span>Menssagen</span></a></li>
            <li><a href="Notificacao.jsp"><img src="images/notification.png" alt="notification"> <span>Notificacoes</span></a></li>
        </ul>
       </div>
       <div class="navbar-right">
        <div class="online">
        <img src="<%=usuario.getFoto_perfil()%>" class="nav-profile-img" onclick="toggleMenu()">
        </div> 
       </div>
       <!----Dropdown menu-->
       <div class="profile-menu-wrap" id="profileMenu">
        <div class="profile-menu">
            <div class="user-info">
                <img src="<%=usuario.getFoto_perfil()%>">
                <div>
                    <h3><%=usuario.getNome()%></h3>
                    <a href="Perfil.jsp">seu perfil</a>
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


    <div class="container">
        <div class="left-sidebar"> 
            <div class="sidebar-profile-box">
                <img src="images/cover-pic.png" width="100%">
                <div class="sidebar-profile-info">
                    <img src="<%=usuario.getFoto_perfil()%>">
                    <h1><%=usuario.getNome()%></h1>
                    <h3><%=usuario.getCargo()%></h3>
                    <ul>
                        <li>visualizacoes no seu perfil <span>24</span></li>
                        <li> seus posts <span>128</span></li>
                        <li>suas conexoes<span>108</span></li>
                    </ul>
                </div>
                <div class="sidebar-profile-link">
                    <a href="#"><img src="images/items.png">Meu time</a>
                    <a href="Premiun.jsp"><img src="images/premium.png">Assinar Premiun</a>
                </div>
            </div>

            <div class="sidebar-activity" id="sidebarActivity">
                <h3>RECENT</h3>
                <a href="#"><img src="images/recent.png">Data Analysis</a>
                <a href="#"><img src="images/recent.png">UI UX Design</a>
                <a href="#"><img src="images/recent.png">Web Development</a>
                <a href="#"><img src="images/recent.png">Object Oriented Programming</a>
                <a href="#"><img src="images/recent.png">Operating Systems</a>
                <a href="#"><img src="images/recent.png">Platform technologies</a>
                <h3>GROUPS</h3>
                <a href="#"><img src="images/group.png">Data Analyst group</a>
                <a href="#"><img src="images/group.png">Learn NumPy</a>
                <a href="#"><img src="images/group.png">Machine Learning group</a>
                <a href="#"><img src="images/group.png">Data Science Aspirants</a> 
                <h3>HASHTAG</h3>
                <a href="#"><img src="images/hashtag.png">dataanalyst</a>
                <a href="#"><img src="images/hashtag.png">numpy</a>
                <a href="#"><img src="images/hashtag.png">machinelearning</a>
                <a href="#"><img src="images/hashtag.png">datascience</a> 
                <div class="discover-more-link">
                    <a href="#">Discover More</a>
                </div>
                </div>
                <p id="showMoreLink" onclick="toggleActivity()">Show more <b>+</b></p>
            
        </div>
                    
        <div class="main-content"> 
            <div class="create-post">
                <div class="create-post-input">
                    <img src="<%=usuario.getFoto_perfil()%>">
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
                   
       <div class="post">
             <% for(Postagens pos: lista){ %>
                <div class="post-author">
                    <img src="">
                    <div>
                        <h1></h1>
                        <small></small>
                        <small></small>
                    </div>
                </div>
                <p>
                   
                </p>
                <img src="images/post-image-1.png"width="100%">
            


                <div class="post-stats">
                    <div>
                        <img src="images/thumbsup.png" >
                        <img src="images/love.png">
                        <img src="images/clap.png">
                        <span class="liked-users">Adam Doe and 89 others</span>
                    </div>
                    <div>
                        <span>22 comments &middot; 40 shares</span>
                    </div>
                </div>
                <div class="post-activity">
                    <div>
                        <img src="<%=usuario.getFoto_perfil()%>" class="post-activity-user-icon">
                        <img src="images/down-arrow.png" class="post-activity-arrow-icon">
                        
                    </div>
                    <div class="post-activity-link">
                        <img src="images/like.png">
                        <span>Like</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/comment.png">
                        <span>Comment</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/share.png">
                        <span>Share</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/send.png">
                        <span>Send</span>
                    </div>
                </div>
            </div>



            <div class="post">
                <div class="post-author">
                    <img src="images/user-4.png">
                    <div>
                        <h1>Claire Smith</h1>
                        <small>SDE at Swiggy | Solopreneur</small>
                        <small>2 hours ago </small>
                    </div>
                </div>
                <p>The sucess of every website depends on Search engine optimisation
                    and digital marketing strategy. If you are not in the first page of all major search engines
                    then you are ahead among your competitors.
                </p>
                <img src="images/post-image-2.png"width="100%">
            


                <div class="post-stats">
                    <div>
                        <img src="images/thumbsup.png" >
                        <img src="images/love.png">
                        <img src="images/clap.png">
                        <span class="liked-users">Adam Doe and 89 others</span>
                    </div>
                    <div>
                        <span>22 comments &middot; 40 shares</span>
                    </div>
                </div>
                <div class="post-activity">
                    <div>
                        <img src="<%=usuario.getFoto_perfil()%>" class="post-activity-user-icon">
                        <img src="images/down-arrow.png" class="post-activity-arrow-icon">
                        
                    </div>
                    <div class="post-activity-link">
                        <img src="images/like.png">
                        <span>Like</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/comment.png">
                        <a href="PublicacaoDetalhes.jsp?id=<%=pos.getId()%>"><span>Comment</span></a>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/share.png">
                        <span>Share</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/send.png">
                        <span>Send</span>
                    </div>
                </div>
            </div>


            <div class="post">
                <div class="post-author">
                    <img src="images/user-3.png">
                    <div>
                        <h1>Bejamin Leo</h1>
                        <small>Founder and CEO at Giva | Angel Investor</small>
                        <small>2 hours ago </small>
                    </div>
                </div>
                <p>The sucess of every website depends on Search engine optimisation
                    and digital marketing strategy. If you are not in the first page of all major search engines
                    then you are ahead among your competitors.
                </p>
                <img src="images/post-image-3.png"width="100%">
            


                <div class="post-stats">
                    <div>
                        <img src="images/thumbsup.png" >
                        <img src="images/love.png">
                        <img src="images/clap.png">
                        <span class="liked-users">Adam Doe and 89 others</span>
                    </div>
                    <div>
                        <span>22 comments &middot; 40 shares</span>
                    </div>
                </div>
                <div class="post-activity">
                    <div>
                        <img src="<%=usuario.getFoto_perfil()%>" class="post-activity-user-icon">
                        <img src="images/down-arrow.png" class="post-activity-arrow-icon">
                        
                    </div>
                    <div class="post-activity-link">
                        <img src="images/like.png">
                        <span>Like</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/comment.png">
                        <span>Comment</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/share.png">
                        <span>Share</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/send.png">
                        <span>Send</span>
                    </div>
                </div>
            </div>


            <div class="post">
                <div class="post-author">
                    <img src="images/user-3.png">
                    <div>
                        <h1>Bejamin Leo</h1>
                        <small>Founder and CEO at Giva | Angel Investor</small>
                        <small>2 hours ago </small>
                    </div>
                </div>
                <p>The sucess of every website depends on Search engine optimisation
                    and digital marketing strategy. If you are not in the first page of all major search engines
                    then you are ahead among your competitors.
                </p>
                <img src="images/post-image-4.png"width="100%">
            


                <div class="post-stats">
                    <div>
                        <img src="images/thumbsup.png" >
                        <img src="images/love.png">
                        <img src="images/clap.png">
                        <span class="liked-users">Adam Doe and 89 others</span>
                    </div>
                    <div>
                        <span>22 comments &middot; 40 shares</span>
                    </div>
                </div>
                <div class="post-activity">
                    <div>
                        <img src="<%=usuario.getFoto_perfil()%>" class="post-activity-user-icon">
                        <img src="images/down-arrow.png" class="post-activity-arrow-icon">
                        
                    </div>
                    <div class="post-activity-link">
                        <img src="images/like.png">
                        <span>Like</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/comment.png">
                        <span>Comment</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/share.png">
                        <span>Share</span>
                    </div>
                    <div class="post-activity-link">
                        <img src="images/send.png">
                        <span>Send</span>
                    </div>
                </div>
            </div>
               <%}%>    
        </div>
                       
        <div class="right-sidebar">
            <div class="sidebar-news">
            <img src="images/more.png" class="info-icon">
            <h3>Trending News</h3>

            <a href="#">High Demand for Skilled Employees</a>
            <span>1d ago &middot; 10,934 readers</span>


            <a href="#">Inflation in Canada Affects the Workforce</a>
            <span>2d ago &middot; 7,043 readers</span>


            <a href="#">Mass Recruiters fire Employees</a>
            <span>4d ago &middot; 17,789 readers</span>


            <a href="#">Crypto predicted to Boom this year</a>
            <span>9d ago &middot; 2, 436 readers</span>

            <a href="#" class="read-more-link">Read More</a>


            </div> 

       
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

<script>
    let profileMenu = document.getElementById("profileMenu");

    function toggleMenu(){
        profileMenu.classList.toggle("open-menu");
    }

    let sideActivity = document.getElementById("sidebarActivity");
    let moreLink = document.getElementById("showMoreLink");

    function toggleActivity(){
        sideActivity.classList.toggle("open-activity");
        if (sideActivity.classList.contains("open-activity")) {
            moreLink.innerHTML="Show less <b>-</b>";
            
        }
        else{
            moreLink.innerHTML="Show More <b>+</b>";
        }
    }

</script>
</body>
</html>