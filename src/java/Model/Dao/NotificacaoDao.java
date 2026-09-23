/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Dao;

import Model.Notificacoes;
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
public class NotificacaoDao {

    public void registrar_notificacao(Notificacoes notificacao) throws SQLException {
        String sql = "INSERT INTO notificacoes (usuario_id, remetente_id,tipo, referencia_id) VALUES (?, ?, ?, ?)";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {
            pst.setInt(1, notificacao.getRemetente_id());  // quem gerou a notificação
            pst.setInt(2, notificacao.getId_usuario());     // quem vai receber a notificação
            pst.setString(3, notificacao.getTipo());
            pst.setInt(4, notificacao.getReferencia_id());

            pst.executeUpdate();
        }
    }

    public List<Notificacoes> buscar_notificacao(int id_usuario) throws SQLException {

        List<Notificacoes> listar = new ArrayList<>();

        String sql = """
                     SELECT r.nome, n.tipo, n.referencia_id, n.data_notificacao
                                 FROM notificacoes n
                                  JOIN usuarios r ON n.remetente_id = r.id
                                  WHERE n.usuario_id=?
                                  ORDER BY n.data_notificacao DESC""";

        try (Connection com = Conexao.getCom(); PreparedStatement pst = com.prepareStatement(sql)) {

            pst.setInt(1, id_usuario);
         

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Notificacoes not = new Notificacoes(rs.getString("nome"), rs.getString("tipo"), rs.getInt("referencia_id"), rs.getString("data_notificacao"));

                not.gerar_mensagem();

                listar.add(not);
            }

            return listar;
        }

    }

}
