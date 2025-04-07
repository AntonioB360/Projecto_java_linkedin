/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Recomendacao_Habilidades {
    
    private int id_usuario;
    private int id_habilidade;
    private String recomendador;

    public Recomendacao_Habilidades(int id_usuario, int id_habilidade, String recomendador) {
        this.id_usuario = id_usuario;
        this.id_habilidade = id_habilidade;
        this.recomendador = recomendador;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_habilidade() {
        return id_habilidade;
    }

    public void setId_habilidade(int id_habilidade) {
        this.id_habilidade = id_habilidade;
    }

    public String getRecomendador() {
        return recomendador;
    }

    public void setRecomendador(String recomendador) {
        this.recomendador = recomendador;
    }
    
    
    
}
