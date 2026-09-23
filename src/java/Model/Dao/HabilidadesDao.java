/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Habilidades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author T
 */
public class HabilidadesDao {
    
    
    public void inserir_habilidades(Habilidades habilidades) throws SQLException{
        
        String sql="insert into habilidades (usuario_id, habilidade) values (?,?)";
        
        try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
            
            pst.setInt(1, habilidades.getId_usuario());
            pst.setString(2, habilidades.getHabilidade());
            
            pst.executeUpdate();
        }
    }
    
    
    
}
