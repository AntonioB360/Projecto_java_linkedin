/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author us
 */
public class UsuarioDao {

        public void cadastrar_usuario(Usuario usuario) throws SQLException {

        String sql = "insert into usuarios (nome, email, senha, cargo, empresa, localizacao, resumo, foto_perfil) values (?,?,?,?,?,?,?,?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setString(1, usuario.getNome());
            pst.setString(2, usuario.getEmail());
            pst.setString(3, usuario.getSenha());
            pst.setString(4, usuario.getCargo());
            pst.setString(5, usuario.getEmpresa());
            pst.setString(6, usuario.getLocalizacao());
            pst.setString(7, usuario.getResumo());
            pst.setString(8, usuario.getFoto_perfil());
            pst.executeUpdate();
        }
    }

    public Usuario validar(String email, String senha) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setString(1, email);
            pst.setString(2, senha);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                
                Usuario usuario = new Usuario(rs.getInt("id"),rs.getString("nome"),rs.getString("email"),rs.getString("senha"),rs.getString("cargo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("resumo"),rs.getString("foto_perfil"));
    
                // Preencha outros campos do objeto Usuario, se necessário
                return usuario;
            }
        }
        return null; // Retorna null se nenhum usuário for encontrado
    }
}

