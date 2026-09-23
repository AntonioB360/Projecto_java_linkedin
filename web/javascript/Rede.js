/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


 // Função de busca
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-input');
            
            if (searchInput) {
                searchInput.addEventListener('input', function() {
                    const searchTerm = this.value.toLowerCase();
                    const connections = document.querySelectorAll('.connection');
                    
                    connections.forEach(connection => {
                        const name = connection.querySelector('strong').textContent.toLowerCase();
                        const title = connection.querySelector('p').textContent.toLowerCase();
                        
                        if (name.includes(searchTerm) || title.includes(searchTerm)) {
                            connection.style.display = 'flex';
                        } else {
                            connection.style.display = 'none';
                        }
                    });
                });
            }

            // Configuração do AJAX para os botões de conexão
            $(document).ready(function() {
                $('.connect-btn').click(function() {
                    const btn = $(this);
                    const userId = btn.data('user-id');
                    const otherUserId = btn.data('other-user-id');
                    const spinner = btn.find('.spinner');
                    const successMessage = btn.siblings('.success-message');
                    
                    // Desabilita o botão e mostra o spinner
                    btn.prop('disabled', true);
                    spinner.show();
                    
                    // Faz a requisição AJAX
                    $.ajax({
                        url: 'Conexao',
                        type: 'POST',
                        data: {
                            id_usuario: userId,
                            id_OutroUser: otherUserId
                        },
                        success: function(response) {
                            // Sucesso na requisição
                            btn.hide();
                            successMessage.show();
                            
                            // Atualiza o contador de conexões no cabeçalho
                            const connectionsCount = $('.connections');
                            const currentCount = parseInt(connectionsCount.text().match(/\d+/)[0]);
                            connectionsCount.html('<i class="fas fa-users"></i> ' + (currentCount + 1) + ' conexões');
                        },
                        error: function(xhr, status, error) {
                            // Erro na requisição
                            console.error('Erro ao enviar solicitação de conexão:', error);
                            btn.prop('disabled', false);
                            spinner.hide();
                            alert('Ocorreu um erro ao tentar conectar. Por favor, tente novamente.');
                        }
                    });
                });
            });
        });