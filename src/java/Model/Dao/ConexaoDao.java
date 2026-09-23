/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Conexaos;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T
 */
public class ConexaoDao {

    public boolean enviarConexao(int usuario1_id, int usuario2_id) {

        String sql = "INSERT INTO conexoes (usuario1_id, usuario2_id, status, usuario_a, usuario_b) "
                + "VALUES (?, ?, 'pendente', LEAST(?, ?), GREATEST(?, ?))";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setInt(1, usuario1_id);
            pst.setInt(2, usuario2_id);
            pst.setInt(3, usuario1_id);
            pst.setInt(4, usuario2_id);
            pst.setInt(5, usuario1_id);
            pst.setInt(6, usuario2_id);

            pst.executeUpdate();
            return true;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Erro: conexão já existe ou violação de restrição. " + e.getMessage());

        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());

        }

        return false;
    }

    public List<Conexaos> listarConexao(int usuario2_id) throws SQLException {

        List<Conexaos> listar = new ArrayList<>();

        String sql = "SELECT u.id, u.nome, u.cargo,u.empresa\n"
                + "FROM conexoes c\n"
                + "JOIN usuarios u ON c.usuario1_id = u.id\n"
                + "WHERE c.usuario2_id = ?  AND c.status = 'pendente'";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setInt(1, usuario2_id);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                Usuario user = new Usuario();
                user.setId(rs.getInt("id"));
                user.setNome(rs.getString("nome"));
                user.setCargo(rs.getString("cargo"));
                user.setEmpresa(rs.getString("empresa"));
                Conexaos co = new Conexaos();

                co.setUsuario(user);
                listar.add(co);

            }

            return listar;
        }

    }

    public List<Conexaos> listarConexaoaceites(int usuario2_id) throws SQLException {

        List<Conexaos> listar = new ArrayList<>();

        String sql = "SELECT u.id, u.nome, u.cargo,u.empresa\n"
                + "FROM conexoes c\n"
                + "JOIN usuarios u ON c.usuario1_id = u.id\n"
                + "WHERE c.usuario2_id = ?  AND c.status = 'aceito'";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setInt(1, usuario2_id);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                Usuario user = new Usuario();
                user.setId(rs.getInt("id"));
                user.setNome(rs.getString("nome"));
                user.setCargo(rs.getString("cargo"));
                user.setEmpresa(rs.getString("empresa"));
                Conexaos co = new Conexaos();

                co.setUsuario(user);
                listar.add(co);

            }

        }

        return listar;
    }

    public void aceitarConexao(int usuario1_id, int usuario2_id) {
        String sql = "UPDATE conexoes SET status = 'aceito' WHERE usuario1_id = ? AND usuario2_id = ?";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setInt(1, usuario1_id);  // remetente
            pst.setInt(2, usuario2_id);  // destinatário (usuário logado)
            pst.executeUpdate();

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Erro: conexão já existe ou violação de restrição. " + e.getMessage());

        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
    }

    public void rejeitarConexao(int usuario1_id, int usuario2_id) {
        String sql = "UPDATE conexoes SET status = 'rejeitado' WHERE usuario1_id = ? AND usuario2_id = ?";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setInt(1, usuario1_id); // remetente
            pst.setInt(2, usuario2_id); // destinatário (usuário logado)
            pst.executeUpdate();

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Erro: conexão já existe ou violação de restrição. " + e.getMessage());

        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
    }

}
