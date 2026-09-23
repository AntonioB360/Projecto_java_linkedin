/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.ExperienciasDao;
import Model.Dao.HabilidadesDao;
import Model.Dao.UsuarioDao;
import Model.Experiencia;
import Model.Habilidades;
import Model.Usuario;
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
@WebServlet(name = "UsuarioPerfil", urlPatterns = {"/UsuarioPerfil"})
public class UsuarioPerfil extends HttpServlet {

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
            processRequest(request, response);
            int id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
            UsuarioDao ud=new UsuarioDao();
              List<Usuario> listar=ud.Perfil_user(id_usuario);
              
            request.setAttribute("listar", listar);


            // Redireciona para a página específica dessa conversa
            request.getRequestDispatcher("Perfil.jsp").forward(request, response);
          
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioPerfil.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
        
        String acao = request.getParameter("acao");
        
        switch(acao){
            
            case "cadastrar_experiencia":
                
                   cadastrar_experiencia(request, response);
                   break;
                   
                    case "cadastrar_habilidade":
                
                        cadastrar_habilidades(request, response);
                   break;
        }
        
    }
    
    
    
    
    
    
    
    
     protected void cadastrar_habilidades(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String habili=request.getParameter("habilidade");
        int id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
        
        Habilidades h=new Habilidades(id_usuario, habili);
        HabilidadesDao hd=new HabilidadesDao();
        
        try {
            
            hd.inserir_habilidades(h);
        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
            Logger.getLogger(UsuarioPerfil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     
     
     
     
     
     
     
     
     
     
     
     protected void cadastrar_experiencia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
           String cargo = request.getParameter("cargo");
    String empresa = request.getParameter("empresa");
    String localizacao = request.getParameter("localizacao");
    String data_inicio = request.getParameter("data_inicio");
    String data_fim = request.getParameter("data_fim");
    String descricao = request.getParameter("descricao");
    int id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
        
        Experiencia ep=new Experiencia(id_usuario, cargo, empresa, localizacao, data_inicio, data_fim, descricao);
        ExperienciasDao ed=new ExperienciasDao();
        
        try {
            
           ed.inserir(ep);
        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
            Logger.getLogger(UsuarioPerfil.class.getName()).log(Level.SEVERE, null, ex);
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
