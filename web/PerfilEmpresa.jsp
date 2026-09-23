<%-- 
    Document   : PerfilEmpresa
    Created on : 07/04/2025, 11:20:58
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
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil da Empresa | LinkedIn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #0a66c2;
            --secondary-color: #ffffff;
            --text-color: #000000e6;
            --gray-light: #eef3f8;
            --gray-medium: #dce6f1;
            --gray-dark: #666666;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--gray-light);
            color: var(--text-color);
        }
        
        .container {
            max-width: 1128px;
            margin: 0 auto;
            padding: 20px;
        }
        
        /* Header */
        .header {
            background-color: var(--secondary-color);
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-color);
        }
        
        /* Main Content */
        .profile-container {
            display: flex;
            gap: 24px;
            margin-top: 20px;
        }
        
        /* Left Column */
        .left-column {
            flex: 1;
        }
        
        /* Company Card */
        .company-card {
            background-color: var(--secondary-color);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
            margin-bottom: 16px;
            position: relative;
        }
        
        .company-banner {
            height: 120px;
            background-color: var(--primary-color);
        }
        
        .company-logo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid var(--secondary-color);
            position: absolute;
            top: 80px;
            left: 20px;
            background-color: var(--secondary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            color: var(--primary-color);
        }
        
        .company-info {
            padding: 60px 20px 20px;
        }
        
        .company-name {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .company-headline {
            color: var(--gray-dark);
            margin-bottom: 15px;
        }
        
        .company-stats {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
            color: var(--gray-dark);
            font-size: 14px;
        }
        
        .company-website {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 15px;
            display: block;
        }
        
        .edit-btn {
            width: 100%;
            padding: 8px;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
            background-color: transparent;
            border-radius: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .edit-btn:hover {
            background-color: #e2f0fe;
            border-width: 2px;
        }
        
        /* About Card */
        .about-card, .posts-card {
            background-color: var(--secondary-color);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
            margin-bottom: 16px;
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .card-title {
            font-size: 18px;
            font-weight: 600;
        }
        
        .edit-icon {
            color: var(--gray-dark);
            cursor: pointer;
        }
        
        .about-content {
            line-height: 1.5;
        }
        
        /* Right Column */
        .right-column {
            width: 300px;
        }
        
        .people-card {
            background-color: var(--secondary-color);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
            margin-bottom: 16px;
        }
        
        .people-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-top: 15px;
        }
        
        .person {
            text-align: center;
        }
        
        .person-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--gray-medium);
            margin: 0 auto 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
        }
        
        .person-name {
            font-size: 13px;
            font-weight: 600;
        }
        
        .person-title {
            font-size: 12px;
            color: var(--gray-dark);
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
            z-index: 200;
            justify-content: center;
            align-items: center;
        }
        
        .modal-content {
            background-color: var(--secondary-color);
            width: 80%;
            max-width: 700px;
            border-radius: 10px;
            overflow: hidden;
            max-height: 90vh;
            overflow-y: auto;
        }
        
        .modal-header {
            padding: 15px 20px;
            border-bottom: 1px solid var(--gray-medium);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .modal-title {
            font-size: 20px;
            font-weight: 600;
        }
        
        .close-btn {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: var(--gray-dark);
        }
        
        .modal-body {
            padding: 20px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }
        
        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--gray-dark);
            border-radius: 5px;
            font-size: 14px;
        }
        
        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid var(--gray-medium);
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        .btn {
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            border: none;
        }
        
        .btn-secondary {
            background-color: transparent;
            border: 1px solid var(--gray-dark);
            color: var(--gray-dark);
        }
        
        @media (max-width: 768px) {
            .profile-container {
                flex-direction: column;
            }
            
            .right-column {
                width: 100%;
            }
            
            .modal-content {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <nav class="navbar">
                <div class="logo">LinkedIn</div>
                <div>
                    <i class="fas fa-search"></i>
                </div>
            </nav>
        </div>
    </header>
    
    <!-- Main Content -->
    <main class="container">
        <div class="profile-container">
            <!-- Left Column -->
            <div class="left-column">
                <!-- Company Card -->
                <div class="company-card">
                    <div class="company-banner"></div>
                    <div class="company-logo">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="company-info">
                        <h1 class="company-name">Nome da Empresa</h1>
                        <p class="company-headline">Indústria • Tamanho da empresa • Localização</p>
                        <div class="company-stats">
                            <span><strong>200</strong> seguidores</span>
                            <span><strong>50</strong> funcionários</span>
                        </div>
                        <a href="#" class="company-website">www.empresa.com</a>
                        <button class="edit-btn" id="openEditProfileModal">
                            <i class="fas fa-pencil-alt"></i> Editar perfil
                        </button>
                    </div>
                </div>
                
                <!-- About Card -->
                <div class="about-card">
                    <div class="card-header">
                        <h2 class="card-title">Sobre</h2>
                        <i class="fas fa-pencil-alt edit-icon" id="openAboutModal"></i>
                    </div>
                    <div class="about-content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in dui mauris. Vivamus hendrerit arcu sed erat molestie vehicula. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor.</p>
                        <p>Suspendisse potenti. Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est.</p>
                    </div>
                </div>
                
                <!-- Posts Card -->
                <div class="posts-card">
                    <div class="card-header">
                        <h2 class="card-title">Publicações</h2>
                    </div>
                    <p>Nenhuma publicação ainda.</p>
                </div>
            </div>
            
            <!-- Right Column -->
            <div class="right-column">
                <!-- People Card -->
                <div class="people-card">
                    <div class="card-header">
                        <h2 class="card-title">Pessoas</h2>
                    </div>
                    <div class="people-grid">
                        <div class="person">
                            <div class="person-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="person-name">João Silva</div>
                            <div class="person-title">CEO</div>
                        </div>
                        <div class="person">
                            <div class="person-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="person-name">Maria Souza</div>
                            <div class="person-title">Diretora</div>
                        </div>
                        <div class="person">
                            <div class="person-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="person-name">Carlos Oliveira</div>
                            <div class="person-title">Gerente</div>
                        </div>
                        <div class="person">
                            <div class="person-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="person-name">Ana Costa</div>
                            <div class="person-title">Supervisora</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Edit Profile Modal -->
    <div class="modal" id="editProfileModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Editar perfil da empresa</h3>
                <button class="close-btn" id="closeEditProfileModal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="companyProfileForm">
                    <div class="form-group">
                        <label for="companyName">Nome da empresa</label>
                        <input type="text" id="companyName" value="Nome da Empresa">
                    </div>
                    
                    <div class="form-group">
                        <label for="companyIndustry">Indústria</label>
                        <select id="companyIndustry">
                            <option>Tecnologia</option>
                            <option>Finanças</option>
                            <option>Saúde</option>
                            <option>Educação</option>
                            <option>Varejo</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="companySize">Tamanho da empresa</label>
                        <select id="companySize">
                            <option>1-10 funcionários</option>
                            <option>11-50 funcionários</option>
                            <option>51-200 funcionários</option>
                            <option>201-500 funcionários</option>
                            <option>501-1000 funcionários</option>
                            <option>1001-5000 funcionários</option>
                            <option>5001+ funcionários</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="companyLocation">Localização</label>
                        <input type="text" id="companyLocation" value="São Paulo, Brasil">
                    </div>
                    
                    <div class="form-group">
                        <label for="companyWebsite">Website</label>
                        <input type="url" id="companyWebsite" value="www.empresa.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="companyDescription">Descrição</label>
                        <textarea id="companyDescription">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in dui mauris. Vivamus hendrerit arcu sed erat molestie vehicula. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor.</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="cancelEditProfile">Cancelar</button>
                <button class="btn btn-primary" id="saveProfile">Salvar</button>
            </div>
        </div>
    </div>
    
    <!-- Edit About Modal -->
    <div class="modal" id="editAboutModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Editar seção Sobre</h3>
                <button class="close-btn" id="closeAboutModal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="aboutForm">
                    <div class="form-group">
                        <label for="aboutText">Sobre a empresa</label>
                        <textarea id="aboutText">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in dui mauris. Vivamus hendrerit arcu sed erat molestie vehicula. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor.

Suspendisse potenti. Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est.</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="cancelAboutEdit">Cancelar</button>
                <button class="btn btn-primary" id="saveAbout">Salvar</button>
            </div>
        </div>
    </div>
    
    <script>
        // Modal de edição do perfil
        const editProfileModal = document.getElementById('editProfileModal');
        const openEditProfileModal = document.getElementById('openEditProfileModal');
        const closeEditProfileModal = document.getElementById('closeEditProfileModal');
        const cancelEditProfile = document.getElementById('cancelEditProfile');
        
        openEditProfileModal.addEventListener('click', () => {
            editProfileModal.style.display = 'flex';
        });
        
        closeEditProfileModal.addEventListener('click', () => {
            editProfileModal.style.display = 'none';
        });
        
        cancelEditProfile.addEventListener('click', () => {
            editProfileModal.style.display = 'none';
        });
        
        // Modal de edição do Sobre
        const editAboutModal = document.getElementById('editAboutModal');
        const openAboutModal = document.getElementById('openAboutModal');
        const closeAboutModal = document.getElementById('closeAboutModal');
        const cancelAboutEdit = document.getElementById('cancelAboutEdit');
        
        openAboutModal.addEventListener('click', () => {
            editAboutModal.style.display = 'flex';
        });
        
        closeAboutModal.addEventListener('click', () => {
            editAboutModal.style.display = 'none';
        });
        
        cancelAboutEdit.addEventListener('click', () => {
            editAboutModal.style.display = 'none';
        });
        
        // Fechar modais clicando fora do conteúdo
        window.addEventListener('click', (event) => {
            if (event.target === editProfileModal) {
                editProfileModal.style.display = 'none';
            }
            if (event.target === editAboutModal) {
                editAboutModal.style.display = 'none';
            }
        });
        
        // Salvar dados (simulação)
        document.getElementById('saveProfile').addEventListener('click', () => {
            // Aqui você adicionaria a lógica para salvar os dados
            alert('Perfil atualizado com sucesso!');
            editProfileModal.style.display = 'none';
        });
        
        document.getElementById('saveAbout').addEventListener('click', () => {
            // Aqui você adicionaria a lógica para salvar o texto "Sobre"
            alert('Seção "Sobre" atualizada com sucesso!');
            editAboutModal.style.display = 'none';
        });
    </script>
</body>
</html>