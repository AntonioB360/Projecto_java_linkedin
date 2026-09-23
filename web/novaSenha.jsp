<%-- 
    Document   : novaSenha
    Created on : 09/06/2025, 20:05:12
    Author     : T
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir senha</title>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <style>
        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: #f3f6f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        
        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            width: 400px;
            padding: 24px;
            text-align: center;
        }
        
        .logo {
            margin-bottom: 20px;
        }
        
        .logo svg {
            width: 84px;
            height: 21px;
        }
        
        h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #000;
        }
        
        p {
            font-size: 14px;
            margin-bottom: 24px;
            color: #666;
        }
        
        .form-group {
            margin-bottom: 16px;
            text-align: left;
        }
        
        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }
        
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        
        input:focus {
            border-color: #0073b1;
            box-shadow: inset 0 0 0 1px #0073b1;
            outline: none;
        }
        
        button {
            width: 100%;
            padding: 12px;
            background-color: #0073b1;
            color: white;
            border: none;
            border-radius: 24px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
        }
        
        button:hover {
            background-color: #006097;
        }
        
        .back-link {
            display: block;
            margin-top: 16px;
            color: #0073b1;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        .password-strength {
            margin-top: 4px;
            font-size: 12px;
            color: #666;
        }
        
        .strength-weak {
            color: #d11124;
        }
        
        .strength-medium {
            color: #ffc017;
        }
        
        .strength-strong {
            color: #057642;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <svg viewBox="0 0 84 21" xmlns="http://www.w3.org/2000/svg">
                <path d="M12.5 2.75c-5.376 0-9.75 4.374-9.75 9.75s4.374 9.75 9.75 9.75 9.75-4.374 9.75-9.75-4.374-9.75-9.75-9.75zm-13.25 9.75c0-7.31 5.94-13.25 13.25-13.25s13.25 5.94 13.25 13.25-5.94 13.25-13.25 13.25S-.75 19.81-.75 12.5z" fill="#0a66c2"/>
                <path d="M62.432 6.982h-3.926v10.5h3.926v-10.5zM60.47 4.008c1.374 0 2.488 1.115 2.488 2.488 0 1.374-1.114 2.488-2.488 2.488-1.374 0-2.488-1.114-2.488-2.488 0-1.373 1.114-2.488 2.488-2.488z" fill="#0a66c2"/>
                <path d="M82.432 6.982h-3.926v10.5h3.926v-10.5zM80.47 4.008c1.374 0 2.488 1.115 2.488 2.488 0 1.374-1.114 2.488-2.488 2.488-1.374 0-2.488-1.114-2.488-2.488 0-1.373 1.114-2.488 2.488-2.488z" fill="#0a66c2"/>
                <path d="M72.822 6.982h-3.926v10.5h3.926v-4.286c0-3.256 4.286-3.536 4.286 0v4.286h3.926v-4.83c0-5.532-6.428-5.324-8.212-2.676v-2.994z" fill="#0a66c2"/>
                <path d="M51.322 6.982h-3.926v10.5h3.926v-4.286c0-3.256 4.286-3.536 4.286 0v4.286h3.926v-4.83c0-5.532-6.428-5.324-8.212-2.676v-2.994z" fill="#0a66c2"/>
                <path d="M32.588 6.982h-4.286v10.5h4.286v-5.25c0-1.813 2.143-1.813 2.143 0v5.25h4.286v-5.25c0-3.625-4.286-3.625-4.286 0v-5.25z" fill="#0a66c2"/>
            </svg>
        </div>
        
        <h1>Criar nova senha</h1>
        <p>Sua nova senha deve ser diferente das senhas usadas anteriormente.</p>
        
        <form id="passwordForm" action="AtualizarSenhaServlet" method="POST">
            <input type="hidden" name="email" value="${email}">
            <div class="form-group">
                <label for="newPassword">Nova senha</label>
                <input type="password" id="newPassword" name="senha" required minlength="8">
                <div id="passwordStrength" class="password-strength"></div>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirmar nova senha</label>
                <input type="password" id="confirmPassword" name="confirmar" required minlength="8">
                <div id="passwordMatch" class="password-strength"></div>
            </div>
            
            <button type="submit" id="submitBtn">Redefinir senha</button>
        </form>
        
        <a href="login.jsp" class="back-link">Voltar para Entrar</a>
    </div>

    <script>
        const newPassword = document.getElementById('newPassword');
        const confirmPassword = document.getElementById('confirmPassword');
        const passwordStrength = document.getElementById('passwordStrength');
        const passwordMatch = document.getElementById('passwordMatch');
        const submitBtn = document.getElementById('submitBtn');
        
        newPassword.addEventListener('input', function() {
            const strength = checkPasswordStrength(this.value);
            passwordStrength.textContent = strength.message;
            passwordStrength.className = 'password-strength strength-' + strength.class;
        });
        
        confirmPassword.addEventListener('input', function() {
            if (this.value !== newPassword.value) {
                passwordMatch.textContent = 'As senhas não coincidem';
                passwordMatch.className = 'password-strength strength-weak';
                submitBtn.disabled = true;
            } else {
                passwordMatch.textContent = 'As senhas coincidem';
                passwordMatch.className = 'password-strength strength-strong';
                submitBtn.disabled = false;
            }
        });
        
        function checkPasswordStrength(password) {
            // Verifica o comprimento da senha
            if (password.length === 0) {
                return { message: '', class: '' };
            } else if (password.length < 8) {
                return { message: 'Senha muito curta (mínimo 8 caracteres)', class: 'weak' };
            }
            
            // Verifica a complexidade
            const hasUpperCase = /[A-Z]/.test(password);
            const hasLowerCase = /[a-z]/.test(password);
            const hasNumbers = /\d/.test(password);
            const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
            
            let strength = 0;
            if (hasUpperCase) strength++;
            if (hasLowerCase) strength++;
            if (hasNumbers) strength++;
            if (hasSpecial) strength++;
            
            if (strength < 2) {
                return { message: 'Senha fraca', class: 'weak' };
            } else if (strength < 4) {
                return { message: 'Senha média', class: 'medium' };
            } else {
                return { message: 'Senha forte', class: 'strong' };
            }
        }
        
 
    </script>
</body>
</html>
