<%-- 
    Document   : Vagas_cand
    Created on : 12/04/2025, 10:47:06
    Author     : T
--%>

<%@page import="Model.Vagas_Emprego"%>
<%@page import="java.util.List"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Dao.VagasDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("Loginadm.jsp");
        return;
    }

    
    VagasDao user = new VagasDao();
    
  List<Vagas_Emprego> lista=user.Listar_vagas();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
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

   
         </style>
    </head>
    <body>
         <!-- 4. SEÇÃO VAGAS -->
    <section id="vagas">
      <div class="jobs-content">
        <h1>Vagas Disponíveis</h1>
        <%for(Vagas_Emprego vg: lista){%>
        <div class="job" data-job="Desenvolvedor Full Stack">
          <div>
            <h3><%=vg.getTitulo()%></h3>
            <p><strong>Empresa:</strong><%=vg.getEmpresa()%></p>
            <p><strong>Descricao:</strong><%=vg.getDescricao()%></p>
            <p><strong>Salario:</strong><%=vg.getSalario()%></p>
            <p><strong>Beneficios:</strong><%=vg.getBenefícios()%></p>
          </div>
          <br>
          <button class="btnCandidatar">Candidatar-se</button>
        </div>
         <%}%>
      </div>
    </section>
    </body>
</html>
