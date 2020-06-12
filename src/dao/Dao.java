package dao;

import java.sql.*;
public class Dao {
    Connection con = null;
    Statement stat = null;
    ResultSet rs = null;
    public Dao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gms?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8","root","123456");
            stat = con.createStatement();
        } catch (Exception e) {
// TODO: handle exception
            con = null;
            System.out.println("=====================数据库连接失败=====================");
            System.out.println("=====================请检查Dao文件=====================");
        }
    }
    public ResultSet executeQuery(String sql) {
        try {
            rs = stat.executeQuery(sql);
        } catch (Exception e) {
// TODO: handle exception
            rs = null;
        }
        return rs;
    }
    public int executeUpdate(String sql) {
        try {
            stat.executeUpdate(sql);
            return 0;
        } catch (Exception e) {
// TODO: handle exception
        }
        return -1;
    }


    public int executeModify(String sql) {
        try {
            stat.executeUpdate(sql);
            return 0;
        } catch (Exception e) {
// TODO: handle exception
        }
        return -1;
    }
}
