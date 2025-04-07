/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Canidatura {
   
    private int id_usuario;
    private int id_vaga;

    public Canidatura(int id_usuario, int id_vaga) {
        this.id_usuario = id_usuario;
        this.id_vaga = id_vaga;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_vaga() {
        return id_vaga;
    }

    public void setId_vaga(int id_vaga) {
        this.id_vaga = id_vaga;
    }
    
    
    
    
}
