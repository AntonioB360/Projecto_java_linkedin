/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Conexaos;
import Model.Dao.ConexaoDao;
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
@WebServlet(name = "Status_conexao", urlPatterns = {"/Status_conexao"})
public class Status_conexao extends HttpServlet {

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

        ConexaoDao cd = new ConexaoDao();
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

        try {
            List<Conexaos> listar = cd.listarConexao(id_usuario);
            request.setAttribute("listar", listar);

            List<Conexaos> listar_aceites = cd.listarConexaoaceites(id_usuario);
            request.setAttribute("listar_aceites", listar_aceites);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Aceitar_Conexoes.jsp");
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
        
        String acao = request.getParameter("acao");

        switch (acao) {

            case "aceito":
                aceitar_conexao(request, response);
                break;

            case "rejeitado":
                rejeitar_conexao(request, response);
                break;

        }
    }

   protected void aceitar_conexao(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    int usuario1_id = Integer.parseInt(request.getParameter("usuario_id")); // remetente
    Usuario logado = (Usuario) request.getSession().getAttribute("usuario");
    int usuario2_id = logado.getId(); // usuário logado

    ConexaoDao cd = new ConexaoDao();
    cd.aceitarConexao(usuario1_id, usuario2_id);

    response.sendRedirect("Status_conexao?id_usuario=" + usuario2_id);
}


    protected void rejeitar_conexao(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    int usuario1_id = Integer.parseInt(request.getParameter("usuario_id")); // remetente
    Usuario logado = (Usuario) request.getSession().getAttribute("usuario");
    int usuario2_id = logado.getId(); // usuário logado

    ConexaoDao cd = new ConexaoDao();
    cd.rejeitarConexao(usuario1_id, usuario2_id);

    response.sendRedirect("Status_conexao?id_usuario=" + usuario2_id);
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
