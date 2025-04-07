<%-- 
    Document   : Vagas
    Created on : 06/04/2025, 21:51:51
    Author     : T
--%>

<%@page import="Model.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession(false);
    Empresa empresa = (sessao != null) ? (Empresa) sessao.getAttribute("empresal") : null;
    if (empresa == null) {
        response.sendRedirect("login.jsp");
        return;
    }
   
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Publicação de Vagas</title>
  <link rel="stylesheet" href="css/Vag.css" />
</head>
<body>
  <header>
    <h1>Publicar Vaga</h1>
  </header>

  <!-- Barra de progresso -->
  <div class="progress-container">
    <div class="progress-bar" id="progress-bar"></div>
    <div class="progress-steps">
      <span class="step active">1</span>
      <span class="step">2</span>
      <span class="step">3</span>
    </div>
  </div>

  <main>
      <form id="form-vaga" action="Vaga" method="post">
      <!-- Etapa 1 -->
      <section class="form-step active">
        <h2>Informações da Vaga</h2>
        <label for="titulo">Título da Vaga:</label>
        <input type="text" id="titulo" name="titulo" required>

        <label for="empresa">Nome da Empresa:</label>
        <input type="text" id="empresa" name="empresa" required>

        <label for="localizacao">Localização:</label>
        <input type="text" id="localizacao" name="localizacao" required>

        <label for="descricao">Descrição da Vaga:</label>
        <textarea id="descricao" name="descricao" rows="5" required></textarea>

        <div class="buttons">
          <button type="button" onclick="nextStep()">Próximo</button>
        </div>
      </section>

      <!-- Etapa 2 -->
      <section class="form-step">
        <h2>Detalhes Adicionais</h2>
        <label for="salario">Salário:</label>
        <input type="text" id="salario" name="salario">

        <label for="beneficios">Benefícios:</label>
        <textarea id="beneficios" name="beneficios" rows="3"></textarea>

        <label for="experiencia">Experiência Desejada:</label>
        <input type="text" id="experiencia" name="experiencia">
        <input type="hidden" id="id" name="id" value="<%=empresa.getId()%>">
        <div class="buttons">
          <button type="button" onclick="prevStep()">Voltar</button>
          <button type="button" onclick="nextStep()">Próximo</button>
        </div>
      </section>

      <!-- Etapa 3 -->
      <section class="form-step">
        <h2>Revisar e Salvar</h2>
        <p>Revise as informações da vaga antes de salvar.</p>
        <div class="buttons">
          <button type="button" onclick="prevStep()">Voltar</button>
          <button type="submit">Salvar Vaga</button>
        </div>
      </section>
    </form>
  </main>

  <footer>
    <p>&copy; 2025 Edworking. Todos os direitos reservados.</p>
  </footer>

  <script src="javascript/App.js"></script>
</body>
</html>