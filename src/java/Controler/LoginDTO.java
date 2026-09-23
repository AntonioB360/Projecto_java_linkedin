/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controler;

/**
 *
 * @author T
 */
public class LoginDTO {
    
      
    private String senha;
    private String status;
    private String role;

    public LoginDTO(String senha, String status, String role) {
        this.senha = senha;
        this.status = status;
        this.role = role;
    }

 

    public void setSenha(String senha) {
        this.senha = senha;
    }

  

    public void setStatus(String status) {
        this.status = status;
    }

  

    public void setRole(String role) {
        this.role = role;
    }
    
    
    
}
