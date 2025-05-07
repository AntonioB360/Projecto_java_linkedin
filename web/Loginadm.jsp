<%-- 
    Document   : Loginadm
    Created on : 08/04/2025, 17:50:57
    Author     : T
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Admin Social</title>
    <link rel="stylesheet" href="css/Adm.css">
    <link rel="shortcut icon" href="img/linkedin1.png">
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="logo">
                <img src="img/rede.jfif" width="160px" alt="Logo da Rede Social">
            </div>
            <form action="LoginStatus" method="post">
                <div class="input-group">
                    <label for="username">Usuário:</label>
                    <input type="text" id="username" name="email" placeholder="Digite seu nome de usuário" required>
                </div>
                <div class="input-group">
                    <label for="password">Senha:</label>
                    <input type="password" id="password" placeholder="Digite sua senha" name="senha" required>
                    <input type="hidden" id="id" name="tipo" value="adm">
                </div>
                <button  type="submit" class="btn">Entrar</button>
            </form>
            <div class="footer-links">
                <a href="#">Esqueceu a senha?</a>
            </div>
        </div>
    </div>
</body>
</html>
