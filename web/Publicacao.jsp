<%-- 
    Document   : Publicacao
    Created on : 01/04/2025, 11:57:07
    Author     : us
--%>

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
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicação</title>
    <link rel="stylesheet" href="css/post.css"/>
</head>

<body>
    <main>
        <!-- Informações do usuário -->
        <div class="user-info">
            <img src="<%=usuario.getFoto_perfil() %>" alt="Foto de perfil">
            <h3><%=usuario.getNome() %></h3>
        </div>

        <!-- Formulário de publicação -->
        <form class="post-form" id="postForm" action="Postagem" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id_usuario" value="<%=usuario.getId() %>">
            <textarea name="conteudo" id="conteudo" placeholder="No que você está pensando?"></textarea>
            <label for="foto" class="upload-label">Anexar foto</label>
            <input type="file" name="foto" accept="image/png,image/jpeg">
            
            <div class="preview-container">
                <img id="preview" src="#" alt="pre-visualizacao da foto"/>
            </div>
            <input type="submit" value="Publicar">
        </form>
    </main>

    <script>
        // Captura o formulário
        const postForm = document.getElementById('postForm');

        // Adiciona um evento de envio ao formulário
        postForm.addEventListener('submit', function (event) {
            // Previne o envio padrão do formulário para simular a verificação
            event.preventDefault();

            // Verifica se o campo de texto está vazio
            const conteudo = document.getElementById('conteudo').value.trim();
            if (conteudo === '') {
                alert('Por favor, escreva algo antes de publicar.');
                return;
            }

            // Simula o envio do formulário e exibe uma mensagem de sucesso
            alert('Publicação realizada com sucesso!');
            postForm.submit(); // Envia o formulário após a verificação
            
            
        });
        
        function mostrarPreview(){
                const file=document.getElementById("preview");
                
                if(file){
                    const reader=new FileReader();
                    reader.onload=function(e){
                        preview.src=e.target.result;
                        preview.style.display="block";
                    };
                    
                    reader.readAsDataURL(file);
                }
            }
    </script>
</body>

</html>