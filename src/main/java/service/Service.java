package service;

import dao.Dao;
import model.Usuari;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

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
            return this.dao.getUsuariPass(user, password) != null;
        } catch (SQLException e) {
            req.setAttribute("error", e.getMessage());
            return false;
        }
    }
}
