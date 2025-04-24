/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Model.Dao.EmpressaDao;
import Model.Empresa;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
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

@WebServlet("/CadastroEmpresa")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 100
)
public class CadastroEmpresa extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accao = request.getParameter("accao");

        switch (accao) {
            case "cadastrar":
                cadastrarEmpresa(request, response);
                break;
            case "actualizar":
                atualizarEmpresa(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida");
        }
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    private Empresa capturarDados(HttpServletRequest request) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String setor = request.getParameter("setor");
        String localizacao = request.getParameter("localizacao");
        String website = request.getParameter("website");
        String sobre = request.getParameter("sobre");

        Part filePart = request.getPart("logo");
        String relativePath = processarUpload(filePart);

        return new Empresa(0, nome, setor, localizacao, website, sobre, relativePath, email, senha);
    }

    private String processarUpload(Part filePart) throws IOException {
        if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null
                && !filePart.getSubmittedFileName().isEmpty()) {
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
            return UPLOAD_DIR + "/" + uniqueFileName;
        }
        return "uploads/default.png"; // Caminho padrão para avatar
    }

    private void cadastrarEmpresa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Empresa empresa = capturarDados(request);
            EmpressaDao empressaDao = new EmpressaDao();
            empressaDao.cadastrar_usuario(empresa);
            response.sendRedirect("login.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(CadastroEmpresa.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("Erro.jsp");
        }
    }
private void atualizarEmpresa(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Captura o ID da empresa
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("ID recebido para atualização: " + id);

        // Captura os dados do formulário
        Empresa empresa = capturarDados(request);
        System.out.println("Dados capturados para atualização:");
        System.out.println("Nome: " + empresa.getNome());
        System.out.println("Setor: " + empresa.getSetor());
        System.out.println("Localização: " + empresa.getLocalizacao());
        System.out.println("Website: " + empresa.getWebSite());
        System.out.println("Sobre: " + empresa.getSobre());
        System.out.println("Logo: " + empresa.getLogo());

        // Atualiza os dados no banco de dados
        EmpressaDao empressaDao = new EmpressaDao();
        boolean atualizado = empressaDao.Editar_Empresa(empresa, id);

        // Verifica se a atualização foi bem-sucedida
        if (atualizado) {
            System.out.println("Empresa atualizada com sucesso!");
            response.sendRedirect("Home.jsp");
        } else {
            System.out.println("Falha ao atualizar a empresa. Nenhuma linha foi afetada.");
            response.sendRedirect("Erro.jsp");
        }

    } catch (NumberFormatException e) {
        System.err.println("Erro ao converter o ID: " + e.getMessage());
        response.sendRedirect("Erro.jsp");
    } catch (SQLException ex) {
        Logger.getLogger(CadastroEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        response.sendRedirect("Erro.jsp");
    }
}
    
    @Override
    public String getServletInfo() {
        return "Servlet para cadastro e atualização de empresas";
    }
}
