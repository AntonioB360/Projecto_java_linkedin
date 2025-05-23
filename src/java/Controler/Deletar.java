/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.UsuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet("/Deletar")
public class Deletar extends HttpServlet {

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
        processRequest(request, response);
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
        
        switch (acao) {
            
            case "eliminar":
                eliminar_user(request, response);
                
                break;
            
            case "bloquear":
                bloquear_user(request, response);
                break;
            
            default:
                response.sendRedirect("Erro.jsp");
        }
    }
    
    protected void eliminar_user(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            String id = request.getParameter("id");
            
            UsuarioDao user = new UsuarioDao();
            user.Eliminar_usuario(id);
            response.sendRedirect("listarUsuarios.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Deletar.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("Erro.jsp");
        }
    }
    
    protected void bloquear_user(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            String id = request.getParameter("id");
             String novoStatus = request.getParameter("novoStatus");
            
            UsuarioDao user = new UsuarioDao();
            user.status_usuario(novoStatus,id);
            response.sendRedirect("listarUsuarios.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Deletar.class.getName()).log(Level.SEVERE, null, ex);
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
