<%-- 
    Document   : Premiun.jsp
    Created on : 31/03/2025, 19:21:29
    Author     : us
--%>

<%@page import="Model.Usuario"%>
<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GLAMVC Premium - Página Principal</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <style>
    /* RESET E CONFIGURAÇÕES GLOBAIS */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: 'Roboto', Arial, sans-serif;
      background: #f3f3f3;
      color: #333;
      line-height: 1.6;
      scroll-behavior: smooth;
    }
    /* CABEÇALHO FIXO */
    header {
      background: #fff;
      border-bottom: 1px solid #ddd;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 1000;
      padding: 10px 20px;
    }
    .container {
      width: 90%;
      max-width: 1200px;
      margin: auto;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .logo {
      font-size: 24px;
      font-weight: bold;
      color: #0073b1;
    }
    nav ul {
      list-style: none;
      display: flex;
      flex-wrap: wrap;
    }
    nav ul li { margin: 0 10px; }
    nav ul li a {
      text-decoration: none;
      color: #333;
      font-weight: 500;
      transition: color 0.3s;
    }
    nav ul li a:hover { color: #0073b1; }
    /* MAIN – COMPENSA O CABEÇALHO FIXO */
    main { margin-top: 70px; }
    section { padding: 60px 20px; min-height: 100vh; }
    
    /* 1. SEÇÃO INÍCIO – HERO E TABELA DE PLANOS */
    #inicio .hero {
      background: url('https://via.placeholder.com/1200x400') no-repeat center/cover;
      height: 400px;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }
    #inicio .hero-content {
      background: rgba(0, 0, 0, 0.6);
      padding: 20px;
      border-radius: 5px;
    }
    #inicio .hero-content h1 {
      font-size: 36px;
      color: #fff;
      margin-bottom: 10px;
    }
    #inicio .hero-content p {
      font-size: 18px;
      color: #ddd;
      margin-bottom: 20px;
    }
    #inicio .hero-content button {
      background: #ffc107;
      color: #333;
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 25px;
      cursor: pointer;
      transition: background 0.3s;
    }
    #inicio .hero-content button:hover { background: #e0a800; }
    /* Tabela Comparativa de Planos */
    #inicio .plan-table {
      width: 100%;
      max-width: 1200px;
      margin: 40px auto 0 auto;
      border-collapse: collapse;
      text-align: center;
    }
    #inicio .plan-table th,
    #inicio .plan-table td {
      border: 1px solid #ddd;
      padding: 15px;
    }
    #inicio .plan-table th {
      background: #0073b1;
      color: #fff;
      font-size: 18px;
    }
    #inicio .plan-table td ul { list-style: none; padding: 0; }
    #inicio .plan-table td ul li { margin: 5px 0; }
    
    /* 2. SEÇÃO SOBRE – BENEFÍCIOS (GLAMVC PREMIUM) */
    #sobre .sobre-content {
      max-width: 1000px;
      margin: 2rem auto;
      padding: 1rem;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    #sobre h1 {
      text-align: center;
      color: #0077b5;
      margin-bottom: 20px;
    }
    #sobre h2 { 
      color: #0077b5;
      margin-top: 20px;
    }
    #sobre p { font-size: 16px; margin-bottom: 1rem; }
    #sobre ul { padding-left: 1.5rem; }
    #sobre li { margin-bottom: 0.5rem; }
    #sobre table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1rem;
    }
    #sobre th, #sobre td {
      border: 1px solid #ccc;
      padding: 0.5rem;
      text-align: left;
    }
    #sobre th { background-color: #e6f2f8; }
    
    /* 3. SEÇÃO PREMIUM – BENEFÍCIOS, ASSINATURA E PAGAMENTO */
    #premium .premium-content {
      background: #fff;
      border-radius: 5px;
      max-width: 1200px;
      margin: 40px auto;
      padding: 40px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    #premium h1 { font-size: 32px; color: #0073b1; margin-bottom: 20px; }
    #premium p,
    #premium ul {
      font-size: 18px;
      margin-bottom: 20px;
      line-height: 1.6;
    }
    #premium ul { list-style: disc inside; }
    #premium button {
      background: #ffc107;
      color: #333;
      border: none;
      border-radius: 25px;
      padding: 10px 20px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s;
    }
    #premium button:hover { background: #e0a800; }
    /* Formulário de Assinatura e Pagamento (oculto inicialmente) */
    #subscription-form {
      display: none;
      margin-top: 30px;
    }
    #subscription-form label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    #subscription-form input {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    #subscription-form button {
      background: #0073b1;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s;
    }
    #subscription-form button:hover { background: #005580; }
    /* Campos para Cartão de Crédito (exibidos se selecionado) */
    #credit-card-details {
      display: block;
      margin-bottom: 15px;
    }
    
    /* 4. SEÇÃO VAGAS – LISTA DE VAGAS E MODAL */
    #vagas .jobs-content {
      background: #fff;
      border-radius: 5px;
      max-width: 1200px;
      margin: 40px auto;
      padding: 40px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    #vagas h1 { color: #0073b1; margin-bottom: 20px; font-size: 28px; }
    #vagas .job {
      border-bottom: 1px solid #ddd;
      padding: 15px 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    #vagas .job:last-child { border-bottom: none; }
    #vagas .job h3 { font-size: 20px; color: #0073b1; margin-bottom: 5px; }
    #vagas .job p { font-size: 16px; }
    #vagas .job button {
      background: #0073b1;
      color: #fff;
      border: none;
      padding: 8px 15px;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
    }
    #vagas .job button:hover { background: #005580; }
    /* Modal para candidatura a vaga */
    .modal {
      display: none;
      position: fixed;
      z-index: 2000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.6);
      align-items: center;
      justify-content: center;
      padding: 20px;
    }
    .modal-content {
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      width: 90%;
      max-width: 500px;
      position: relative;
    }
    .modal-close {
      position: absolute;
      top: 10px;
      right: 15px;
      font-size: 28px;
      color: #aaa;
      cursor: pointer;
    }
    .modal-close:hover { color: #333; }
    
    /* 5. SEÇÃO MENSAGENS – BATE-PAPO */
    #mensagens .messages-content {
      background: #fff;
      border-radius: 5px;
      max-width: 800px;
      margin: 40px auto;
      padding: 40px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    #mensagens h1 { color: #0073b1; margin-bottom: 20px; font-size: 28px; }
    #mensagens .message-container {
      max-height: 400px;
      overflow-y: auto;
      margin-bottom: 20px;
    }
    #mensagens .message {
      background: #f7f9fc;
      border-radius: 10px;
      padding: 10px 15px;
      margin-bottom: 10px;
      font-size: 16px;
    }
    #mensagens .input-container {
      display: flex;
    }
    #mensagens .input-container input {
      flex: 1;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
    }
    #mensagens .input-container button {
      background: #0073b1;
      color: #fff;
      border: none;
      padding: 10px 20px;
      margin-left: 10px;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
    }
    #mensagens .input-container button:hover { background: #005580; }
    
    /* 6. SEÇÃO MINHA REDE – CONEXÕES */
    #minharede .network-content {
      background: #fff;
      border-radius: 5px;
      max-width: 800px;
      margin: 40px auto;
      padding: 40px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    #minharede h1 { color: #0073b1; margin-bottom: 20px; font-size: 28px; }
    #minharede .connection {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px;
      border-bottom: 1px solid #ddd;
    }
    #minharede .connection:last-child { border-bottom: none; }
    #minharede .connection p { font-size: 16px; }
    #minharede .connection button {
      background: #0073b1;
      color: #fff;
      border: none;
      padding: 8px 15px;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
    }
    #minharede .connection button:hover { background: #005580; }
    
    /* 7. SEÇÃO NOTIFICAÇÕES */
    #notificacoes .notification-content {
      background: #fff;
      border-radius: 5px;
      max-width: 800px;
      margin: 40px auto;
      padding: 40px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    #notificacoes h1 { color: #0073b1; margin-bottom: 20px; font-size: 28px; }
    #notificacoes .notification {
      background: #f9f9f9;
      border-left: 5px solid #0073b1;
      padding: 15px 20px;
      margin-bottom: 10px;
      position: relative;
      font-size: 16px;
    }
    #notificacoes .notification .notification-close {
      position: absolute;
      top: 10px;
      right: 10px;
      cursor: pointer;
      font-size: 18px;
      color: #999;
    }
    #notificacoes .notification .notification-close:hover { color: #333; }
    
    /* 8. SEÇÃO COBRANÇA E SEGURANÇA */
    #cobranca {
      background: #fff;
      border-radius: 5px;
      max-width: 800px;
      margin: 40px auto;
      padding: 40px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    #cobranca h1 { color: #0073b1; margin-bottom: 20px; font-size: 28px; }
    #cobranca ul { list-style: disc; margin-left: 20px; margin-bottom: 20px; }
    #cobranca li { margin-bottom: 10px; font-size: 16px; }
    #cobranca p { font-size: 16px; }
    
    /* RODAPÉ */
    footer {
      background: #333;
      color: #fff;
      padding: 20px 0;
      text-align: center;
    }
    footer ul {
      list-style: none;
      display: flex;
      justify-content: center;
      margin-bottom: 10px;
    }
    footer ul li { margin: 0 10px; }
    footer ul li a {
      color: #fff;
      text-decoration: none;
      transition: color 0.3s;
    }
    footer ul li a:hover { color: #ffc107; }
    footer p { font-size: 14px; }
    
    /* RESPONSIVIDADE */
    @media (max-width: 768px) {
      nav ul { flex-direction: column; align-items: center; }
      nav ul li { margin: 5px 0; }
      #inicio .hero-content h1 { font-size: 28px; }
      #inicio .hero-content p { font-size: 16px; }
    }
  </style>
</head>
<body>
  <!-- CABEÇALHO -->
  <header>
    <div class="container">
      <div class="logo">GLAMVC</div>
      <nav>
        <ul>

          <li><a href="#sobre">Sobre</a></li>
     
          <li><a href="#cobranca">Cobrança e Segurança</a></li>
        </ul>
      </nav>
    </div>
  </header>
  
  <main>
    <!-- 1. SEÇÃO INÍCIO -->
    <section id="inicio">
      <div class="hero">
        <div class="hero-content">
          <h1>Descubra um novo mundo de oportunidades</h1>
          <p>Transforme sua carreira com o GLAMVC Premium. Obtenha insights exclusivos e expanda seu networking.</p>
          <button onclick="document.getElementById('premium').scrollIntoView({ behavior: 'smooth' })">
            Torne-se Premium
          </button>
        </div>
      </div>
      <!-- Tabela Comparativa de Planos -->
      <table class="plan-table">
        <tr>
          <th>Carreira</th>
          <th>Negócio</th>
          <th>Recrutador</th>
        </tr>
        <tr>
          <td>
            <ul>
              <li>Perfil Destacado</li>
              <li>Insights de candidatura</li>
              <li>Acesso limitado a InMail</li>
            </ul>
          </td>
          <td>
            <ul>
              <li>Análises Avançadas</li>
              <li>Ferramenta de Busca Aprimorada</li>
              <li>Mensagens Ilimitadas</li>
            </ul>
          </td>
          <td>
            <ul>
              <li>Recrutamento Inteligente</li>
              <li>Filtros Personalizados</li>
              <li>Acesso Total a Candidatos</li>
            </ul>
          </td>
        </tr>
      </table>
    </section>
    
    <!-- 2. SEÇÃO SOBRE -->
    <section id="sobre">
      <div class="sobre-content">
        <h1>GLAMVC Premium: Conta Individual, Empresarial e Recrutador</h1>
        <h2>✅ O que é o GLAMVC Premium?</h2>
        <p>O GLAMVC Premium é a versão paga do GLAMVC com funcionalidades exclusivas para profissionais e empresas que desejam melhorar sua visibilidade e networking.</p>
        <h2>👤 GLAMVC Premium Carreira (Conta Individual)</h2>
        <ul>
          <li>Acesso completo a quem viu seu perfil (últimos 90 dias)</li>
          <li>5 mensagens InMail por mês</li>
          <li>Acesso a mais de 20.000 cursos do GLAMVC Learning</li>
          <li>Insights sobre vagas e concorrentes</li>
          <li>Maior visibilidade para recrutadores</li>
        </ul>
        <h2>🏢 GLAMVC Premium Negócio (Conta Empresarial)</h2>
        <ul>
          <li>30 mensagens InMail por mês</li>
          <li>Visualização ilimitada de perfis fora da rede</li>
          <li>Business Insights sobre empresas e mercados</li>
          <li>Estatísticas detalhadas sobre desempenho de perfil e marca</li>
          <li>Inclui acesso ao GLAMVC Learning</li>
        </ul>
        <h2>🔍 GLAMVC Recrutador Lite (Conta de Recrutador)</h2>
        <ul>
          <li>Mais de 30 InMails por mês</li>
          <li>Ferramentas avançadas de busca de talentos</li>
          <li>Filtros de recrutamento avançado</li>
          <li>Pastas de projetos para gerenciar candidatos</li>
          <li>Recomendações automáticas de perfis</li>
        </ul>
        <h2>📊 Comparação entre Contas</h2>
        <table>
          <tr>
            <th>Funcionalidade</th>
            <th>Gratuita</th>
            <th>Premium Carreira</th>
            <th>Premium Negócio</th>
            <th>Recrutador Lite</th>
          </tr>
          <tr>
            <td>Quem viu seu perfil</td>
            <td>Parcial</td>
            <td>Completo</td>
            <td>Completo</td>
            <td>Completo</td>
          </tr>
          <tr>
            <td>Mensagens InMail</td>
            <td>Não</td>
            <td>5/mês</td>
            <td>30/mês</td>
            <td>30+/mês</td>
          </tr>
          <tr>
            <td>GLAMVC Learning</td>
            <td>Não</td>
            <td>Sim</td>
            <td>Sim</td>
            <td>Não</td>
          </tr>
          <tr>
            <td>Visualização de perfis</td>
            <td>Limitada</td>
            <td>Parcial</td>
            <td>Ilimitada</td>
            <td>Ilimitada</td>
          </tr>
          <tr>
            <td>Insights empresariais</td>
            <td>Não</td>
            <td>Não</td>
            <td>Sim</td>
            <td>Sim</td>
          </tr>
          <tr>
            <td>Ferramentas de Recrutamento</td>
            <td>Não</td>
            <td>Não</td>
            <td>Limitadas</td>
            <td>Avançadas</td>
          </tr>
        </table>
      
    </section>
    
    <!-- 3. SEÇÃO PREMIUM – ASSINATURA E PAGAMENTO -->
    <section id="premium">
      <div class="premium-content">
        <h1>GLAMVC Premium</h1>
        <p>Assine hoje e tenha acesso a recursos exclusivos:</p>
        <ul>
          <li>Visualize quem visitou seu perfil</li>
          <li>Insights detalhados sobre vagas e empresas</li>
          <li>InMails ilimitados para recrutadores e conexões</li>
          <li>Prioridade em recrutamento e networking</li>
        </ul>
        <p>Potencialize seu networking e impulsione sua carreira!</p>
        <button onclick="document.getElementById('subscription-form').style.display='block'">
          Assinar Agora
        </button>
        <!-- Formulário de Assinatura e Pagamento -->
        <div id="subscription-form">
          <h2>Formulário de Assinatura e Pagamento</h2>
          
          <h3 style="color: red">Lamentamos de momento o servico Premiun nao esta disponivel</h3>
                  </div>
      </div>
    </section>
    

  
  <!-- RODAPÉ -->
  <footer>
    <ul>
      <li><a href="#">Ajuda</a></li>
      <li><a href="#">Sobre</a></li>
      <li><a href="#">Termos</a></li>
      <li><a href="#">Privacidade</a></li>
    </ul>
    <p>&copy; 2025 GLAMVC Corporation. Todos os direitos reservados.</p>
  </footer>
  
  <!-- SCRIPTS DE FUNCIONALIDADES -->
  <script src="javascript/Premiun.js">
   
  </script>
</body>
</html>