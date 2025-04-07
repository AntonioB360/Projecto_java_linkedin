/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
import java.sql.Timestamp;

public class Postagens {
    
    private int id;
    private int id_usuario;
    private String conteudo;
    private Usuario usuario;
    private String imagens;
    private Timestamp dataPostagem;


    public Postagens(int id, int id_usuario, String conteudo,String imagens) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.conteudo = conteudo;
        this.imagens = imagens;
    }

    public Postagens() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getImagens() {
        return imagens;
    }

    public void setImagens(String imagens) {
        this.imagens = imagens;
    }

    public Timestamp getDataPostagem() {
        return dataPostagem;
    }

    public void setDataPostagem(Timestamp dataPostagem) {
        this.dataPostagem = dataPostagem;
    }

  
    
    
}
