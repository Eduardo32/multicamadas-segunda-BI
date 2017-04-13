/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Professor;
import util.Conexao;

/**
 *
 * @author ALUNO
 */
public class ProfessorDAO {
    
    public static ResultSet rs;
    public static String SQL;
    
    public static ResultSet pesquisarPorLogin(Professor professor) {
        SQL = "select cod_login, login, senha ";
        SQL += "from login ";
        SQL += "where login = '" + professor.getLogin()+ "'";
        
        System.out.println(SQL);
        rs = Conexao.retornarDados(SQL);
        
        return rs;
    }
    
    public static ResultSet pesquisarPorCod(Professor professor) {
        SQL = "select nome ";
        SQL += "from professores ";
        SQL += "where professores.login_cod_login = '" + professor.getCodigo()+ "'";
        
        System.out.println(SQL);
        rs = Conexao.retornarDados(SQL);
        
        return rs;
    }
    
    public static void inserirLogin(Professor professor) {
        SQL = "insert into login (login, senha) ";
        SQL += "value('" + professor.getLogin()+ "','" + professor.getSenha() + "')";
        System.out.println(SQL);
        Conexao.manipularDados(SQL);
    }
    
    public static void inserirProfessor(Professor professor) {
        inserirLogin(professor);
        
        rs = pesquisarPorLogin(professor);
        try {
            if(rs.next()) {
                SQL = "insert into professores (nome, Login_cod_Login) ";
                SQL += "value('" + professor.getNome() + "','" + rs.getString(1) + "')";
                System.out.println(SQL);
                Conexao.manipularDados(SQL);
            }
        } catch (SQLException ex) {
            System.out.println("não foi");
            Logger.getLogger(ProfessorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
