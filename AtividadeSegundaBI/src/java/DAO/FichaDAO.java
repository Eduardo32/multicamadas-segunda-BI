
package DAO;


import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import modelo.Ficha;
import util.Conexao;

public class FichaDAO {
    
    public static ResultSet rs;
    public static String SQL;
    public static SimpleDateFormat formaData = new SimpleDateFormat("yyyy-MM-dd");
    public static SimpleDateFormat formaHora = new SimpleDateFormat("HH:mm");
    
    public static void inserirFicha(Ficha ficha) {
        SQL = "insert into fichas (numeroDeAulas, professores_matricula, ano, semestre, dataAtendimento, horaAtendimento, bloco, sala, atividade) ";
        SQL += "value('" + ficha.getNumeroDeAulas() + "','" + ficha.getMatriculaDocente() + "','" + ficha.getAnoLetivo() + "','" + ficha.getSemestre() + "',"
                + "'" + formaData.format(ficha.getData()) + "','" + formaHora.format(ficha.getHora()) + "','" + ficha.getBloco() + "',"
                + "'" + ficha.getSala() + "','" + ficha.getDescricao() + "')";
        
        System.out.println(SQL);
        Conexao.manipularDados(SQL);
        
    }
    
    public static ResultSet pesquisarFichas(String ano, String semestre, String matricula) {
        SQL = "select * "
                + "from fichas "
                + "where fichas.professores_matricula = '" + matricula + "' && "
                + "fichas.ano = '" + ano + "' && "
                + "fichas.semestre = '" + semestre + "' "
                + "order by fichas.dataAtendimento";
        
        System.out.println(SQL);
        rs = Conexao.retornarDados(SQL);
        
        return rs;
    }
}
