/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Empresa;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author T
 */
public class EmpressaDao {
    
    public void cadastrar_usuario(Empresa empresa) throws SQLException {

        String sql = "insert into empresa (nome, setor, localizacao, webSite, sobre, logo, email, senha) values (?,?,?,?,?,?,?,?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            
            
            pst.setString(1, empresa.getNome());
            pst.setString(2, empresa.getSetor());
            pst.setString(3, empresa.getLocalizacao());
            pst.setString(4, empresa.getWebSite());
            pst.setString(5, empresa.getSobre());
            pst.setString(6, empresa.getLogo());
            pst.setString(7, empresa.getEmail());
            pst.setString(8, empresa.getSenha());
            pst.executeUpdate();
        }
    }

    
       public static Empresa validar(String email, String senha) throws SQLException {
        String sql = "SELECT * FROM empresa WHERE email = ? AND senha = ?";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setString(1, email);
            pst.setString(2, senha);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                
                Empresa empresa = new Empresa(rs.getInt("id"),rs.getString("nome"),rs.getString("setor"),rs.getString("localizacao"),rs.getString("WebSite"),rs.getString("sobre"),rs.getString("logo"),rs.getString("email"),rs.getString("senha"));
    
                // Preencha outros campos do objeto Usuario, se necessário
                return empresa;
            }
        }
        return null; // Retorna null se nenhum usuário for encontrado
    }
    
       
       
     public boolean Editar_Empresa(Empresa empresa, int id) throws SQLException {
    String sql = "UPDATE empresas SET nome = ?, setor = ?, localizacao = ?, website = ?, descricao = ?, logo = ? WHERE id = ?";
    try (Connection conn = Conexao.getCom(); PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, empresa.getNome());
        stmt.setString(2, empresa.getSetor());
        stmt.setString(3, empresa.getLocalizacao());
        stmt.setString(4, empresa.getWebSite());
        stmt.setString(5, empresa.getSobre());
        stmt.setString(6, empresa.getLogo());
        stmt.setInt(7, id);

        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0; // Retorna true se pelo menos uma linha foi atualizada
    }
}

       
       
}
