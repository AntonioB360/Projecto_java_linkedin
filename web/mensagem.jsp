<%-- 
    Document   : mensagem
    Created on : 31/03/2025, 19:09:25
    Author     : us
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mensagens - LinkedIn Style</title>
    <style>
        :root {
            --primary-color: #0077b5;
            --hover-color: #005582;
            --background: #f5f5f5;
            --message-user: #e3f0ff;
            --message-other: #ffffff;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: var(--background);
            display: flex;
            justify-content: center;
            min-height: 100vh;
            padding: 1rem;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            height: 80vh;
        }

        .header {
            padding: 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border-radius: 12px 12px 0 0;
            position: relative;
        }

        .header h1 {
            font-weight: 600;
            font-size: 1.5rem;
            text-align: center;
        }

        .message-list {
            flex: 1;
            overflow-y: auto;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .message {
            max-width: 70%;
            padding: 1rem;
            border-radius: 12px;
            position: relative;
            animation: fadeIn 0.3s ease-in;
        }

        .message.user {
            background: var(--message-user);
            align-self: flex-end;
            border-radius: 12px 12px 0 12px;
        }

        .message.other {
            background: var(--message-other);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            align-self: flex-start;
            border-radius: 12px 12px 12px 0;
        }

        .message-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 0.5rem;
            font-size: 0.75rem;
            color: #666;
        }

        .new-message {
            display: flex;
            gap: 1rem;
            padding: 1.5rem;
            border-top: 1px solid #eee;
            background: #fafafa;
        }

        .message-input {
            flex: 1;
            padding: 0.75rem 1rem;
            border: 1px solid #ddd;
            border-radius: 24px;
            font-size: 1rem;
            transition: all 0.2s;
        }

        .message-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 119, 181, 0.1);
        }

        .send-button {
            padding: 0.75rem 2rem;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 24px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
        }

        .send-button:hover {
            background: var(--hover-color);
            transform: translateY(-1px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 480px) {
            .container {
                height: 90vh;
                border-radius: 0;
            }
            
            .message {
                max-width: 85%;
            }
        }
    </style>
</head>
<body>
    <div class="container" role="main">
        <header class="header">
            <h1>Conversa</h1>
        </header>


        <div class="new-message">
            <input 
                type="text" 
                class="message-input" 
                placeholder="Digite sua mensagem..."
                id="messageInput"
                aria-label="Campo de mensagem"
            >
            <button 
                class="send-button"
                id="sendButton"
                aria-label="Enviar mensagem"
            >
                Enviar
            </button>
        </div>
    </div>

   
</body>
</html>
