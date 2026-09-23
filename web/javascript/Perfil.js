/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


 function openModal(modalId) {
                const modal = document.getElementById(modalId);
                modal.classList.add('modal-open');
                modal.querySelector('input, textarea').focus();
            }

            function closeModal(modalId) {
                const modal = document.getElementById(modalId);
                modal.classList.remove('modal-open');
            }

            function openEditProfileModal() {
                const nome = document.getElementById('nomeUsuario').textContent;
                const cargo = document.getElementById('cargoUsuario').textContent;
                const contato = document.getElementById('contatoUsuario').textContent;
                const desc = document.getElementById('descricaoUsuario').textContent;
                const foto = document.getElementById('profileImage').src;
                document.getElementById('editName').value = nome;
                document.getElementById('editCargo').value = cargo;
                document.getElementById('editContato').value = contato;
                document.getElementById('editDes').value = desc;
                document.getElementById('editFoto').value = foto;
                openModal('editProfileModal');
            }

            function openAddSkillModal() {
                document.getElementById('novaHabilidade').value = '';
                openModal('addSkillModal');
            }

            function openAddExperienceModal() {
                document.getElementById('expCargo').value = '';
                document.getElementById('expEmpresa').value = '';
                document.getElementById('expPeriodo').value = '';
                document.getElementById('expDes').value = '';
                openModal('addExperienceModal');
            }

            function openAddPostModal() {
                document.getElementById('novoPost').value = '';
                openModal('addPostModal');
            }

            function saveProfile() {
                const nome = document.getElementById('editName').value.trim();
                const cargo = document.getElementById('editCargo').value.trim();
                const contato = document.getElementById('editContato').value.trim();
                const desc = document.getElementById('editDes').value.trim();
                const foto = document.getElementById('editFoto').value.trim();
                if (!nome || !desc || !foto) {
                    alert('Nome, Sobre e URL da Foto são obrigatórios!');
                    return;
                }
                document.getElementById('nomeUsuario').textContent = nome;
                document.getElementById('cargoUsuario').textContent = cargo;
                document.getElementById('contatoUsuario').textContent = contato;
                document.getElementById('descricaoUsuario').textContent = desc;
                document.getElementById('profileImage').src = foto;
                closeModal('editProfileModal');
            }

            function addSkill() {
                const input = document.getElementById('novaHabilidade').value.trim();
                if (!input) {
                    alert('Digite uma habilidade!');
                    return;
                }
                const span = document.createElement('span');
                span.className = 'skill bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm flex items-center';
                span.innerHTML = `${input}<span class="remove-skill" onclick="removeSkill(this)" aria-label="Remover habilidade ${input}">✕</span>`;
                document.getElementById('habilidades').appendChild(span);
                closeModal('addSkillModal');
            }

            function removeSkill(element) {
                element.parentElement.remove();
            }

            function addExperience() {
                const cargo = document.getElementById('expCargo').value.trim();
                const empresa = document.getElementById('expEmpresa').value.trim();
                const periodo = document.getElementById('expPeriodo').value.trim();
                const desc = document.getElementById('expDes').value.trim();
                if (!cargo || !empresa) {
                    alert('Cargo e Empresa são obrigatórios!');
                    return;
                }
                const div = document.createElement('div');
                div.className = 'border-l-4 border-blue-600 pl-4 fade-in';
                div.innerHTML = `
              <h4 class="text-lg font-medium text-gray-800">${cargo}</h4>
              <p class="text-gray-600">${empresa} | ${periodo}</p>
              <p class="text-gray-600 mt-1">${desc || 'Sem descrição'}</p>
            `;
                document.getElementById('experiencias').prepend(div);
                closeModal('addExperienceModal');
            }

            function addPost() {
                const content = document.getElementById('novoPost').value.trim();
                if (!content) {
                    alert('Digite o conteúdo do post!');
                    return;
                }
                const div = document.createElement('div');
                div.className = 'bg-gray-50 p-4 rounded-lg fade-in';
                div.innerHTML = `
              <p>${content}</p>
              <p class="text-sm text-gray-500 mt-2"></p>
            `;
                document.getElementById('posts').prepend(div);
                closeModal('addPostModal');
            }

            function connect() {
                alert('Conectar clicado! (Funcionalidade a ser implementada)');
            }

            function sendMessage() {
                alert('Enviar mensagem clicado! (Funcionalidade a ser implementada)');
            }

            // Close modal when clicking outside
            window.onclick = function (event) {
                const modals = document.querySelectorAll('.modal');
                modals.forEach(modal => {
                    if (event.target === modal) {
                        modal.classList.remove('modal-open');
                    }
                });
            };

            // Keyboard navigation for modals
            document.addEventListener('keydown', function (event) {
                if (event.key === 'Escape') {
                    document.querySelectorAll('.modal').forEach(modal => {
                        modal.classList.remove('modal-open');
                    });
                }
            });