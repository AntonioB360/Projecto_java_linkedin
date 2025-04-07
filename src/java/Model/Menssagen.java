/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Menssagen {
    
    private int id_remetente;
    private int id_destinatario;
    private String conteudo;

    public Menssagen(int id_remetente, int id_destinatario, String conteudo) {
        this.id_remetente = id_remetente;
        this.id_destinatario = id_destinatario;
        this.conteudo = conteudo;
    }

    public int getId_remetente() {
        return id_remetente;
    }

    public void setId_remetente(int id_remetente) {
        this.id_remetente = id_remetente;
    }

    public int getId_destinatario() {
        return id_destinatario;
    }

    public void setId_destinatario(int id_destinatario) {
        this.id_destinatario = id_destinatario;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }
    
    
    
    
}
