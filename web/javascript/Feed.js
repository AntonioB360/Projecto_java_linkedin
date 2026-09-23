/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let profileMenu = document.getElementById("profileMenu");
            let likedPosts = new Set(); // Conjunto para armazenar posts curtidos

            function toggleMenu() {
                profileMenu.classList.toggle("open-menu");
            }

            let sideActivity = document.getElementById("sidebarActivity");
            let moreLink = document.getElementById("showMoreLink");

            function toggleActivity() {
                sideActivity.classList.toggle("open-activity");
                if (sideActivity.classList.contains("open-activity")) {
                    moreLink.innerHTML = "Show less <b>-</b>";
                } else {
                    moreLink.innerHTML = "Show More <b>+</b>";
                }
            }

            function likePost(postId, userId, element) {
                // Verifica se o post já foi curtido
                if (likedPosts.has(postId)) {
                    return; // Sai da função se já tiver curtido
                }
                
                // Adiciona o post ao conjunto de curtidos
                likedPosts.add(postId);
                
                // Desabilita o botão visualmente
                const likeBtn = element.closest('.like-btn');
                likeBtn.classList.add('liked', 'disabled');
                likeBtn.querySelector('img').src = 'images/like-filled.png';
                
                // Atualiza o contador visualmente antes da requisição AJAX
                const likeCountElement = document.getElementById('like-count-' + postId);
                const currentCount = parseInt(likeCountElement.innerText);
                likeCountElement.innerText = currentCount + 1;
                
                // Faz a requisição AJAX
                $.ajax({
                    url: 'Postagem',
                    type: 'POST',
                    data: {
                        idPostagem: postId,
                        idUsuario: userId,
                        acao: 'curtir'
                    },
                    success: function(response) {
                        // Se a requisição falhar no servidor, reverte as mudanças visuais
                        if (!response.success) {
                            likeBtn.classList.remove('liked', 'disabled');
                            likeBtn.querySelector('img').src = 'images/like.png';
                            likeCountElement.innerText = currentCount;
                            likedPosts.delete(postId);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("Erro ao curtir postagem: " + error);
                        
                        // Reverte as mudanças visuais em caso de erro
                        likeBtn.classList.remove('liked', 'disabled');
                        likeBtn.querySelector('img').src = 'images/like.png';
                        likeCountElement.innerText = currentCount;
                        likedPosts.delete(postId);
                        
                        alert("Ocorreu um erro ao curtir a postagem. Por favor, tente novamente.");
                    }
                });
            }