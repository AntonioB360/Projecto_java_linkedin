<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
        <link rel="stylesheet" href="css/cadastro.css">
       
    </head>
    <body>
        <img src="imagens/icons/linkedin_2.png" style="height: 40px" alt="LinkedIn Logo">

        <h1>Aproveite sua vida profissional ao máximo</h1>
        <form action="Cadastro" method="post" enctype="multipart/form-data">
            <div class="global">

                <!-- Etapa 1 -->
               
                    <label for="email">E-mail</label>
                    <input type="email" name="email" id="email" required> <br>

                    <label for="senha">Senha (+ de 6 caracteres)</label>
                    <input type="password" name="senha" id="senha" minlength="6" required>
                    

                <!-- Etapa 2 -->
               
                    <label for="nome">Nome completo</label>
                    <input type="text" id="nome" name="nome" required> <br>

                    <label for="cargo">Cargo</label>
                    <select id="cargo" name="cargo" required>
                        <option value="gerente">Gerente</option>
                        <option value="devops">DevOps</option>
                        <option value="analista">Analista de Dados</option>
                    </select>
                  

                <!-- Etapa 3 -->
              
                    <label for="empresa">Empresa</label>
                    <input type="text" id="empresa" name="empresa" required> <br>

                    <label for="localizacao">Localização</label>
                    <input type="text" id="localizacao" name="localizacao" required> <br>
                   

                <!-- Etapa 4 -->
               
                    <label for="resumo">Resumo</label>
                    <input type="text" id="resumo" name="resumo" required> <br>

                    <label for="foto">Foto Perfil</label>
                    <input type="file" id="fot" name="foto" accept="image/*" >

                    <input type="submit" value="Aceite e cadastre-se">
              
            </div>

            <p><input type="checkbox" id="lembrar" name="lembrar" value="sim"> Lembrar dos meus dados</p>

            <p>
                Ao clicar em Aceite e cadastre-se ou em continue, você aceita o 
                <a href="#">Contrato de usuário</a>, a 
                <a href="#">Política de privacidade</a> e as 
                <a href="#">Políticas de Cookies</a> do LinkedIn.
            </p>

            <div class="m">
                <div class="google">
                    <img src="imagens/icons/google.jpg" alt="Google Logo">
                    <a href="#">Continue com Google</a>
                </div>
            </div>
            <p class="te">Já faz parte do LinkedIn? <a href="login.jsp">Entrar</a></p>
        </form>

        <p class="te">Gostaria de criar uma página para uma empresa? <a href="#">Receba ajuda</a></p>

        <footer>
            &COPY;2025 
            <ul>
                <li><a href="#">Contrato de usuário</a></li>
                <li><a href="#">Política de Privacidade do LinkedIn</a></li>
                <li><a href="#">Diretrizes da comunidade</a></li>
                <li><a href="#">Políticas de Cookies</a></li>
                <li><a href="#">Política de direitos autorais</a></li>
                <li><a href="#">Enviar feedback</a></li>
            </ul>
            <select id="idioma">
                <option value="">Idioma</option>
                <option value="pt">Português</option>
                <option value="en">Inglês</option>
            </select>
        </footer>
         <script src="js/cadastro.js"></script>
    </body>
</html>