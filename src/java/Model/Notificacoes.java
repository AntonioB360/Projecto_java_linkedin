/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Notificacoes {
    
    private String remetentenome;
    private int id;
    private int id_usuario;
    private int remetente_id;
    private String tipo;
    private int referencia_id;
    private String mensagem;
    private String data_notificacao;

    
      public void gerar_mensagem(){
          
        switch(tipo){
    case "comentario":
        mensagem = remetentenome + " comentou sua postagem";
        break; // faltou
    case "conexao":
        mensagem = remetentenome + "fez-te um pedido de conexao";
        break;
}

      }

    public Notificacoes(int id, int id_usuario, int remetente_id, String tipo, int referencia_id) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.remetente_id = remetente_id;
        this.tipo = tipo;
        this.referencia_id = referencia_id;
    }

    public Notificacoes(String remetentenome, String tipo, int referencia_id, String data_notificacao) {
        this.remetentenome = remetentenome;
        this.tipo = tipo;
        this.referencia_id = referencia_id;
        this.data_notificacao = data_notificacao;
    }

      
      

    

    public String getRemetentenome() {
        return remetentenome;
    }

    public void setRemetentenome(String remetentenome) {
        this.remetentenome = remetentenome;
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

    public int getRemetente_id() {
        return remetente_id;
    }

    public void setRemetente_id(int remetente_id) {
        this.remetente_id = remetente_id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getReferencia_id() {
        return referencia_id;
    }

    public void setReferencia_id(int referencia_id) {
        this.referencia_id = referencia_id;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getData_notificacao() {
        return data_notificacao;
    }

    public void setData_notificacao(String data_notificacao) {
        this.data_notificacao = data_notificacao;
    }

    
}
