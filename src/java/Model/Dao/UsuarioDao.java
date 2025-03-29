/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

  import java.sql.Connection;
  import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author us
 */
public class UsuarioDao {
    
    
    
    public void cadastrar_usuario(Usuario usuario)throws SQLException{
        
        String sql="insert into usuarios (nome, email, senha, cargo, empresa, localizacao, resumo, foto_perfil) values (?,?,?,?,?,?,?,?)";
        
        try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
            
            pst.setString(1, usuario.getNome());
             pst.setString(2, usuario.getEmail());
              pst.setString(3, usuario.getSenha());
               pst.setString(4, usuario.getCargo());
                pst.setString(5, usuario.getEmpresa());
                 pst.setString(6, usuario.getLocalizacao());
                  pst.setString(7, usuario.getResumo());
                    pst.setString(8,usuario.getFoto_perfil());
                    pst.executeUpdate();
        }
    }
    
    
    public  Usuario validar(String email,String senha){
        
        String sql
    }
    
}
