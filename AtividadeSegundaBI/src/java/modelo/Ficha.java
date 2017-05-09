
package modelo;

import java.util.Date;

public class Ficha {
    
    private int codFicha;
    private int numeroDeAulas;
    private String matriculaDocente;
    private int anoLetivo;
    private int semestre;
    private Date data;
    private Date hora;
    private String bloco;
    private String sala;
    private String descricao;

    public int getCodFicha() {
        return codFicha;
    }

    public void setCodFicha(int codFicha) {
        this.codFicha = codFicha;
    }
    
    public int getNumeroDeAulas() {
        return numeroDeAulas;
    }

    public void setNumeroDeAulas(int numeroDeAulas) {
        this.numeroDeAulas = numeroDeAulas;
    }
    
    public String getMatriculaDocente() {
        return matriculaDocente;
    }

    public void setMatriculaDocente(String matriculaDocente) {
        this.matriculaDocente = matriculaDocente;
    }

    public int getAnoLetivo() {
        return anoLetivo;
    }

    public void setAnoLetivo(int anoLetivo) {
        this.anoLetivo = anoLetivo;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public String getBloco() {
        return bloco;
    }

    public void setBloco(String bloco) {
        this.bloco = bloco;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
