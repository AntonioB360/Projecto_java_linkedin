/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.EmpressaDao;
import Model.Dao.UsuarioDao;
import Model.Empresa;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author T
 */
public class LoginStatus extends HttpServlet {

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
        
           try {
            processRequest(request, response);

            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String tipo = request.getParameter("tipo");

            UsuarioDao user = new UsuarioDao();
            HttpSession session = request.getSession();

            if ("usuario".equals(tipo) ) {
                LoginDTO usuario = user.validar_credenciais(email, senha);

                if (usuario != null) {
                    UsuarioDTO dados=user.dados_usuarios(email);
                    session.setAttribute("usuario", usuario);
                    session.setAttribute("dados", dados);
                    response.sendRedirect("Feed.jsp");
                } else {
                    response.sendRedirect("login.jsp?erro=usuario");
                }

            } else if ("empresa".equals(tipo)) {
                Empresa empresa = EmpressaDao.validar(email, senha);

                if (empresa != null) {
                    session.setAttribute("empresal", empresa);
                    session.setAttribute("role", "empresa");
                    response.sendRedirect("Home.jsp");
                } else {
                    response.sendRedirect("login.jsp?erro=empresa");

                }

            } else if ("adm".equals(tipo)) {
                LoginDTO usuario = user.validar_credenciais(email, senha);
                if (usuario != null) {
                    session.setAttribute("usuario", usuario);
                    session.setAttribute("role", "usuario");
                    response.sendRedirect("DashbordAdm.jsp");
                }
            } else {
                
                out.println("<!DOCTYPE html>\n" +
"<html lang=\"en\">\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"    <title>Document</title>\n" +
"</head>\n" +
"<body>\n" +
"    \n" +
"   <b>erro</b>\n" +
"\n" +
"</body>\n" +
"</html>");
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
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
