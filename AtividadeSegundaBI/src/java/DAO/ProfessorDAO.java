/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import modelo.Professor;
import util.Conexao;

/**
 *
 * @author ALUNO
 */
public class ProfessorDAO {
    
    public static ResultSet rs;
    public static String SQL;
    
    public static ResultSet pesquisarLogin(Professor professor) {
        SQL = "select * ";
        SQL += "from login ";
        SQL += "where professores_matricula = '" + professor.getMatricula() + "'";
        
        System.out.println(SQL);
        rs = Conexao.retornarDados(SQL);
        
        return rs;
    }
    
    public static ResultSet pesquisarProfessor(Professor professor) {
        SQL = "select * "
                + "from professores "
                + "where professores.matricula = '" + professor.getMatricula() + "'";
        
        System.out.println(SQL);
        rs = Conexao.retornarDados(SQL);
        
        return rs;
    }
    
    public static void inserirProfessor(Professor professor) {
        SQL = "insert into professores (campus, coordenador, matricula, nome) ";
        SQL += "value('" + professor.getCampus() + "','" + professor.getCoordenador() + "'"
                + ",'" + professor.getMatricula() + "','" + professor.getNome() + "')";
        
        System.out.println(SQL);
        Conexao.manipularDados(SQL);
        
        SQL = "";
        SQL = "insert into login (professores_matricula, senha) ";
        SQL += "value('" + professor.getMatricula()+ "','" + professor.getSenha() + "')";
        System.out.println(SQL);
        Conexao.manipularDados(SQL);
    }
}
