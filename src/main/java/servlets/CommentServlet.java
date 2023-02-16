package servlets;

import service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(name="comment",urlPatterns={"/comment.do","/comment"})
public class CommentServlet extends HttpServlet {
    private Service service;

    public CommentServlet() {
        this.service = new Service();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        req.setAttribute("id", id);
        if (this.service.getUserById(id, req)) {
            req.setAttribute("posts", this.service.getPosts());
            getServletContext().getRequestDispatcher("/jsp/home.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Se necesita hacer login para poder ver los posts");
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("titol");
        String missatge = req.getParameter("missatge");
        Part filePart = req.getPart("image");
        String id = req.getParameter("id");

        if (this.service.getUserById(id, req)) {
            if (!this.service.addPost(title, missatge, filePart, id, req)) {
                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            } else {
                req.setAttribute("id", id);
                req.setAttribute("posts", this.service.getPosts());
                getServletContext().getRequestDispatcher("/jsp/home.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "Se necesita hacer login para poder ver los posts");
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
