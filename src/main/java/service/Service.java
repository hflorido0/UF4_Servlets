package service;

import dao.Dao;
import model.Post;
import model.Usuari;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Service {
    private Dao dao;
    public Service() {
        try {
            this.dao = new Dao();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkUserPass(String user, String password, HttpServletRequest req) {
        try {
            Usuari usu = this.dao.getUsuariPass(user, password);
            if (usu != null) req.setAttribute("id", usu.getId() + "");
            return usu != null;
        } catch (SQLException e) {
            req.setAttribute("error", e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Post> getPosts() {
        try {
            return this.dao.getPosts();
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public boolean addPost(String title, String missatge, Part filePart, String id, HttpServletRequest req) {
        try {
            Post post = new Post(title, missatge, filePart, this.dao.getUsuariById(id));
            this.dao.setPost(post, filePart);
            return true;
        } catch (SQLException | RuntimeException | IOException e) {
            req.setAttribute("error", e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean getUserById(String id, HttpServletRequest req) {
        try {
            return this.dao.getUsuariById(id) != null;
        } catch (SQLException e) {
            req.setAttribute("error", e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
