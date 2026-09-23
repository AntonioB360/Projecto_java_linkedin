/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author T
 */
public class CredenciasDao {
    
    
    // 1. Verifica se o email existe
    public boolean emailExiste(String email) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        try (Connection conn=Conexao.getCom();   PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // true se existir
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Salva código de recuperação
    public void salvarCodigo(String email, String codigo) {
        String sql = "UPDATE usuarios SET codigo_recuperacao = ?, codigo_data = NOW() WHERE email = ?";
        try (Connection conn=Conexao.getCom();   PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, codigo);
            stmt.setString(2, email);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 3. Verifica se o código é válido (pode incluir verificação de tempo)
    public boolean codigoValido(String email, String codigo) {
        String sql = "SELECT * FROM usuarios WHERE email = ? AND codigo_recuperacao = ?";
        try (Connection conn=Conexao.getCom();   PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, codigo);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // existe = válido
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. Atualiza a senha (ideal usar hash com BCrypt!)
    public void atualizarSenha(String email, String novaSenha) {
        String sql = "UPDATE usuarios SET senha = ?, codigo_recuperacao = NULL WHERE email = ?";
        try (Connection conn=Conexao.getCom();   PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, novaSenha); // use hash se possível
            stmt.setString(2, email);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
