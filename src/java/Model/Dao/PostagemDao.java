/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;


import Model.Postagens;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author us
 */
public class PostagemDao {

    public void cadastrar_usuario(Postagens postagem) throws SQLException {

        String sql = "insert into postagens (usuario_id,conteudo,imagem) values (?,?,?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setInt(1, postagem.getId_usuario());
            pst.setString(2, postagem.getConteudo());
            pst.setString(3, postagem.getImagens());

            pst.executeUpdate();
        }

    }
    
    public List<Postagens> listagem_postagens()throws SQLException{
        
        List<Postagens> listar= new ArrayList<>();
        
        String sql="select p.id,u.nome,u.foto_perfil,p.conteudo,p.data_publicacao, count(c.id) from postagens as p "
                + "join usuarios as u on p.usuario_id=u.id left join curtidas c on p.id=c.postagem_id group by p.id, "
                + "u.nome,u.foto_perfil,p.conteudo,p.data_publicacao order by p.data_publicacao desc";
        
        try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
            
        
            
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                
            Usuario user=new Usuario();
            user.setId(rs.getInt("id"));
            user.setNome(rs.getString("nome"));
            user.setFoto_perfil(rs.getString("foto_perfil"));
            
            Postagens post=new Postagens();
            post.setId(rs.getInt("id"));
            post.setConteudo(rs.getString("conteudo"));
            post.setDataPostagem(rs.getTimestamp("data_publicacao"));
          
            listar.add(post);
            }
        }
        return listar;
    }
}
