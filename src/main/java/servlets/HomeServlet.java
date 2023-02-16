package servlets;

import service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="home",urlPatterns={"/home.do","/home"})
public class HomeServlet extends HttpServlet {
    private Service service;

    public HomeServlet() {
        this.service = new Service();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("usu");
        String password = req.getParameter("pass");
        if (this.service.checkUserPass(user, password, req)) {
            req.setAttribute("posts", this.service.getPosts());
            getServletContext().getRequestDispatcher("/jsp/home.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Usuario o contraseña incorrectos");
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
