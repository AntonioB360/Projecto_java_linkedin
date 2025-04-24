package Controler;


import Model.Dao.UsuarioDao;
import Model.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listarUsuarios")
public class ListarUsuariosServlet extends HttpServlet {
    private UsuarioDao userDao = new UsuarioDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Usuario> lista;

        try {
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                lista = userDao.buscarUsuarios(searchQuery);
            } else {
                lista = userDao.Listar_user();
            }
            request.setAttribute("usuarios", lista);
            request.setAttribute("searchQuery", searchQuery);
            request.getRequestDispatcher("/listarUsuarios.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ListarUsuariosServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("Erro.jsp");
        }
    }
}
