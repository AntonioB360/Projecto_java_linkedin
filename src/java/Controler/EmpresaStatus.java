/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.EmpressaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.System.Logger.Level;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author T
 */
public class EmpresaStatus extends HttpServlet {

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
        processRequest(request, response);
        
            String acao = request.getParameter("acao");

        switch (acao) {

            case "eliminar":
                eliminar_conta_empresa(request, response);
                break;
                
                
                  case "bloquear":
                      bloquear_empresa(request, response);
                break;
        }
    }

    
     protected void eliminar_conta_empresa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String id = request.getParameter("id");

        EmpressaDao emp = new EmpressaDao();
        try {
            emp.Eliminar_empresa(id);
        } catch (SQLException ex) {
            response.sendRedirect("Erro.jsp");
           
        }
    }
     
     
      protected void bloquear_empresa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            String id = request.getParameter("id");
             String novoStatus = request.getParameter("novoStatus");
            
            EmpressaDao enp = new EmpressaDao();
            enp.status_empresa(novoStatus, id);
            response.sendRedirect("listarUsuarios.jsp");
        } catch (SQLException ex) {
          
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
