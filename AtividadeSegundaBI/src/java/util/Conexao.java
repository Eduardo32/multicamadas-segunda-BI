package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {
    
    public static Connection conexao;
    public static Statement stm;
    public static ResultSet rs;
    
    public static void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Carregou a Classe");
            String usuario = "root";
            String senha = "root";
            String caminho = "jdbc:mysql://localhost:3306/Atividade2BI";
            try {
                conexao = DriverManager.getConnection(caminho,usuario,senha);
                stm = conexao.createStatement();
                System.out.println("Conexão Estabelecida");
            } catch (SQLException ex) {
                System.out.println("Conexão Não-Estabelecida");
                Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não Carregou a Classe");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void desconectar() {
        try {
            conexao.close();
            System.out.println("Conexão Fechada");
        } catch (SQLException ex) {
            System.out.println("Não foi possivel fechar a conexão");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void manipularDados(String SQL) {
        try {
            conectar();
            stm.executeUpdate(SQL);
            System.out.println("Dados Atualizados");
            desconectar();
        } catch (SQLException ex) {
            System.out.println("Não foi possivel atualizar os dados");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ResultSet retornarDados(String SQL) {
        try {
            conectar();
            rs = stm.executeQuery(SQL);
            System.out.println("Pesquisa Realisada");
        } catch (SQLException ex) {
            System.out.println("Pesquisa Não Realisada");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public static void main(String[] args) {
        conectar();
        desconectar();
    }
}
