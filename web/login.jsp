<%-- 
    Document   : Login
    Created on : 22 de mar. de 2025, 13:55:01
    Author     : Direitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entrar ou cadastrar-se no LinkedIn</title>
        <link rel="stylesheet" href="css/login.css"/>
        <link rel="shortcut icon" href="imagens/icons/linkedin.png" type="image/x-icon">
    </head>
    <body>

        <img src="imagens/icons/linkedin_2.png" style="height: 40px" alt="alt"/>
        <form action="Login" method="post">
            <div class="global">
                <h1>Entrar</h1>
                <div class="m">
                    <div class="google"> <img src="imagens/icons/google.jpg" alt="alt"/> <a href="#">continue with Google</a> </div>

                    <div class="apple" style="margin-top: 14px"> <img src="imagens/icons/apple.jpg" alt="alt"/> <a href="#">Entrar com a apple</a> </div>
                </div>
                
                <!-- <div class="linha-ou">
                    <hr>
                    <span>
                        ou
                    </span>
                    <hr> 
                </div>
-->
               
  
<input type="text" id="id" name="email" placeholder="E-mail ou telefone">

                <input type="password" id="id" minlength="8"  name="senha"  placeholder="Senha">
                <a href="#">Esqueceu a senha?</a>
                <p><input type="checkbox" id="id"value="r"> Me mantenha na conta</p>


                <input type="submit" value="Entrar">

            </div>
        </form>

        <p class="te">Ainda faz parte do Linkedin <a href="Cadastro.jsp">cadastre-se agora</a></p>

        <footer>
            &COPY;2025 <li>contrato de usuario</li>
            <li>Politica de Privacidade do LinkedIn</li>
            <li>Diretrizes da comunidade</li>
            <li>Politicas de Cookies</li>
            <li>Politica de direitos Autorais</li>
            <li>Enviar feedback</li>
            <select id="id">
                <option value="">Idioma</option>
                <option value="second">Portugues</option>
                <option value="third">Engles</option>
            </select>


        </footer>









    </body>
</html>
