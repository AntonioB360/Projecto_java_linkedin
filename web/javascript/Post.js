/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function() {
        const postForm = document.getElementById('postForm');
        const conteudo = document.getElementById('conteudo');
        const charCount = document.getElementById('charCount');
        const fotoInput = document.getElementById('foto');
        const preview = document.getElementById('preview');
        const previewContainer = document.getElementById('previewContainer');
        const removeImageBtn = document.getElementById('removeImage');
        
        // Contador de caracteres
        conteudo.addEventListener('input', function() {
            const currentLength = this.value.length;
            charCount.textContent = currentLength;
            
            if (currentLength > 500) {
                charCount.style.color = 'red';
            } else {
                charCount.style.color = 'inherit';
            }
        });
        
        // Preview da imagem - Versão corrigida
        fotoInput.addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                // Verifica se é uma imagem
                if (!file.type.match('image.*')) {
                    alert('Por favor, selecione um arquivo de imagem (JPEG, PNG ou GIF)');
                    return;
                }
                
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    previewContainer.style.display = 'block';
                    previewContainer.classList.add('active'); // Adiciona classe para animação
                };
                
                reader.onerror = function() {
                    alert('Ocorreu um erro ao carregar a imagem');
                };
                
                reader.readAsDataURL(file);
            }
        });
        
        // Remover imagem - Versão melhorada
        removeImageBtn.addEventListener('click', function() {
            fotoInput.value = '';
            preview.src = '#';
            previewContainer.style.display = 'none';
            previewContainer.classList.remove('active');
        });
        
        // Validação do formulário
        postForm.addEventListener('submit', function(event) {
            const texto = conteudo.value.trim();
            const temImagem = fotoInput.files.length > 0;
            
            if (!texto && !temImagem) {
                event.preventDefault();
                alert('Por favor, escreva algo ou adicione uma imagem antes de publicar.');
                conteudo.focus();
                return;
            }
            
            if (texto.length > 500) {
                event.preventDefault();
                alert('O texto excede o limite de 500 caracteres.');
                return;
            }
            
            // Feedback visual durante o envio
            const publishBtn = document.querySelector('.btn-publish');
            publishBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Publicando...';
            publishBtn.disabled = true;
        });
    });

