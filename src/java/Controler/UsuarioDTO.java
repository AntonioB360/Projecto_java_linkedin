/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controler;

/**
 *
 * @author T
 */
public class UsuarioDTO {
    
     private int id;
    private String nome;
    private String email;
    private String cargo;
    private String empresa;
    private String localizacao;
    private String resumo;
    private String foto_perfil;

    public UsuarioDTO(int id, String nome, String email, String cargo, String empresa, String localizacao, String resumo, String foto_perfil) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cargo = cargo;
        this.empresa = empresa;
        this.localizacao = localizacao;
        this.resumo = resumo;
        this.foto_perfil = foto_perfil;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getResumo() {
        return resumo;
    }

    public void setResumo(String resumo) {
        this.resumo = resumo;
    }

    public String getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(String foto_perfil) {
        this.foto_perfil = foto_perfil;
    }
    
    
    
}
