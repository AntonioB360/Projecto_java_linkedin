/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;
import Model.Menssagen;
import Model.Usuario;
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
public class MensagemDao {
    
    
    public void enviarMensagem(Menssagen mensagem) throws SQLException {
    String sql = "INSERT INTO mensagens (remetente_id, destinatario_id, conteudo) VALUES (?, ?, ?)";
    
    try (Connection conn = Conexao.getCom();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, mensagem.getId_remetente());
        stmt.setInt(2, mensagem.getId_destinatario());
        stmt.setString(3, mensagem.getConteudo());
        
        stmt.executeUpdate();
    }
}
    
    
    public List<Menssagen> listarResumosConversas(int usuario_id) throws SQLException{
        
        List<Menssagen> listar_mensagem=new ArrayList<>();
        
        String sql="""
        SELECT sub.usuario_id,
               u.nome AS nome_contato,
               sub.ultima_mensagem,
               sub.data_envio
        FROM (
            SELECT 
                CASE 
                    WHEN m.remetente_id = ? THEN m.destinatario_id
                    ELSE m.remetente_id
                END AS usuario_id,
                MAX(m.data_envio) AS data_envio,
                (SELECT m2.conteudo
                 FROM mensagens m2
                 WHERE (m2.remetente_id = m.remetente_id AND m2.destinatario_id = m.destinatario_id)
                    OR (m2.remetente_id = m.destinatario_id AND m2.destinatario_id = m.remetente_id)
                 ORDER BY m2.data_envio DESC
                 LIMIT 1) AS ultima_mensagem
            FROM mensagens m
            WHERE m.remetente_id = ? OR m.destinatario_id = ?
            GROUP BY usuario_id
        ) AS sub
        JOIN usuarios u ON u.id = sub.usuario_id
        ORDER BY sub.data_envio DESC
    """;
        
        try(Connection com=Conexao.getCom(); PreparedStatement pst=com.prepareStatement(sql)){
            
            pst.setInt(1, usuario_id);
            pst.setInt(2, usuario_id);
            pst.setInt(3, usuario_id);
            
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                
                Usuario user=new Usuario();
                user.setNome(rs.getString("nome_contato"));
                user.setId(rs.getInt("usuario_id"));
                
                  Menssagen rc = new Menssagen();
                  
                  rc.setConteudo(rs.getString("ultima_mensagem"));
                  rc.setData_envio(rs.getString("data_envio"));
                  rc.setUsuario(user);
                  listar_mensagem.add(rc);
            }
        }
        return  listar_mensagem;
    }
    
    public List<Menssagen> listarMensagensEntreUsuarios(int idUsuario1, int idUsuario2)throws SQLException {
        List<Menssagen> mensagens = new ArrayList<>();
        String sql = """
            SELECT m.*, 
                   remetente.nome AS nome_remetente, 
                   destinatario.nome AS nome_destinatario
            FROM mensagens AS m
            JOIN usuarios AS remetente ON m.remetente_id = remetente.id
            JOIN usuarios AS destinatario ON m.destinatario_id = destinatario.id
            WHERE (m.remetente_id = ? AND m.destinatario_id = ?)
               OR (m.remetente_id = ? AND m.destinatario_id = ?)
            ORDER BY m.data_envio
        """;

        try (Connection conn = Conexao.getCom();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario1);
            stmt.setInt(2, idUsuario2);
            stmt.setInt(3, idUsuario2);
            stmt.setInt(4, idUsuario1);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Menssagen m = new Menssagen();
               
                m.setConteudo(rs.getString("conteudo"));
                m.setData_envio(rs.getString("data_envio"));

                Usuario remetente = new Usuario();
                remetente.setId(rs.getInt("remetente_id"));
                remetente.setNome(rs.getString("nome_remetente"));

                Usuario destinatario = new Usuario();
                destinatario.setId(rs.getInt("destinatario_id"));
                destinatario.setNome(rs.getString("nome_destinatario"));

                m.setRemetente(remetente);
                m.setDestinatario(destinatario);
               

                mensagens.add(m);
            }

        } 

        return mensagens;
    }
}
