<%-- 
    Document   : Vagas_cand
    Created on : 12/04/2025, 10:47:06
    Author     : T
--%>

<%@page import="Model.Vagas_Emprego"%>
<%@page import="java.util.List"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Dao.VagasDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession(false);
    Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("Loginadm.jsp");
        return;
    }

    VagasDao user = new VagasDao();
    List<Vagas_Emprego> lista = user.Listar_vagas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vagas de Emprego</title>
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #0a66c2;
                --secondary-color: #378fe9;
                --dark-gray: #666666;
                --light-gray: #f3f3f3;
                --white: #ffffff;
                --success-color: #2ecc71;
                --danger-color: #e74c3c;
                --border-radius: 8px;
                --box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                background-color: #f9f9f9;
                color: #333;
                line-height: 1.6;
            }
            
            #vagas {
                max-width: 1200px;
                margin: 40px auto;
                padding: 0 20px;
            }
            
            .jobs-content {
                background: var(--white);
                border-radius: var(--border-radius);
                padding: 30px;
                box-shadow: var(--box-shadow);
            }
            
            #vagas h1 {
                color: var(--primary-color);
                margin-bottom: 30px;
                font-size: 28px;
                text-align: center;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            
            .job {
                border: 1px solid #eee;
                border-radius: var(--border-radius);
                padding: 25px;
                margin-bottom: 20px;
                transition: transform 0.3s, box-shadow 0.3s;
                background-color: var(--white);
            }
            
            .job:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }
            
            .job h3 {
                font-size: 22px;
                color: var(--primary-color);
                margin-bottom: 10px;
            }
            
            .job p {
                font-size: 16px;
                margin-bottom: 8px;
                color: var(--dark-gray);
            }
            
            .job p strong {
                color: #333;
                font-weight: 600;
            }
            
            .job-actions {
                margin-top: 20px;
                display: flex;
                justify-content: flex-end;
            }
            
            .btn {
                padding: 10px 20px;
                border-radius: var(--border-radius);
                font-weight: 600;
                cursor: pointer;
                border: none;
                transition: all 0.3s;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }
            
            .btn-primary {
                background-color: var(--primary-color);
                color: var(--white);
            }
            
            .btn-primary:hover {
                background-color: var(--secondary-color);
            }
            
            .btn-success {
                background-color: var(--success-color);
                color: var(--white);
            }
            
            .btn-disabled {
                background-color: var(--light-gray);
                color: var(--dark-gray);
                cursor: not-allowed;
            }
            
            .alert {
                padding: 15px;
                border-radius: var(--border-radius);
                margin-top: 20px;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            
            .alert-success {
                background-color: rgba(46, 204, 113, 0.2);
                color: var(--success-color);
                border: 1px solid var(--success-color);
            }
            
            .toast {
                position: fixed;
                bottom: 30px;
                right: 30px;
                padding: 15px 25px;
                border-radius: var(--border-radius);
                background-color: var(--success-color);
                color: white;
                box-shadow: var(--box-shadow);
                display: flex;
                align-items: center;
                gap: 10px;
                z-index: 1000;
                transform: translateY(100px);
                opacity: 0;
                transition: all 0.3s ease;
            }
            
            .toast.show {
                transform: translateY(0);
                opacity: 1;
            }
            
            .hidden {
                display: none;
            }
            
            @media (max-width: 768px) {
                .job {
                    padding: 15px;
                }
                
                .job-actions {
                    justify-content: center;
                }
                
                .btn {
                    width: 100%;
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>
        <section id="vagas">
            <div class="jobs-content">
                <h1><i class="fas fa-briefcase"></i> Vagas Disponíveis</h1>
                
                <%for(Vagas_Emprego vg: lista){%>
                <div class="job" id="job-<%=vg.getId()%>">
                    <div>
                        <h3><%=vg.getTitulo()%></h3>
                        <p><strong><i class="fas fa-building"></i> Empresa:</strong> <%=vg.getEmpresa()%></p>
                        <p><strong><i class="fas fa-align-left"></i> Descrição:</strong> <%=vg.getDescricao()%></p>
                        <p><strong><i class="fas fa-money-bill-wave"></i> Salário:</strong> <%=vg.getSalario()%></p>
                        <p><strong><i class="fas fa-gift"></i> Benefícios:</strong> <%=vg.getBenefícios()%></p>
                    </div>
                    
                    <div class="job-actions">
                        <form action="Vaga" method="post" class="candidatura-form" data-vaga-id="<%=vg.getId()%>">
                            <input type="hidden" name="vagaid" value="<%=vg.getId()%>">
                            <input type="hidden" name="usuarioid" value="<%=usuario.getId()%>">
                            <input type="hidden" name="acao" value="candidatar">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane"></i> Candidatar-se
                            </button>
                        </form>
                    </div>
                </div>
                <%}%>
            </div>
        </section>
        
        <div id="toast" class="toast hidden">
            <i class="fas fa-check-circle"></i>
            <span id="toast-message"></span>
        </div>
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Verificar se há uma mensagem de sucesso na sessão
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.has('success')) {
                    showToast('Candidatura enviada com sucesso!');
                    
                    // Se houver um ID de vaga, desativar o botão
                    if (urlParams.has('vagaId')) {
                        const vagaId = urlParams.get('vagaId');
                        disableApplyButton(vagaId);
                    }
                }
                
                // Adicionar eventos aos formulários de candidatura
                document.querySelectorAll('.candidatura-form').forEach(form => {
                    form.addEventListener('submit', function(e) {
                        e.preventDefault();
                        const form = this;
                        const vagaId = form.dataset.vagaId;
                        
                        // Enviar o formulário via AJAX
                        fetch(form.action, {
                            method: 'POST',
                            body: new URLSearchParams(new FormData(form)),
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                showToast('Candidatura enviada com sucesso!');
                                disableApplyButton(vagaId);
                                
                                // Atualizar a URL para refletir o sucesso
                                window.history.replaceState(null, null, `?success=true&vagaId=${vagaId}`);
                            } else {
                                showToast('Erro ao enviar candidatura', false);
                            }
                        })
                        .catch(error => {
                            showToast('Erro ao enviar candidatura', false);
                        });
                    });
                });
            });
            
            function disableApplyButton(vagaId) {
                const jobElement = document.getElementById(`job-${vagaId}`);
                if (jobElement) {
                    const form = jobElement.querySelector('.candidatura-form');
                    const button = form.querySelector('button');
                    
                    button.innerHTML = '<i class="fas fa-check"></i> Candidatura enviada';
                    button.classList.remove('btn-primary');
                    button.classList.add('btn-success');
                    button.disabled = true;
                }
            }
            
            function showToast(message, isSuccess = true) {
                const toast = document.getElementById('toast');
                const toastMessage = document.getElementById('toast-message');
                
                toastMessage.textContent = message;
                
                if (isSuccess) {
                    toast.style.backgroundColor = 'var(--success-color)';
                } else {
                    toast.style.backgroundColor = 'var(--danger-color)';
                }
                
                toast.classList.remove('hidden');
                toast.classList.add('show');
                
                setTimeout(() => {
                    toast.classList.remove('show');
                    setTimeout(() => toast.classList.add('hidden'), 300);
                }, 3000);
            }
        </script>
    </body>
</html>