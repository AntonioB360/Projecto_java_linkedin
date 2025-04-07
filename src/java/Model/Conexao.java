/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Conexao {
    private int usuario1_id;
    private int usuario2_id;
    private String status;

    public Conexao(int usuario1_id, int usuario2_id, String status) {
        this.usuario1_id = usuario1_id;
        this.usuario2_id = usuario2_id;
        this.status = status;
    }

    public int getUsuario1_id() {
        return usuario1_id;
    }

    public void setUsuario1_id(int usuario1_id) {
        this.usuario1_id = usuario1_id;
    }

    public int getUsuario2_id() {
        return usuario2_id;
    }

    public void setUsuario2_id(int usuario2_id) {
        this.usuario2_id = usuario2_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
}
