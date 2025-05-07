<%-- 
    Document   : CadastroEmpresa
    Created on : 06/04/2025, 21:40:42
    Author     : T
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Empresa - Professional Network</title>
    <link rel="stylesheet" href="css/Empresa.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Cadastre sua Empresa</h1>
            <p>Conecte-se com profissionais talentosos e expanda sua rede</p>
        </header>

        <form id="companyForm" action="CadastroEmpresa" method="POST" novalidate enctype="multipart/form-data">
            <div class="form-grid">
                <!-- Dados Básicos -->
                <div class="form-group">
                    <label for="companyName">Nome da Empresa <span class="required">*</span></label>
                    <input type="text" id="companyName" name="nome" required 
                           placeholder="Ex: Tech Solutions Ltda" autocomplete="organization">
                    
                     <label for="companyEmail">Email da Empresa <span class="required">*</span></label>
                    <input type="text" id="companyEmail" name="email" required 
                           placeholder="Ex: Tech Solutions Ltda" autocomplete="organization">
                    
                     <label for="Credencial">Senha <span class="required">*</span></label>
                     <input type="password" id="id" minlength="8" required placeholder="nova senha" name="senha">
                </div>

                <div class="form-group">
                    <label for="industry">Setor de Atuação <span class="required">*</span></label>
                    <select id="industry" name="setor" required>
                        <option value="">Selecione um setor</option>
                        <option>Tecnologia</option>
                        <option>Finanças</option>
                        <option>Saúde</option>
                        <option>Educação</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="location">Localização <span class="required">*</span></label>
                    <input type="text" id="location" name="localizacao" required 
                           placeholder="Ex: São Paulo, Brasil" autocomplete="address-level2">
                </div>

                <!-- Contato -->
                <div class="form-group">
                    <label for="website">Website Corporativo</label>
                    <input type="url" id="website" name="website" 
                           placeholder="https://www.example.com"
                           pattern="https://.*">
                </div>

                <div class="form-group full-width">
                    <label for="description">Sobre a Empresa</label>
                    <textarea id="description" name="descricao" rows="5"
                              placeholder="Descreva sua empresa, missão e valores"></textarea>
                    <span class="char-counter"><span id="charCount">0</span>/500</span>
                </div>

                <!-- Upload de Logo -->
                <div class="form-group file-upload">
                    <label for="logo">Logotipo (PNG/JPG, máx. 5MB)</label>
                    <input type="file" id="logo" name="logo" 
                           accept="image/png, image/jpeg" 
                           aria-label="Selecione o arquivo do logotipo">
                    <div class="upload-preview" id="logoPreview"></div>
                    <input type="hidden" id="id" name="accao" value="cadastrar">
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn-primary">
                    Completar Cadastro
                </button>
                <p class="terms">
                    Ao cadastrar, você concorda com nossos 
                    <a href="#" target="_blank">Termos de Uso</a> e 
                    <a href="#" target="_blank">Política de Privacidade</a>.
                </p>
            </div>
        </form>
    </div>

    <script src="scripts.js"></script>
</body>
</html>
