<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <title>Verificar código</title>
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
        
        .email-display {
            font-weight: 600;
            color: #0073b1;
            margin-bottom: 16px;
        }
        
        .code-inputs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 24px;
        }
        
        .code-input {
            width: 40px;
            height: 40px;
            text-align: center;
            font-size: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .code-input:focus {
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
        
        .resend-code {
            margin-top: 16px;
            font-size: 14px;
        }
        
        .resend-link {
            color: #0073b1;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
        }
        
        .resend-link:hover {
            text-decoration: underline;
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
        
        .error-message {
            color: #d11124;
            font-size: 13px;
            margin-top: -16px;
            margin-bottom: 16px;
            display: none;
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
        
        <h1>Insira o código de verificação</h1>
        <p>Enviamos um código de 6 dígitos para o e-mail:</p>
        <div class="email-display" id="userEmail">${param.email}</div>
        
        <form id="verificationForm" action="VerificarCodigoServlet" method="POST">
            <div class="code-inputs">
                <input type="text" class="code-input" maxlength="1" data-index="1" inputmode="numeric" pattern="[0-9]*" required>
                <input type="text" class="code-input" maxlength="1" data-index="2" inputmode="numeric" pattern="[0-9]*" required>
                <input type="text" class="code-input" maxlength="1" data-index="3" inputmode="numeric" pattern="[0-9]*" required>
                <input type="text" class="code-input" maxlength="1" data-index="4" inputmode="numeric" pattern="[0-9]*" required>
                <input type="text" class="code-input" maxlength="1" data-index="5" inputmode="numeric" pattern="[0-9]*" required>
                <input type="text" class="code-input" maxlength="1" data-index="6" inputmode="numeric" pattern="[0-9]*" required>
            </div>
            
            <!-- Campo oculto que será preenchido pelo JavaScript -->
            <input type="hidden" name="codigo" id="codigoCompleto">
            <input type="hidden" name="email" value="${param.email}">
            
            <div class="error-message" id="errorMessage">
                Código inválido. Por favor, tente novamente.
            </div>
            
            <button type="submit" id="verifyBtn">Verificar</button>
        </form>
        
        <div class="resend-code">
            Não recebeu o código? <a class="resend-link" id="resendLink">Reenviar código</a>
        </div>
        
        <a href="/password-reset" class="back-link">Voltar</a>
    </div>

    <script>
        // Mostra o e-mail do usuário vindo do parâmetro da URL
        document.getElementById('userEmail').textContent = new URLSearchParams(window.location.search).get('email') || 'usuario@exemplo.com';
        
        // Lógica para navegar entre os campos de código
        const codeInputs = document.querySelectorAll('.code-input');
        const codigoCompleto = document.getElementById('codigoCompleto');
        
        codeInputs.forEach((input, index) => {
            // Foca no primeiro campo ao carregar a página
            if (index === 0) input.focus();
            
            // Move para o próximo campo quando digitar
            input.addEventListener('input', (e) => {
                if (e.target.value.length === 1) {
                    if (index < codeInputs.length - 1) {
                        codeInputs[index + 1].focus();
                    }
                }
                
                // Atualiza o código completo sempre que um dígito é alterado
                updateCodigoCompleto();
            });
            
            // Permite navegar com as teclas de seta
            input.addEventListener('keydown', (e) => {
                if (e.key === 'Backspace' && e.target.value.length === 0 && index > 0) {
                    codeInputs[index - 1].focus();
                } else if (e.key === 'ArrowLeft' && index > 0) {
                    codeInputs[index - 1].focus();
                } else if (e.key === 'ArrowRight' && index < codeInputs.length - 1) {
                    codeInputs[index + 1].focus();
                }
            });
        });
        
        // Função para atualizar o campo oculto com o código completo
        function updateCodigoCompleto() {
            let codigo = '';
            codeInputs.forEach(input => {
                codigo += input.value;
            });
            codigoCompleto.value = codigo;
        }
        
        // Contador para reenvio de código
        let resendTimer = 30;
        const resendLink = document.getElementById('resendLink');
        
        function updateResendTimer() {
            if (resendTimer > 0) {
                resendLink.textContent = `Reenviar código (${resendTimer}s)`;
                resendLink.style.pointerEvents = 'none';
                resendLink.style.color = '#666';
                resendTimer--;
                setTimeout(updateResendTimer, 1000);
            } else {
                resendLink.textContent = 'Reenviar código';
                resendLink.style.pointerEvents = 'auto';
                resendLink.style.color = '#0073b1';
            }
        }
        
        // Inicia o contador
        updateResendTimer();
        
        // Lógica para reenviar código
        resendLink.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Simula o reenvio do código
            alert('Um novo código foi enviado para seu e-mail.');
            
            // Reinicia o contador
            resendTimer = 30;
            updateResendTimer();
        });
        
        // Validação do formulário
        document.getElementById('verificationForm').addEventListener('submit', function(e) {
            // Atualiza o código completo antes de enviar
            updateCodigoCompleto();
            
            // Validação simples
            if (codigoCompleto.value.length < 6) {
                e.preventDefault();
                document.getElementById('errorMessage').style.display = 'block';
            }
            
            // Se tudo estiver ok, o formulário será submetido normalmente
            // com os parâmetros "codigo" e "email" para o servlet
        });
        
        // Esconde a mensagem de erro quando o usuário começa a digitar
        codeInputs.forEach(input => {
            input.addEventListener('input', () => {
                document.getElementById('errorMessage').style.display = 'none';
            });
        });
    </script>
</body>
</html>