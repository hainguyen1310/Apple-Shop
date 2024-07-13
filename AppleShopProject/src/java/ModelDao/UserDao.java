package ModelDao;

import Connection.DBConnection;
import Model.User;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    //hàm logic check tài khoản đã tồn tại hay chưa
    public static boolean validate(User u) {
        boolean status = false;
        PreparedStatement ps = null;
        try {
            Connection con = DBConnection.getConnection();
            ps = con.prepareStatement("Select * from Users where UserName = ? and Password = ?");
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    //CRUD - Create: Tạo mới tài khoản
    public static int regis(User u) {
        int status = 0;
        if (validate(u)) {
            return status;
        } else {
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("INSERT INTO Users (UserName, Password, Email, RoleID) VALUES (?,?,?,?)");
                ps.setString(1, u.getUsername());
                ps.setString(2, u.getPassword());
                ps.setString(3, u.getEmail());
                ps.setInt(4, u.getRoleId());
                status = ps.executeUpdate();
                con.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
            return status;
        }
    }

    //CRUD Update: Cập nhập tài khoản
    public static boolean update(User u) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update Users set UserName=?, Password=?, Email=?, RoleID=? where UserID=?");
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setInt(4, u.getRoleId());
            ps.setInt(5, u.getUserId());
            status = ps.executeUpdate() > 0;
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    //CRUD Delete: Xóa tài khoản
    public static int delete(int id) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from Users where UserID=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    //CRUD Read: xem danh sách tài khoản dựa trên Username
    public static User getUserByUserID(int id) {
        User u = new User();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT UserName, Password, Email, RoleID FROM Users WHERE UserID = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u.setUserId(id);
                u.setUsername(rs.getString(1));
                u.setPassword(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setRoleId(rs.getInt(4));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return u;
    }

    //CRUD Read: xem toàn bộ danh sách tài khoản
    public static ArrayList<User> getAllUsers() {
        ArrayList<User> list = new ArrayList<User>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Users");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setRoleId(rs.getInt(5));
                list.add(u);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public static int getRoleByUsername(String uname) {
        int role = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select RoleID from Users where Username=?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return role;
    }
}
