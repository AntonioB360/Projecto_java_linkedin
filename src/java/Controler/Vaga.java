/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Candidatura;
import Model.Dao.CandidaturaDao;
import Model.Dao.VagasDao;
import Model.Vagas_Emprego;
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
@WebServlet(name = "Vaga", urlPatterns = {"/Vaga"})
public class Vaga extends HttpServlet {

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
           int id = Integer.parseInt(request.getParameter("id_vaga"));


            
            CandidaturaDao cd=new CandidaturaDao();
            
            List<Candidatura> lista=cd.Listar_vagas_empresa(id);
            
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("Visualizar_candidatos.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Vaga.class.getName()).log(Level.SEVERE, null, ex);
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

             String acao = request.getParameter("acao");
             
             switch(acao){
                 
                 case "cadastrar":
                     
                     cadastro_vagas(request, response);
                     
                     break;
                     
                     case "eliminar":
                     
                         eliminar_vagas(request, response);
                     
                     break;
                     
                     
                       case "candidatar":
                     
                           candidatar(request, response);
                     
                     break;
                 
             }
             
             
     
    }

    
    
    
    
    
        protected void cadastro_vagas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String titulo = request.getParameter("titulo");
            String empresa = request.getParameter("empresa");
            String localizacao = request.getParameter("localizacao");
            String descricao = request.getParameter("descricao");
            double salario = Double.parseDouble(request.getParameter("salario"));
            String Benefícios = request.getParameter("beneficios");
            String experiencia = request.getParameter("experiencia");
            int id=Integer.parseInt(request.getParameter("id"));
            
            Vagas_Emprego emprego=new Vagas_Emprego(id, titulo, empresa, localizacao, descricao, salario, Benefícios, experiencia, id);
            
            VagasDao v=new VagasDao();
            v.cadastrar_vagas(emprego);
             response.sendRedirect("Home.jsp");
            
        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
            Logger.getLogger(Vaga.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
        
               protected void eliminar_vagas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
          
            String id=request.getParameter("id_vagas");
            
            VagasDao v=new VagasDao();
            v.eliminar_vaga(id);
             response.sendRedirect("Empressas_visualizar_Vagas.jsp");
            
        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
            Logger.getLogger(Vaga.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
               
               
                    protected void candidatar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
          
            int id_usuario=Integer.parseInt(request.getParameter("usuarioid"));
             int id_vagas=Integer.parseInt(request.getParameter("vagaid"));
            
            CandidaturaDao cd=new CandidaturaDao();
            Candidatura c= new Candidatura(0, id_usuario, id_vagas);
            
            cd.registrar_candidatura(c);
           
             request.setAttribute("mensagem", "Candidatura enviada com sucesso");
             request.getRequestDispatcher("Vagas_cand.jsp").forward(request,response);
            
        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
            Logger.getLogger(Vaga.class.getName()).log(Level.SEVERE, null, ex);
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
