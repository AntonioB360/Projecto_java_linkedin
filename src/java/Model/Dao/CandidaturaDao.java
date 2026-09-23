/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Candidatura;
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
public class CandidaturaDao {
    
    
    
    
    public void registrar_candidatura(Candidatura candidatura )throws SQLException{
        
        String sql="insert into candidaturas (usuario_id,vaga_id) values (?,?)";
        
        try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
            
            pst.setInt(1, candidatura.getId_usuario());
            pst.setInt(2, candidatura.getId_vaga());
            
            pst.executeUpdate();
        }
    }
    
    
    
    public List<Candidatura> Listar_vagas_empresa(int id) throws SQLException {
    List<Candidatura> listar = new ArrayList<>();

    String sql = "SELECT u.id ,u.nome, u.cargo, c.status\n" +
"FROM usuarios AS u\n" +
"JOIN candidaturas AS c ON c.usuario_id = u.id\n" +
"WHERE c.vaga_id = ?";

    try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
        pst.setInt(1, id);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            // Cria o usuário
            Usuario user = new Usuario();
            user.setId(rs.getInt("id"));
            user.setNome(rs.getString("nome"));
            user.setCargo(rs.getString("cargo"));

            // Cria a candidatura
            Candidatura cd = new Candidatura();
            cd.setStatus(rs.getString("status"));
            cd.setUsuario(user);

            listar.add(cd);
        }
    }

    return listar;
}

    
    
     public void eliminar_candidatura(int id_usuario, int id_vaga) throws SQLException{
         
         String sql="delete from candidaturas  where usuario_id=? and vaga_id=?";
         
         try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
             
             pst.setInt(1, id_usuario);
               pst.setInt(2, id_vaga);
             
             pst.executeUpdate();
         }
     }   
   
public void finalizarcandidatura(int id_usuario) throws SQLException {
    String sql = "UPDATE candidaturas SET status ='finalizada' WHERE usuario_id = ?";

    try (Connection com = Conexao.getCom();
         PreparedStatement pst = com.prepareStatement(sql)) {

        pst.setInt(1, id_usuario);
       
        pst.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace(); // Importante para saber o erro exato
        throw e; // Repassa o erro para o Servlet
    }
}     
    
}
