/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.PostagemDao;
import Model.Postagens;
import Model.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet("/Postagem")

@MultipartConfig(fileSizeThreshold = 1024*1024*1,
        maxFileSize =1024*1024*10,
        maxRequestSize = 1024*1024*100)
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
       try{ 
        processRequest(request, response);
        
        
        
            
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

    }catch(SQLException e){
        e.printStackTrace();
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
