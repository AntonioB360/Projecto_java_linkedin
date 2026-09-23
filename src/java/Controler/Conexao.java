/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Conexaos;
import Model.Dao.ConexaoDao;
import Model.Dao.NotificacaoDao;
import Model.Dao.UsuarioDao;
import Model.Notificacoes;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author T
 */
@WebServlet(name = "Conexao", urlPatterns = {"/Conexao"})
public class Conexao extends HttpServlet {

    UsuarioDao usd = new UsuarioDao();
    ConexaoDao cd=new ConexaoDao();

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
          int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

        try {
            List<Usuario> listar = usd.listar_conexoes(id_usuario);
            request.setAttribute("listar", listar);
            
             List<Conexaos> listar_aceites = cd.listarConexaoaceites(id_usuario);
            request.setAttribute("listar_aceites", listar_aceites);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("Rede.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
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
            int id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
            int id_outroUsuario=Integer.parseInt(request.getParameter("id_OutroUser"));
            
            ConexaoDao cd=new ConexaoDao();
            NotificacaoDao nd=new NotificacaoDao();
            

            Notificacoes nt=new Notificacoes(0, id_usuario, id_outroUsuario, "conexao", 2);
            nd.registrar_notificacao(nt);
            
            boolean sucesso=cd.enviarConexao(id_usuario, id_outroUsuario);
            
            if(sucesso){
                request.setAttribute("msg", "Convite enviado com sucesso");
            }else{
                request.setAttribute("msg", "Voce ja enviou ou ja possui uma conexao com este usuario");
            }
            
            response.sendRedirect("Conexao?id_usuario="+id_usuario);
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
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
