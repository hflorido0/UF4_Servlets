package model;

public class Usuari {
    private int id;
    private String usuari;
    private String password;
    private String email;
    private String linkedin;
    private String gitlab;

    public Usuari(int id, String usuari, String password, String email, String linkedin, String gitlab) {
        this.id = id;
        this.usuari = usuari;
        this.password = password;
        this.email = email;
        this.linkedin = linkedin;
        this.gitlab = gitlab;
    }

    public int getId() {
        return id;
    }

    public String getUsuari() {
        return usuari;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getLinkedin() {
        return linkedin;
    }

    public String getGitlab() {
        return gitlab;
    }
}
