/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Postagens;
import Model.Usuario;
import Model.Vagas_Emprego;
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
    
        public List<Vagas_Emprego> Listar_vagas() throws SQLException {
        List<Vagas_Emprego> listar=new ArrayList<>();
        String sql = "SELECT *FROM vagas";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
        

            ResultSet rs = pst.executeQuery();

               while(rs.next()){
                   
                
               listar.add(new Vagas_Emprego(rs.getInt("id"),rs.getString("titulo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("descricao"),rs.getDouble("salario"),rs.getString("Benefícios"),rs.getString("experiencia")));

    
                 
            }
        }return listar; 
          
        
    }
        
            public List<Vagas_Emprego> buscarVagas(String searchQuery) throws SQLException {
    List<Vagas_Emprego> listar = new ArrayList<>();
    String sql = "SELECT * FROM vagas WHERE nome LIKE ? OR email LIKE ?";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
        
         pst.setString(1, "%" + searchQuery + "%");
        pst.setString(2, "%" + searchQuery + "%");


            ResultSet rs = pst.executeQuery();

               while(rs.next()){
                   
                
               listar.add(new Vagas_Emprego(rs.getInt("id"),rs.getString("titulo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("descricao"),rs.getDouble("salario"),rs.getString("Benefícios"),rs.getString("experiencia")));

    
                 
            }
        }return listar; 
          
        
    }
}
