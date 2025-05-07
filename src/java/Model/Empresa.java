/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author T
 */
public class Empresa {
   
    private int id;
   private String nome;
   private String setor;
   private String localizacao;
   private String webSite;
    private String sobre;
    private String logo;
    private String email;
    private String status;
    private String senha;

    public Empresa(int id, String nome, String setor, String localizacao, String webSite, String sobre, String logo, String email, String status, String senha) {
        this.id = id;
        this.nome = nome;
        this.setor = setor;
        this.localizacao = localizacao;
        this.webSite = webSite;
        this.sobre = sobre;
        this.logo = logo;
        this.email = email;
        this.status = status;
        this.senha = senha;
    }

    public Empresa(int id, String nome, String setor, String localizacao, String webSite, String sobre, String logo, String email, String senha) {
        this.id = id;
        this.nome = nome;
        this.setor = setor;
        this.localizacao = localizacao;
        this.webSite = webSite;
        this.sobre = sobre;
        this.logo = logo;
        this.email = email;
        this.senha = senha;
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

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getSobre() {
        return sobre;
    }

    public void setSobre(String sobre) {
        this.sobre = sobre;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

   
    
    
}
