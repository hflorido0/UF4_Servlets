package dao;

import model.Usuari;
import utils.Constants;

import java.sql.*;

public class Dao {
    private Connection conexion;
    public Dao() throws ClassNotFoundException, SQLException {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url =  Constants.DB_URL_CONNECTION;
            String user = Constants.DB_USER_CONNECTION;
            String pass = Constants.DB_PASS_CONNECTION;
            conexion = DriverManager.getConnection(url, user, pass);
    }

    public Usuari getUsuariPass(String user, String password) throws SQLException {
        Usuari usu = null;
        PreparedStatement ps = conexion.prepareStatement(Constants.GET_USER_PASS, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, user);
        ps.setString(2, password);
        System.out.println(ps.toString());
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                usu = new Usuari(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        }
        return usu;
    }
}
