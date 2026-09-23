/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Comentario;
import Model.Curtidas;
import Model.Dao.ComentarioDao;
import Model.Dao.NotificacaoDao;
import Model.Dao.PostagemDao;
import Model.Notificacoes;
import Model.Postagens;
import Model.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author us
 */


@MultipartConfig(fileSizeThreshold = 1024*1024*1,
        maxFileSize =1024*1024*10,
        maxRequestSize = 1024*1024*100)

@WebServlet("/Postagem")
public class Postagem extends HttpServlet {
private static final String UPLOAD_DIR = "uploads"; 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
           
           
  
        }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        processRequest(request, response);
        
               String acao = request.getParameter("acao");

        switch (acao) {

            case "postar":
                realizar_postagen(request, response);
                break;
                
                
                case "comentar":
                    realizar_comentario(request, response);
                break;
                
                case "curtir":
                    realizar_curtida(request, response);
                break;
                
                 case "eliminar":
                     Eliminarpost(request, response);
                break;
                
               
        } 
            
        }
        
    
    
    
    protected void realizar_postagen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        processRequest(request, response);
        
        
        try{ 
            
            int id=Integer.parseInt(request.getParameter("id_usuario"));
            String conteudo=request.getParameter("conteudo");
            
            Part filePart = request.getPart("foto");
            String relativePath = null;

if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
    String fileName = filePart.getSubmittedFileName();
    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }

    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
    String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
    String filePath = uploadPath + File.separator + uniqueFileName;

    filePart.write(filePath);
    relativePath = UPLOAD_DIR + "/" + uniqueFileName;
} else {
    // Não foi enviada uma foto. Podemos definir um caminho padrão ou deixar como null
    relativePath = "uploads/default.png"; // se quiser um avatar padrão
}
        PostagemDao post=new PostagemDao();
        Postagens postar=new Postagens(0,id, conteudo, relativePath);
        post.cadastrar_usuario(postar);
          response.sendRedirect("Feed.jsp");
    }catch(SQLException e){
        e.printStackTrace();
        response.sendRedirect("Erro.jsp");
    }
       
            
        }

    
    
    
    protected void realizar_comentario(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    processRequest(request, response);

    String conteudo = request.getParameter("comentario");
 
    int id_postagem = Integer.parseInt(request.getParameter("idPostagem"));
    int id_usuario = Integer.parseInt(request.getParameter("idUsuario"));
    int id_remetente = Integer.parseInt(request.getParameter("id_remetente"));
    
    Comentario cm = new Comentario(0, id_postagem, id_usuario, conteudo);
    ComentarioDao cd = new ComentarioDao();
  
    NotificacaoDao nd=new NotificacaoDao();

    try {
       int idComentarioGerado = cd.comentar(cm);
      Notificacoes nt = new Notificacoes(0, id_usuario, id_remetente, "comentario", idComentarioGerado);

        nd.registrar_notificacao(nt);
        // CORREÇÃO AQUI
        response.sendRedirect("Pagina_Publicacao.jsp?id=" + id_postagem);
    } catch (SQLException ex) {
        Logger.getLogger(Postagem.class.getName()).log(Level.SEVERE, null, ex);
        response.sendRedirect("Erro.jsp");
    }
}

    
    
    protected void realizar_curtida(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    processRequest(request, response);

  

    try {
        
     
    int id_postagem = Integer.parseInt(request.getParameter("idPostagem"));
    int id_usuario = Integer.parseInt(request.getParameter("idUsuario"));
   

      Curtidas cr=new Curtidas(0, id_postagem, id_usuario);
        PostagemDao p = new PostagemDao();
      p.curtir_postagem(cr);
      
        response.sendRedirect("Feed.jsp?");
    } catch (SQLException ex) {
        Logger.getLogger(Postagem.class.getName()).log(Level.SEVERE, null, ex);
        response.sendRedirect("Feed.jsp");
    }
}
        protected void Eliminarpost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    processRequest(request, response);

  

    try {
        
     
    int id_postagem = Integer.parseInt(request.getParameter("idPostagem"));
    int id_usuario = Integer.parseInt(request.getParameter("idUsuario"));
   

      
        PostagemDao p = new PostagemDao();
      p.eliminarPostagem(id_postagem, id_usuario);
      
        response.sendRedirect("Feed.jsp");
    } catch (SQLException ex) {
        Logger.getLogger(Postagem.class.getName()).log(Level.SEVERE, null, ex);
        response.sendRedirect("Erro.jsp");
    }
}
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
