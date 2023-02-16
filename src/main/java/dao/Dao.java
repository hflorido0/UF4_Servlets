package dao;

import model.Post;
import model.Usuari;
import utils.Constants;

import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

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

    public ArrayList<Post> getPosts() throws SQLException {
        ArrayList<Post> posts = new ArrayList<>();
        PreparedStatement ps = conexion.prepareStatement(Constants.GET_ALL_POSTS, Statement.RETURN_GENERATED_KEYS);
        System.out.println(ps.toString());
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Usuari usu = new Usuari(rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(11));
                posts.add(new Post(rs.getInt(1),
                        rs.getString(3),
                        rs.getString(5),
                        rs.getBytes(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(4),
                        usu));
            }
        }

        return posts;
    }

    public Usuari getUsuariById(String id) throws SQLException {
        Usuari usu = null;
        PreparedStatement ps = conexion.prepareStatement(Constants.GET_USUARI_BY_ID, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, id);
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

    public void setPost(Post post, Part filePart) throws SQLException, IOException {
        PreparedStatement ps = conexion.prepareStatement(Constants.SET_POST, Statement.RETURN_GENERATED_KEYS);

        // Convertir la parte en un arreglo de bytes
        InputStream inputStream = filePart.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = outputStream.toByteArray();

        ps.setInt(1, post.getUsuari().getId());
        ps.setString(2, post.getTitle());
        ps.setString(3, post.getMissatge());
        ps.setBytes(4, imageBytes);
        System.out.println(ps.toString());
        ps.executeUpdate();
    }
}
