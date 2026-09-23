/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Comentario;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author T
 */
public class ComentarioDao {
    
    
  public int comentar(Comentario comentario) throws SQLException {
    String sql = "INSERT INTO comentarios (postagem_id, usuario_id, conteudo) VALUES (?, ?, ?)";
    int idGerado = 0;

    try (Connection conn = Conexao.getCom();
         PreparedStatement pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        pst.setInt(1, comentario.getId_postagem());
        pst.setInt(2, comentario.getId_usuario());
        pst.setString(3, comentario.getConteudo());

        pst.executeUpdate();

        try (ResultSet rs = pst.getGeneratedKeys()) {
            if (rs.next()) {
                idGerado = rs.getInt(1); // Aqui você pega o ID gerado automaticamente
            }
        }
    }

    return idGerado;
}

    
   
   
   public List<Comentario> listar_comentarios(int id_postagem)throws SQLException{
      List<Comentario> listar= new ArrayList<>();
      
      String sql="select u.nome,c.conteudo,c.data_comentario from comentarios as c join usuarios as u on c.usuario_id=u.id where c.postagem_id=?";
      
      try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
          
          pst.setInt(1, id_postagem);
          
          ResultSet rs=pst.executeQuery();
          
          while(rs.next()){
              Usuario usuario=new Usuario();
              usuario.setNome(rs.getString("nome"));
              
              Comentario comentario=new Comentario();
              comentario.setConteudo(rs.getString("conteudo"));
              comentario.setData_comentario(rs.getString("data_comentario"));
              comentario.setUsuarios(usuario);
              listar.add(comentario);
          }
      }
       return listar;
   }
    
   


    
   
    
    
}
