package utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBC {
    //資料庫驅動
    private static Properties properties = null;
    /** Connection 不能為靜態類別 否則重整後關閉連線池後續會出現 No operations allowed after connection closed. */
//    private static Connection conn = null;
    public static Connection getConnection() {
        /** 要寫在這 每次呼叫時重新建立連線 */
        Connection conn = null;
        try {
            InputStream in = JDBC.class.getClassLoader().getResourceAsStream("dbconfig.properties");
            properties = new Properties();
            properties.load(in);
        } catch (Exception e){
            throw new RuntimeException(e);
        }

        try {
            Class.forName(properties.getProperty("driver"));
            System.out.println("Driver loaded!");
        } catch (ClassNotFoundException e) {
            System.out.println("找不到驅動程式類別");
            e.printStackTrace();
        }

        if(conn == null) {
            try {
                conn = DriverManager.getConnection(
                        properties.getProperty("url"),
                        properties.getProperty("user"),
                        properties.getProperty("password"));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
