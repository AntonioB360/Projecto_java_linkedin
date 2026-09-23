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
    <title>GLAMVC - Entrar</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/login.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>

<body>
    <div class="login-container">
        <header class="login-header">
            <a href="Loginadm.jsp" class="logo-link">
                <img src="img/linkedin.png" alt="LinkedIn Logo" class="logo-img">
            </a>
            <h1 class="welcome-title">Bem-vindo de volta</h1>
            <p class="welcome-subtitle">Acompanhe o que está acontecendo na sua comunidade profissional</p>
        </header>

        <main class="login-main">
            <form action="LoginStatus" method="post" class="login-form">
                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-input" placeholder="E-mail ou telefone" required>
                </div>
                
                <div class="form-group">
                    <input type="password" name="senha" id="password" class="form-input" placeholder="Senha" required>
                </div>
                
                <div class="form-group">
                    <select id="tipo" name="tipo" class="form-select">
                        <option value="usuario">Usuário</option>
                        <option value="empresa">Empresa</option>
                    </select>
                </div>
                
                <div class="form-options">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Lembrar-me</label>
                    </div>
                    <a href="Recuperar_credencias.jsp" class="forgot-password">Esqueceu a senha?</a>
                </div>
                
                <button type="submit" class="login-button">Entrar</button>
                
                <div class="social-login">
                    <div class="divider">
                        <span class="divider-line"></span>
                        <span class="divider-text">ou</span>
                        <span class="divider-line"></span>
                    </div>
                    
                    <button type="button" class="social-button google-button">
                        <img src="icon/google2.png" alt="Google" class="social-icon">
                        <span>Continuar com Google</span>
                    </button>
                    
                    <button type="button" class="social-button facebook-button">
                        <img src="icon/facebook2.png" alt="Facebook" class="social-icon">
                        <span>Continuar com Facebook</span>
                    </button>
                </div>
            </form>
            
            <div class="register-section">
                <p>Novo na GLAMVC? <a href="Cadastro.jsp" class="register-link">Cadastre-se</a></p>
                <p>Empresa? <a href="CadastroEmpresa.jsp" class="register-link">Cadastre sua empresa</a></p>
            </div>
        </main>
    </div>

    <footer class="login-footer">
        <div class="footer-content">
            <div class="footer-logo">
                <img src="img/linkedin.png" alt="GLAMVC Logo" width="32">
                <span>GLAMVC © 2025</span>
            </div>
            
            <nav class="footer-links">
                <a href="#">Termos de Uso</a>
                <a href="#">Política de Privacidade</a>
                <a href="#">Diretrizes da Comunidade</a>
                <a href="#">Preferências de Cookies</a>
                <a href="#">Ajuda</a>
            </nav>
        </div>
    </footer>
</body>
</html>