package utils;

public interface Constants {

    String DB_URL_CONNECTION = "jdbc:mysql://inf-edt.org:5508/m06uf4servlets?useUnicode=true&serverTimezone=UTC&useSSL=false";
    String DB_USER_CONNECTION = "root";
    String DB_PASS_CONNECTION = "jupiter";
    String GET_USER_PASS = "select * from usuari where usuari = ? and password = ?";
}
