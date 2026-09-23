<%-- 
    Document   : Listar_vagas_Empressas
    Created on : 07/05/2025, 13:58:29
    Author     : T
--%>


<%@page import="Model.Vagas_Emprego"%>
<%@page import="java.util.List"%>
<%@page import="Model.Dao.VagasDao"%>
<%@page import="Model.Empresa"%>

<%
    HttpSession sessao = request.getSession(false);
    Empresa empresa = (sessao != null) ? (Empresa) sessao.getAttribute("empresal") : null;
    if (empresa == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    VagasDao user = new VagasDao();

    List<Vagas_Emprego> lista = user.Listar_vagas_empresa(empresa.getId());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <title>Minhas Vagas - Empresa</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f3f2ef;
            }

            header {
                background-color: #283e4a;
                color: white;
                padding: 16px;
                text-align: center;
            }

            .container {
                max-width: 1000px;
                margin: auto;
                padding: 20px;
            }

            .vaga-card {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
                padding: 20px;
                margin-bottom: 20px;
            }

            .vaga-titulo {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 8px;
            }

            .vaga-info {
                font-size: 14px;
                color: #666;
                margin-bottom: 12px;
            }

            .vaga-acoes button {
                background-color: #0a66c2;
                color: white;
                padding: 8px 12px;
                border: none;
                border-radius: 5px;
                margin-right: 10px;
                cursor: pointer;
            }

            .vaga-acoes button:hover {
                background-color: #004182;
            }

            /* Modal */
            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                justify-content: center;
                align-items: center;
            }

            .modal-content {
                background: white;
                padding: 20px;
                border-radius: 10px;
                width: 300px;
                position: relative;
            }

            .modal-content label {
                display: block;
                margin: 10px 0 5px;
            }

            .modal-content input {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
            }

            .close-btn {
                position: absolute;
                right: 10px;
                top: 10px;
                font-size: 18px;
                cursor: pointer;
                color: #aaa;
            }

            .close-btn:hover {
                color: black;
            }

            .salvar-btn {
                background-color: #0a66c2;
                color: white;
                border: none;
                padding: 10px;
                width: 100%;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <header>
            <h1>Minhas Vagas Publicadas</h1>
        </header>

        <%for (Vagas_Emprego vg : lista) {%>
        <div class="container">
            <div class="vaga-card" data-id="1">
                <div class="vaga-titulo"><%=vg.getTitulo()%></div> 
                <div class="vaga-info">Local: <%=vg.getLocalizacao()%></div>
                <div class="vaga-info">Descricao: <%=vg.getDescricao()%></div>
                <div class="vaga-info">Experiencia: <%=vg.getExperiencia()%></div>
                <div class="vaga-acoes">
                    <button onclick="abrirModal(this)">Editar</button>
         
                   <a href="Candidatura_Status?id_vaga=<%=vg.getId()%>"><button>Ver Candidatos</button></a>

                    
                   <form action="Vaga" method="post">

                      
                        <input type="hidden" name="id_vagas" value="<%=vg.getId()%>">
                        <input type="hidden" name="acao" value="eliminar">
                      
                       <button type="submit">Remover</button>

                    </form>
                   
                </div>
            </div>


        </div>
        <%}%>
        <!-- Modal -->
        <div class="modal" id="editModal">
            <div class="modal-content">
                <span class="close-btn" onclick="fecharModal()">&times;</span>
                <h3>Editar Vaga</h3>
                <label for="tituloInput">Título</label>
                <input type="text" id="tituloInput" />
                <label for="localInput">Local</label>
                <input type="text" id="localInput" />
                <button class="salvar-btn" onclick="salvarEdicao()">Salvar</button>
            </div>
        </div>

        <script>
            let vagaAtual = null;

            function abrirModal(botao) {
                const vagaCard = botao.closest('.vaga-card');
                vagaAtual = vagaCard;

                const titulo = vagaCard.querySelector('.vaga-titulo').innerText;
                const local = vagaCard.querySelector('.vaga-info').innerText.replace("Local: ", "");

                document.getElementById('tituloInput').value = titulo;
                document.getElementById('localInput').value = local;

                document.getElementById('editModal').style.display = 'flex';
            }

            function fecharModal() {
                document.getElementById('editModal').style.display = 'none';
            }

            function salvarEdicao() {
                const novoTitulo = document.getElementById('tituloInput').value;
                const novoLocal = document.getElementById('localInput').value;

                if (vagaAtual) {
                    vagaAtual.querySelector('.vaga-titulo').innerText = novoTitulo;
                    vagaAtual.querySelector('.vaga-info').innerText = `Local: ${novoLocal}`;
                }

                fecharModal();
            }
        </script>

    </body>
</html>

