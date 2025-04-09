<%-- 
    Document   : DashbordAdm
    Created on : 08/04/2025, 17:53:59
    Author     : T
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Administração</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="shortcut icon" href="img/linkedin1.png">
    <link rel="stylesheet" href="css/Painel.css"/>

 
</head>
<body>
    <header>
        <h1>Painel de Administração</h1>
    </header>
    <nav>
        <a href="#">Bloquear Contas</a>
        <a href="#">Restringir Acessos</a>
        <a href="#">Publicar no Feed</a>
        <a href="#">Promover Contas</a>
        <a href="listarUsuarios.jsp">Gerenciar Usuários</a>
        <a href="#">Configurações</a>
        <a href="Logout">Sair</a>
    </nav>
    <section>
        <div class="card">
            <h2>Bloquear Contas</h2>
            <div class="icon"><i class="fa-solid fa-user-slash"></i></div>
            <button>Bloquear</button>
        </div>
        <div class="card">
            <h2>Restringir Acessos</h2>
            <div class="icon"><i class="fa-solid fa-user-lock"></i></div>
            <button>Restringir</button>
        </div>
        <div class="card">
            <h2>Publicar no Feed</h2>
            <div class="icon"><i class="fa-solid fa-rss"></i></div>
            <button>Publicar</button>
        </div>
        <div class="card">
            <h2>Promover Contas</h2>
            <div class="icon"><i class="fa-solid fa-user-graduate"></i></div>
            <button>Promover</button>
        </div>
    </section>
</body>
</html>
