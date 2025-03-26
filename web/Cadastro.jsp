<%-- 
    Document   : Cadastro.jsp
    Created on : 25/03/2025, 08:44:07
    Author     : us
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/cadastro.css"/>
    </head>
    <body>

        <img src="imagens/icons/linkedin_2.png" style="height: 40px" alt="alt"/>

        <h1>Aproveite sua vida profisional ao maximo</h1>
        <form action="action">
            <div class="global">



                <!-- <div class="linha-ou">
                    <hr>
                    <span>
                        ou
                    </span>
                    <hr> 
                </div>
                -->


                <div class="esp">
                    <label>E-mail</label>
                    <input type="email" id="id"> <br>

                    <label>Senha(+ de 6 caracteres)</label>
                    <input type="password" id="id" minlength="8" >
                </div>
                <p><input type="checkbox" id="id" name="name" value="r">Lembrar dos meus dados</p>

                <p>Ao clicar em Aceite e cadastre-se ou em continue, Voce aceita o <a href="#">Contrato de usuario</a>, a <a href="#">Politica de privacidade e a <a href="#"> Politicas de Cookies</a>do Linkedin.</a> </p>

                <input type="submit" value="Aceite e cadastre-se">

                <div class="m">
                    <div class="google"> <img src="imagens/icons/google.jpg" alt="alt"/> <a href="#">continue with Google</a> </div>


                </div>
                <p class="te">Ja faz parte do Linkedin? <a href="login.jsp">Entrar</a></p>
            </div>
        </form>

        <p class="te">Gostaria de criar uma pagina para um empresa? <a href="#">Receba ajuda</a></p>

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
