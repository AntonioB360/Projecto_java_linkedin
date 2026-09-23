/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Curtidas;
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

    public List<Postagens> listagem_postagens() throws SQLException {

        List<Postagens> listar = new ArrayList<>();

        String sql = "SELECT p.id, u.nome, u.foto_perfil, u.cargo, u.empresa, "
                + "p.conteudo, p.imagem, p.data_publicacao "
                + "FROM postagens AS p "
                + "JOIN usuarios AS u ON p.usuario_id = u.id "
                + "ORDER BY p.data_publicacao DESC";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {

                Usuario user = new Usuario();
                user.setId(rs.getInt("id")); // isso pega o id da postagem, não do usuário
                user.setNome(rs.getString("nome"));
                user.setFoto_perfil(rs.getString("foto_perfil"));
                user.setCargo(rs.getString("cargo"));
                user.setEmpresa(rs.getString("empresa"));

                Postagens post = new Postagens();
                int idPostagem = rs.getInt("id");

                post.setId(idPostagem);
                post.setImagens(rs.getString("imagem"));
                post.setConteudo(rs.getString("conteudo"));
                post.setDataPostagem(rs.getTimestamp("data_publicacao"));
                post.setUsuario(user);

                // ✅ AQUI: pega o número de curtidas da postagem
                int curtidas = quantidade_post(idPostagem);
                post.setNumero_curtidas(curtidas);
                int comentario = contarComentariosPorPostagem(idPostagem);
                post.setNumero_comentario(comentario);

                listar.add(post);
            }
        }

        return listar;
    }

    public Postagens buscarPorId(int id) throws SQLException {
        String sql = "SELECT p.id, p.conteudo, p.imagem, p.data_publicacao, u.id AS usuario_id, u.nome, u.foto_perfil, u.cargo, u.empresa "
                + "FROM postagens p JOIN usuarios u ON p.usuario_id = u.id WHERE p.id = ?";
        try (Connection conn = Conexao.getCom(); PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("usuario_id"));
                u.setNome(rs.getString("nome"));
                u.setFoto_perfil(rs.getString("foto_perfil"));
                u.setCargo(rs.getString("cargo"));
                u.setEmpresa(rs.getString("empresa"));

                Postagens p = new Postagens();
                int idPostagem = rs.getInt("id");

                p.setId(idPostagem);
                p.setConteudo(rs.getString("conteudo"));
                p.setImagens(rs.getString("imagem"));
                p.setDataPostagem(rs.getTimestamp("data_publicacao"));
                p.setUsuario(u);

                int curtidas = quantidade_post(idPostagem);
                p.setNumero_curtidas(curtidas);
                return p;
            }

        }
        return null;
    }

    public void curtir_postagem(Curtidas curtida) throws SQLException {

        String sql = "insert into curtidas (postagem_id,usuario_id) values (?,?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setInt(1, curtida.getId_postagem());
            pst.setInt(2, curtida.getId_usuario());

            pst.executeUpdate();
        }

    }

    public int quantidade_post(int id) throws SQLException {
        String sql = "select count(id) as numero_curtida  from curtidas where postagem_id=?;";
        int total = 0;

        try (Connection conn = Conexao.getCom(); PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {

                total = rs.getInt("numero_curtida");

            }
        }
        return total;
    }

    public int contarComentariosPorPostagem(int id) throws SQLException {
        String sql = "select count(id) as numero_comentario  from comentarios where postagem_id=?";

        int total = 0;

        try (Connection conn = Conexao.getCom(); PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {

                total = rs.getInt("numero_comentario");

            }
        }
        return total;
    }

    public void eliminarPostagem(int id, int usuario_id) throws SQLException {
        String sql = "delete from postagens where id=? and usuario_id=?";

        try (Connection conn = Conexao.getCom(); PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, id);
            pst.setInt(2, usuario_id);
            pst.executeUpdate();
        }

    }

}
