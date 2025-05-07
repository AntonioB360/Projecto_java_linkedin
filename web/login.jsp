<%-- 
    Document   : Login
    Created on : 22 de mar. de 2025, 13:55:01
    Author     : Direitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de login</title>
    <link rel="shortcut icon" href="icon/linkedin.png">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div id="container">
        <div id="login-container">
            <div class="logo">
                <a href="index.html"> 
                   
                </a>
                <a href="Loginadm.jsp"> <img src="img/linkedin.png"  width="60" height="50"></a>
            </div> 
        <!--    <h1>Acesso</h1>  -->
        <form action="LoginStatus" method="post">
                <label for="email">E-mail</label>
                <input type="email" name="email" id="email" placeholder="Digite seu e-mail" autocomplete="off">
                <label for="password">Senha</label>
                <input type="password" name="senha" id="password" placeholder="Digite sua senha">
                <select id="id" name="tipo">
                    <option value="usuario">usuario</option>
                    <option value="empresa">empresa</option>
                  
                </select>
                <a href="#" id="forgot-pass">Redefinir senha?</a>
                <input type="submit" value="Entrar">
            </form>
            <div id="social-container">
                <p>Ou entre com suas redes sociais</p>

                <div id="icones-redes-sociais">
                    <a href="#">
                        <img id="facebook" src="icon/facebook2.png">
                    </a>
            
                    <a href="#">
                        <img src="icon/google2.png">
                    </a>

                    <a href="#">
                        <img src="icon/linkedin1.png">
                    </a>
                </div>
                
            </div>
            <div id="register-container">
                <p>Ainda não tem uma conta?</p>
                <a href="Cadastro.jsp">Registrar-se</a>
                <p>Cadastrar-se como Empresa?</p>
                <a href="CadastroEmpresa.jsp">Registrar-se</a>
            </div>
        </div>
    </div>
    <br></br>
    
<!--                     </div> -->
<footer>
    <div id="footer-links">
        <a href="#">Sobre</a>
        <a href="#">Acessibilidade</a>
        <a href="#">Central de Ajuda</a>
        <a href="#">Privacidade e Termos</a>
        <a href="#">Opções de Publicidade</a>
        <a href="#">Carreiras</a>
        <a href="#">Marketing</a>
    </div>
    <p>&copy; 2025 LinkedIn</p>
</footer>
</body>
</html>
