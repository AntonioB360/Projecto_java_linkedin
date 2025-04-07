/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Comentario {
    
    private int id_postagem;
    private int id_usuario;
    private String conteudo;

    public Comentario(int id_postagem, int id_usuario, String conteudo) {
        this.id_postagem = id_postagem;
        this.id_usuario = id_usuario;
        this.conteudo = conteudo;
    }

    public int getId_postagem() {
        return id_postagem;
    }

    public void setId_postagem(int id_postagem) {
        this.id_postagem = id_postagem;
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
    
    
    
    
}
