<%-- 
    Document   : Erro
    Created on : 01/04/2025, 13:00:24
    Author     : us
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f2ef;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .error-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 400px;
            width: 100%;
        }

        .error-container img {
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
        }

        .error-container h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .error-container p {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }

        .error-container a {
            display: inline-block;
            background-color: #0073b1;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
        }

        .error-container a:hover {
            background-color: #005f8d;
        }
    </style>
</head>

<body>
    <div class="error-container">
        <img src="images/error-icon.png" alt="Erro">
        <h1>Ops! Ocorreu um erro.</h1>
        <p>Algo deu errado. Por favor, tente novamente mais tarde.</p>
        <a href="index.jsp">Voltar para a página inicial</a>
    </div>
</body>

</html>