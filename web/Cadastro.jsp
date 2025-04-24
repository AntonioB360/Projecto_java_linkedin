
                  <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="PT-BR">

<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <link rel="shortcut icon" href="icon/linkedin.png">
    <link rel="stylesheet" href="css/cadastro.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>
    <div class="container">
        <div class="logo">
            <a href="login.jsp">
                <img src="icon/linkedin1.png" width="60" height="50">
            </a>
        </div>
        <div class="title">Cadastro</div>
        <form action="Cadastro"  method="post" enctype="multipart/form-data">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Nome completo</span>
                    <input type="text" placeholder="Nome completo" name="nome" required>
                </div>
                <div class="input-box">
                    <span class="details">email</span>
                    <input type="email" placeholder="endereco de email" name="email" required>
                </div>
                <div class="input-box">
                    <span class="details">Localizacao</span>
                    <input type="text" name="localizacao" placeholder="localizacao" required>
                </div>
                <div class="input-box">
                    <span class="details">empresa</span>
                    <input type="text" name="empresa" placeholder="empresa que frequenta" required>
                </div>
                <div class="input-box">
                    <span class="details">Senha</span>
                    <input type="password"  placeholder="Digite uma senha" name="senha" required>
                </div>
                <div class="input-box">
                    <span class="details">Confirmar senha</span>
                    <input type="password" placeholder="Confirme sua senha" required>
                </div>
            </div>
            <div class="gender-details">
                <span class="gender-title">Genero</span>
                <div class="category">
                    <label for="">
                        <input type="radio" name="select" value="1">
                        <span class="genero">Masculino</span>
                    </label>
                    <label for="">
                        <input type="radio" name="select" value="2">
                        <span class="genero">Feminino</span>
                    </label>
                    <label for="">
                        <input type="radio" name="select" value="3">
                        <span calss="genero">Prefiro não informar</span>
                    </label>
                    <div class="input-box">
                        <span class="details">Resumo</span>
                        <input type="text" id="resumo" name="resumo" required> <br>
                        <input type="hidden" id="id" name="satus" value="activo">
                </div>
                    
                    <hr>
                    <label for="">
                        <input type="checkbox" name="politica" value="checkbox">
                        <span calss="genero">li e aceitos as <a href="#">politicas de privacidade.</a></span>
                    </label>
                </div>

              
            <div class="button">
                <input type="submit" value="Registrar-se">
            </div>
        </form>
    </div>
</body>

</html>