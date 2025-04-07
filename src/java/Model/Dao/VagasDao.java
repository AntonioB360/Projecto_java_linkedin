/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Postagens;
import Model.Vagas_Emprego;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author T
 */
public class VagasDao {

    public void cadastrar_vagas(Vagas_Emprego vagas) throws SQLException {

        String sql = "insert into vagas (titulo,empresa,localizacao,descricao, salario,Benefícios,experiencia,empresa_id) values (?,?,?,?,?,?,?,?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setString(1, vagas.getTitulo());
            pst.setString(2, vagas.getEmpresa());
            pst.setString(3, vagas.getLocalizacao());
            pst.setString(4, vagas.getDescricao());
            pst.setDouble(5, vagas.getSalario());
            pst.setString(6, vagas.getBenefícios());
            pst.setString(7, vagas.getExperiencia());
            pst.setDouble(8, vagas.getEmpresa_id());

            pst.executeUpdate();
        }

    }

}
