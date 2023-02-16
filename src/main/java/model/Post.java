package model;

import javax.servlet.http.Part;
import java.util.Base64;

public class Post {
    private int id;
    private String title;
    private String missatge;
    private Object filePart;
    private int likes;
    private Usuari usuari;
    private String data;

    public Post(String title, String missatge, Part filePart, Usuari usuari) {
        this.title = title;
        this.missatge = missatge;
        this.filePart = filePart;
        this.usuari = usuari;
    }

    public Post(int id, String title, String missatge, byte[] blob, int likes, String data, Usuari usuari) {
        this.id = id;
        this.title = title;
        this.missatge = missatge;
        this.likes = likes;
        this.usuari = usuari;
        this.filePart = Base64.getEncoder().encodeToString(blob);
    }

    public String getTitle() {
        return title;
    }

    public String getMissatge() {
        return missatge;
    }

    public String getFilePart() {
        return (String) filePart;
    }

    public Usuari getUsuari() {
        return usuari;
    }
}
