/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Controler.LoginDTO;
import Controler.UsuarioDTO;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author us
 */
public class UsuarioDao {

        public void cadastrar_usuario(Usuario usuario) throws SQLException {

        String sql = "insert into usuarios (nome, email, senha, cargo, empresa, localizacao, resumo, foto_perfil,status) values (?,?,?,?,?,?,?,?,?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setString(1, usuario.getNome());
            pst.setString(2, usuario.getEmail());
            pst.setString(3, usuario.getSenha());
            pst.setString(4, usuario.getCargo());
            pst.setString(5, usuario.getEmpresa());
            pst.setString(6, usuario.getLocalizacao());
            pst.setString(7, usuario.getResumo());
            pst.setString(8, usuario.getStatus());
            pst.setString(9, usuario.getFoto_perfil());
            pst.executeUpdate();
        }
    }
 public LoginDTO validar_credenciais(String email, String senha) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setString(1, email);
            pst.setString(2, senha);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                
                LoginDTO login = new LoginDTO(rs.getString("senha"),rs.getString("status"),rs.getString("role"));
                
                
                // Preencha outros campos do objeto Usuario, se necessário
                return login;
            }
        }
        return null; // Retorna null se nenhum usuário for encontrado
    }
 
 
 
    public UsuarioDTO dados_usuarios(String email) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE email = ? ";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setString(1, email);
            

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                
                UsuarioDTO usuario = new UsuarioDTO(rs.getInt("id"),rs.getString("nome"),rs.getString("email"),rs.getString("cargo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("resumo"),rs.getString("foto_perfil"));
                
                
                // Preencha outros campos do objeto Usuario, se necessário
                return usuario;
            }
        }
        return null; // Retorna null se nenhum usuário for encontrado
    }
    
    
    
    
    
    
    public List<Usuario> Listar_user() throws SQLException {
        List<Usuario> listar=new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
        

            ResultSet rs = pst.executeQuery();

               while(rs.next()){
                   
                
               listar.add(new Usuario(rs.getInt("id"),rs.getString("nome"),rs.getString("email"),rs.getString("senha"),rs.getString("cargo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("resumo"),rs.getString("foto_perfil"),rs.getString("status")));

    
                 
            }
        }return listar; 
          
        
    }
    
     public List<Usuario> buscarUsuarios(String searchQuery) throws SQLException {
    List<Usuario> listar = new ArrayList<>();
    String sql = "SELECT * FROM usuarios WHERE nome LIKE ? OR email LIKE ?";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
        
         pst.setString(1, "%" + searchQuery + "%");
        pst.setString(2, "%" + searchQuery + "%");

            ResultSet rs = pst.executeQuery();

               while(rs.next()){
                   
                
                listar.add(new Usuario(rs.getInt("id"),rs.getString("nome"),rs.getString("email"),rs.getString("senha"),rs.getString("cargo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("resumo"),rs.getString("foto_perfil"),rs.getString("status")));
    
                 
            }
        }return listar; 

        
    }
     
            public void Eliminar_usuario(String id) throws SQLException {

        String sql = "delete from  usuarios where id=?";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setString(1, id);
           
            pst.executeUpdate();
        }
    }
            
            
            public void status_usuario( String status,String id) throws SQLException {

        String sql = "update usuarios set status=? where id=?";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

             pst.setString(1, status);
            pst.setString(2, id);
           
           
            pst.executeUpdate();
        }
    }
            
            public List<Usuario> listar_conexoes(int id_usuario)throws SQLException{
                
                List<Usuario> listar=new ArrayList<>();
                
                String sql="""
            SELECT * FROM usuarios u
            WHERE u.id != ?
              AND u.id NOT IN (
                SELECT usuario2_id FROM conexoes WHERE usuario1_id = ?
                UNION
                SELECT usuario1_id FROM conexoes WHERE usuario2_id = ?
              )
        """;
                
                try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
                    
                    pst.setInt(1, id_usuario);
            pst.setInt(2, id_usuario);
            pst.setInt(3, id_usuario);
            
              ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                 u.setCargo(rs.getString("cargo"));
                 u.setEmpresa(rs.getString("empresa"));
                listar.add(u);
                }
                
            
           
            }
           return listar;      
}
            
              public List<Usuario> Perfil_user(int id_usuario) throws SQLException {
        List<Usuario> listar=new ArrayList<>();
        String sql = "SELECT * FROM usuarios where id=?";
        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
        
           pst.setInt(1, id_usuario);
            ResultSet rs = pst.executeQuery();

               while(rs.next()){
                   
                
               listar.add(new Usuario(rs.getInt("id"),rs.getString("nome"),rs.getString("email"),rs.getString("senha"),rs.getString("cargo"),rs.getString("empresa"),rs.getString("localizacao"),rs.getString("resumo"),rs.getString("foto_perfil"),rs.getString("status")));

    
                 
            }
        }return listar; 
          
        
    }
}
