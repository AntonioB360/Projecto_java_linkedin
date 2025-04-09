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
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Corporativo - <%=empresa.getNome()%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .cover-photo {
            height: 300px;
            background: #f0f2f5;
            position: relative;
            overflow: hidden;
        }
        
        .company-logo {
            width: 150px;
            height: 150px;
            border: 5px solid #fff;
            margin-top: -75px;
        }
        
        .profile-actions {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        
        .section-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            padding: 1.5rem;
        }
        
        .employee-card img {
            height: 120px;
            object-fit: cover;
        }
    </style>
</head>
<body class="bg-light">

<!-- Modal de Edição -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Perfil Corporativo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="profileForm" action="CadastroEmpresa" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Nome da Empresa</label>
                        <input type="text" class="form-control" name="nome" placeholder="<%=empresa.getNome()%>" id="companyName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">setor</label>
                        <textarea class="form-control" id="companyDescription" name="setor" placeholder="<%=empresa.getSetor()%>" rows="4" required></textarea>
                         <label class="form-label">Localizacao</label>
                         <input type="text" class="form-control" id="companyName" placeholder="<%=empresa.getLocalizacao()%>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Website</label>
                        <input type="text" class="form-control" id="companyName" placeholder="<%=empresa.getWebSite()%>" name="Website" required>
                        
                         <label class="form-label">Sobre</label>
                         <input type="text" class="form-control" name="sobre" id="companyName" placeholder="<%=empresa.getSobre()%>" required>
                        
                        <label class="form-label">Logo (150x150px)</label>
                        <input type="file" class="form-control" name="logo" id="logoUpload" accept="image/*">
                    </div>
                    <input type="hidden" id="id" name="acao" value="actualizar">
                    <input type="hidden" id="id" name="id" value="<%=empresa.getId()%>">
                    <div class="mb-3">
                        <label class="form-label">Foto de Capa (1200x300px)</label>
                        <input type="file" class="form-control" id="coverUpload" accept="image/*">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                </div>
            </form>
        </div>
    </div>
</div>

<header>
    <div class="cover-photo">
        <img src="<%=empresa.getLogo()%>" alt="Capa da Empresa" class="w-100 h-100 object-fit-cover" id="coverImage">
        <div class="profile-actions">
            <button class="btn btn-light shadow-sm" data-bs-toggle="modal" data-bs-target="#editModal">
                <i class="fas fa-edit me-2"></i>Editar Perfil
            </button>
        </div>
    </div>
    
    <div class="container">
        <div class="row align-items-end">
            <div class="col-auto">
                <img src="<%=empresa.getLogo()%>" alt="Logo da Empresa" class="company-logo rounded-circle" id="companyLogo">
            </div>
            <div class="col">
                <h1 class="display-6 mb-0" id="displayCompanyName"><%=empresa.getNome()%></h1>
                <p class="text-muted" id="displayCompanyDescription">Soluções inovadoras para o seu negócio digital</p>
            </div>
        </div>
    </div>
</header>

<main class="container py-5">
    <nav class="mb-4">
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link active" href="#sobre"><%=empresa.getSobre()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#postagens">Postagens</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#funcionarios">Equipe</a>
            </li>
        </ul>
    </nav>

    <section id="sobre" class="section-card">
        <h2 class="h4 mb-4">Sobre Nós</h2>
        <p id="aboutContent">Fundada em 2010, a <%=empresa.getNome()%> tem se destacado no mercado de tecnologia através de soluções inovadoras...</p>
    </section>

    <section id="postagens" class="section-card">
        <h2 class="h4 mb-4">Últimas Publicações</h2>
        <article class="card mb-3">
            <div class="card-body">
                <h3 class="h6">Lançamento Novo Produto</h3>
                <p class="mb-0">Estamos orgulhosos de anunciar nosso novo sistema de gestão integrada...</p>
            </div>
        </article>
    </section>

    <section id="funcionarios" class="section-card">
        <h2 class="h4 mb-4">Nossa Equipe</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card employee-card">
                    <img src="funcionario1.jpg" class="card-img-top" alt="Diretor">
                    <div class="card-body">
                        <h5 class="card-title mb-1">João Silva</h5>
                        <p class="card-text text-muted small">CEO & Fundador</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<footer class="bg-dark text-white py-4">
    <div class="container text-center">
        <p class="mb-0">&copy; 2023 <%=empresa.getNome()%>. Todos os direitos reservados.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('profileForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Atualizar informações
        document.getElementById('displayCompanyName').textContent = document.getElementById('companyName').value;
        document.getElementById('displayCompanyDescription').textContent = document.getElementById('companyDescription').value;
        
        // Fechar modal
        bootstrap.Modal.getInstance(document.getElementById('editModal')).hide();
    });

    // Preview de imagens
    document.getElementById('logoUpload').addEventListener('change', function(e) {
        const [file] = e.target.files;
        if(file) document.getElementById('companyLogo').src = URL.createObjectURL(file);
    });

    document.getElementById('coverUpload').addEventListener('change', function(e) {
        const [file] = e.target.files;
        if(file) document.getElementById('coverImage').src = URL.createObjectURL(file);
    });
</script>

</body>
</html>