package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
    //資料庫驅動
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String serverName = "localhost";
    private static final String database = "db01";
    //要連線到的資料庫地址
    private static final String url = "jdbc:mysql://" + serverName + "/" + database + "?serverTimezone=GMT%2B8";
    //資料庫的帳號和密碼
    private static final String user = "db01";
    private static final String password = "aa123456AA";
    private static Connection conn = null;  //資料庫連線物件，採用單例模式
//    static{
//        try {
//            Class.forName(driver);
//            System.out.println("Driver loaded!");
//        } catch (ClassNotFoundException e) {
//            System.out.println("找不到驅動程式類別");
//            e.printStackTrace();
//        }
//    }
    private JDBC() {
        try {
            Class.forName(driver);
            System.out.println("Driver loaded!");
        } catch (ClassNotFoundException e) {
            System.out.println("找不到驅動程式類別");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        if(conn==null) {
            try {
                conn = DriverManager.getConnection(url, user, password);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
//        return DriverManager.getConnection(url, user, password);
    }
}
