/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Experiencia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author T
 */
public class ExperienciasDao {
    
    public void inserir(Experiencia esperiencias) throws SQLException {
        String sql = "INSERT INTO experiencias (usuario_id, cargo, empresa, localizacao, data_inicio, data_fim, descricao) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = Conexao.getCom(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, esperiencias.getId_usuario());
            stmt.setString(2, esperiencias.getCargo());
            stmt.setString(3, esperiencias.getEmpresa());
            stmt.setString(4, esperiencias.getLocalizacao());
            stmt.setString(5, esperiencias.getData_inicio());
            stmt.setString(6, esperiencias.getData_fim());
            stmt.setString(7, esperiencias.getDescricao());
            stmt.executeUpdate();
        }
    }
    public List<Experiencia> listarExperienciasPorUsuario(int usuarioId) throws SQLException {
        List<Experiencia> experiencias = new ArrayList<>();
        String sql = "SELECT * FROM experiencias WHERE usuario_id = ?";

        try (Connection conn = Conexao.getCom();
             PreparedStatement pst = conn.prepareStatement(sql)) {
             
            pst.setInt(1, usuarioId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Experiencia exp = new Experiencia();
                exp.setId(rs.getInt("id"));
                exp.setCargo(rs.getString("cargo"));
                exp.setEmpresa(rs.getString("empresa"));
                exp.setLocalizacao(rs.getString("localizacao"));
                exp.setData_inicio(rs.getString("data_inicio"));
                exp.setData_fim(rs.getString("data_fim"));
                exp.setDescricao(rs.getString("descricao"));
                experiencias.add(exp);
            }
        }

        return experiencias;
    }
}
