/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.MensagemDao;
import Model.Menssagen;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author T
 */
@WebServlet(name = "Processar_Mensagen", urlPatterns = {"/Processar_Mensagen"})
public class Processar_Mensagen extends HttpServlet {

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
    try {
        MensagemDao md = new MensagemDao();

        // Verifica se tem dois usuários (conversa entre eles)
        String id1 = request.getParameter("id_usuario1");
        String id2 = request.getParameter("id_usuario2");

        if (id1 != null && id2 != null) {
            // Conversa entre dois usuários
            int idUsuario1 = Integer.parseInt(id1);
            int idUsuario2 = Integer.parseInt(id2);

            List<Menssagen> mensagens = md.listarMensagensEntreUsuarios(idUsuario1, idUsuario2);
            
            
            request.setAttribute("mensagens_conversa", mensagens);

            // Redireciona para a página específica dessa conversa
            request.getRequestDispatcher("mensagem.jsp").forward(request, response);

        } else {
            // Resumo das conversas do usuário logado
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            List<Menssagen> listar_mensagem = md.listarResumosConversas(idUsuario);

            request.setAttribute("listar_mensagens", listar_mensagem);
            request.getRequestDispatcher("Listar_mensagens.jsp").forward(request, response);
        }

    } catch (Exception ex) {
        ex.printStackTrace();
        response.sendRedirect("Erro.jsp");
    }
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
        try {
            processRequest(request, response);
            
            int idUsuario1 = Integer.parseInt(request.getParameter("remetente"));
            int idUsuario2 = Integer.parseInt(request.getParameter("destinatario"));
            String conteudo = request.getParameter("conteudo");
            
            Menssagen mg=new Menssagen(idUsuario1, idUsuario2, conteudo);
            MensagemDao md = new MensagemDao();
            
            md.enviarMensagem(mg);
           response.sendRedirect("Processar_Mensagen?id_usuario1=" + idUsuario1 + "&id_usuario2=" + idUsuario2);


        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
            Logger.getLogger(Processar_Mensagen.class.getName()).log(Level.SEVERE, null, ex);
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
