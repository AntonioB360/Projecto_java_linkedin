/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */




function addComment() {
    const commentText = document.getElementById('commentText').value.trim();
    if (!commentText) return;

    const commentsList = document.getElementById('commentsList');
    const newComment = document.createElement('div');
    newComment.className = 'comment';
    newComment.textContent = commentText;

    commentsList.appendChild(newComment);
    document.getElementById('commentText').value = '';

    // Envia o comentário ao servlet
    sendCommentToServlet(commentText);
}

function sendCommentToServlet(comment) {
    const servletUrl = '/CommentServlet'; // Substitua com o caminho do servlet

    // Cria os parâmetros para enviar via URL
    const params = new URLSearchParams();
    params.append('comment', comment);

    fetch(`${servletUrl}?${params.toString()}`, {
        method: 'GET'
    })
    .then(response => {
        if (response.ok) {
            console.log("Comentário enviado ao servlet com sucesso!");
        } else {
            console.error("Falha ao enviar comentário ao servlet:", response.status);
        }
    })
    .catch(error => {
        console.error("Erro ao se conectar com o servlet:", error);
    });
}
