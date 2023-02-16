package utils;

public interface Constants {

    String DB_URL_CONNECTION = "jdbc:mysql://inf-edt.org:5508/m06uf4servlets?useUnicode=true&serverTimezone=UTC&useSSL=false";
    String DB_USER_CONNECTION = "root";
    String DB_PASS_CONNECTION = "jupiter";
    String GET_USER_PASS = "select * from usuari where usuari = ? and password = ?";
    String GET_USUARI_BY_ID = "select * from usuari where id = ?";
    String GET_ALL_POSTS = "select * from post p inner join usuari u on p.id_usuari = u.id order by p.id desc limit 100";
    String SET_POST = "insert into post (id_usuari, title, message, image, likes, dat) values (?,?,?,?,0,now())";
}
