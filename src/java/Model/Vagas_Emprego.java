/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author us
 */
public class Vagas_Emprego {

    private int id;
    private  String titulo;
    private String empresa;
    private String localizacao;
    private String descricao;
    private Double salario;
    private String Benefícios;
    private String experiencia;
    private int empresa_id;

    public Vagas_Emprego(int id, String titulo, String empresa, String localizacao, String descricao, Double salario, String Benefícios, String experiencia, int empresa_id) {
        this.id = id;
        this.titulo = titulo;
        this.empresa = empresa;
        this.localizacao = localizacao;
        this.descricao = descricao;
        this.salario = salario;
        this.Benefícios = Benefícios;
        this.experiencia = experiencia;
        this.empresa_id = empresa_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }

    public String getBenefícios() {
        return Benefícios;
    }

    public void setBenefícios(String Benefícios) {
        this.Benefícios = Benefícios;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }

    public int getEmpresa_id() {
        return empresa_id;
    }

    public void setEmpresa_id(int empresa_id) {
        this.empresa_id = empresa_id;
    }

   
    
    
}
