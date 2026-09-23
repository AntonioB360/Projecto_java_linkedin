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
    
    private int id;
    private int id_postagem;
    private int id_usuario;
    private String conteudo;
    private String data_comentario;
    private Usuario usuarios;
    private int numero_coementarios;

    public Comentario(int id, int id_postagem, int id_usuario, String conteudo) {
        this.id = id;
        this.id_postagem = id_postagem;
        this.id_usuario = id_usuario;
        this.conteudo = conteudo;
    }

    public Comentario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getData_comentario() {
        return data_comentario;
    }

    public void setData_comentario(String data_comentario) {
        this.data_comentario = data_comentario;
    }

    public Usuario getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Usuario usuarios) {
        this.usuarios = usuarios;
    }

    public int getNumero_coementarios() {
        return numero_coementarios;
    }

    public void setNumero_coementarios(int numero_coementarios) {
        this.numero_coementarios = numero_coementarios;
    }

    
}
