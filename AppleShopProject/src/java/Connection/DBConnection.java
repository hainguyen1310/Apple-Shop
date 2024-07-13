
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static String username = "sa";
    private static String password = "123";
    private static String jdbcURL = "jdbc:sqlserver://HAINGUYEN\\SQLEXPRESS;databaseName=AppleStorePRJ;encrypt=true;trustServerCertificate=true;loginTimeout=30";
    //kết nối datebase dùng URL username, password. Thả ra lỗi 
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName(driverClass);
            con = DriverManager.getConnection(jdbcURL, username, password);
        } catch (Exception e){
            System.out.println("Error: " + e);
        }
        return con;
    }
}
