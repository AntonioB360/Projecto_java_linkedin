/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


 /* MODAL DE CANDIDATURA – VAGAS */
    const btnCandidatar = document.querySelectorAll(".btnCandidatar");
    const modalJob = document.getElementById("modalJob");
    const modalClose = document.querySelector(".modal-close");
    const jobNameModal = document.getElementById("jobNameModal");
    const jobTitleModal = document.getElementById("jobTitleModal");
    const btnCancelar = document.getElementById("btnCancelar");
    const btnConfirmar = document.getElementById("btnConfirmar");

    btnCandidatar.forEach(function(button) {
      button.addEventListener("click", function(e) {
        const jobCard = e.target.closest(".job");
        const jobName = jobCard.getAttribute("data-job");
        jobNameModal.textContent = jobName;
        jobTitleModal.textContent = "Candidatura para " + jobName;
        modalJob.style.display = "flex";
      });
    });

    modalClose.addEventListener("click", function() {
      modalJob.style.display = "none";
    });
    btnCancelar.addEventListener("click", function() {
      modalJob.style.display = "none";
    });
    btnConfirmar.addEventListener("click", function() {
      alert("Candidatura para " + jobNameModal.textContent + " enviada!");
      modalJob.style.display = "none";
    });
    window.addEventListener("click", function(e) {
      if (e.target === modalJob) {
        modalJob.style.display = "none";
      }
    });
    
    /* FORMULÁRIO DE ASSINATURA E PAGAMENTO (SEÇÃO PREMIUM) */
    document.getElementById("formAssinatura").addEventListener("submit", function(e){
      e.preventDefault();
      const nome = document.getElementById("nome").value;
      const email = document.getElementById("email").value;
      // Neste exemplo, assume-se a validação dos campos de pagamento se aplicável.
      alert("Obrigado, " + nome + "! Sua assinatura com o email " + email + " foi confirmada e o pagamento processado com sucesso.");
      document.getElementById("subscription-form").style.display = "none";
      this.reset();
    });
    
    /* Alterna exibição dos detalhes do Cartão conforme método de pagamento */
    document.querySelectorAll('input[name="payment-method"]').forEach((elem) => {
      elem.addEventListener("change", function(e) {
         const selected = document.querySelector('input[name="payment-method"]:checked').value;
         const creditDetails = document.getElementById("credit-card-details");
         if(selected === "credit"){
            creditDetails.style.display = "block";
            document.getElementById("card-number").required = true;
            document.getElementById("expiry").required = true;
            document.getElementById("cvv").required = true;
         } else {
            creditDetails.style.display = "none";
            document.getElementById("card-number").required = false;
            document.getElementById("expiry").required = false;
            document.getElementById("cvv").required = false;
         }
      });
    });
    
    /* ÁREA DE MENSAGENS */
    document.getElementById("btnEnviar").addEventListener("click", function(){
      const input = document.getElementById("messageInput");
      const container = document.getElementById("messageContainer");
      if(input.value.trim() !== ""){
        const newMessage = document.createElement("div");
        newMessage.classList.add("message");
        newMessage.innerHTML = "<strong>Você:</strong> " + input.value;
        container.appendChild(newMessage);
        input.value = "";
        container.scrollTop = container.scrollHeight;
        // Simula resposta automática após 1 segundo
        setTimeout(() => {
          const reply = document.createElement("div");
          reply.classList.add("message");
          reply.innerHTML = "<strong>ChatBot:</strong> Obrigado por sua mensagem!";
          container.appendChild(reply);
          container.scrollTop = container.scrollHeight;
        }, 1000);
      } else {
        alert("Digite uma mensagem antes de enviar!");
      }
    });
    
    /* BOTÕES "CONECTAR" NA SEÇÃO MINHA REDE */
    const conectarButtons = document.querySelectorAll(".btnConectar");
    conectarButtons.forEach(button => {
      button.addEventListener("click", function() {
        button.textContent = "Conectado";
        button.disabled = true;
      });
    });
    
    /* NOTIFICAÇÕES: FECHAR AO CLICAR NO "×" */
    const closeButtons = document.querySelectorAll(".notification-close");
    closeButtons.forEach(btn => {
      btn.addEventListener("click", function(){
        const notif = this.parentElement;
        notif.style.opacity = "0";
        setTimeout(() => { notif.remove(); }, 300);
      });
    });