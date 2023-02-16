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
    private String mail;

    public Post(String title, String missatge, Part filePart, Usuari usuari) {
        this.title = title;
        this.missatge = missatge;
        this.filePart = filePart;
        this.usuari = usuari;
    }

    public Post(int id, String title, String missatge, byte[] blob, int likes, String data, String mail, Usuari usuari) {
        this.id = id;
        this.title = title;
        this.missatge = missatge;
        this.likes = likes;
        this.usuari = usuari;
        this.data = data;
        this.mail = mail;
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

    public int getLikes() {
        return likes;
    }

    public String getData() {
        return data;
    }

    public String getMail() {
        return mail;
    }
}
