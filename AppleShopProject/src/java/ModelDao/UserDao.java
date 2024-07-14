package ModelDao;

import Connection.DBConnection;
import Model.Users;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDao {

    public static boolean validate(Users u) {
        boolean status = false;
        PreparedStatement ps = null;
        try {
            Connection con = DBConnection.getConnection();
            ps = con.prepareStatement("Select * from Users where UserName = ? and Password = ?");
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassword());
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    public static ArrayList<Users> getAllUsers() {
        ArrayList<Users> list = new ArrayList<Users>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Users");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserID(rs.getInt(1));
                u.setUserName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setTel(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setStatus(rs.getBoolean(6));
                u.setRoleID(rs.getInt(7));
                u.setFirstName(rs.getString(8));
                u.setLastName(rs.getString(9));
                u.setAddress(rs.getString(10));
                u.setZipcode(rs.getString(11));
                list.add(u);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static int addUser(Users user) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO Users (UserName, Email, Tel, Password, RoleID, FirstName, LastName, Address, Zipcode,Status) VALUES (?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getTel());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getRoleID());
            ps.setString(6, user.getFirstName());
            ps.setString(7, user.getLastName());
            ps.setString(8, user.getAddress());
            ps.setString(9, user.getZipcode());
            ps.setBoolean(10, true);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    public static int updateUsers(Users u) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update Users set UserName=?, Password=?, Email=?, RoleID=?,Tel=?, FirstName=?, LastName=?, Address=?, Zipcode=? where UserID=?");
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setInt(4, u.getRoleID());
            ps.setString(5, u.getTel());
            ps.setString(6, u.getFirstName());
            ps.setString(7, u.getLastName());
            ps.setString(8, u.getAddress());
            ps.setString(9, u.getZipcode());
            ps.setInt(10, u.getUserID());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

//    public static int updateFullUsers(Users user) {
//        int status = 0;
//        try {
//            Connection con = DBConnection.getConnection();
//            CallableStatement cstmt = con.prepareCall("{call usp_User_updateUser(?,?,?,?,?,?,?,?,?,?,?)}");
//            cstmt.setInt(1, user.getUserID());
//            cstmt.setString(2, user.getUserName());
//            cstmt.setString(3, user.getEmail());
//            cstmt.setString(4, user.getTel());
//            cstmt.setString(5, user.getPassword());
//            cstmt.setBoolean(6, user.isStatus());
//            cstmt.setInt(7, user.getRoleID());
//            cstmt.setString(5, user.getPassword());
//            ResultSet rs = cstmt.executeQuery();
//            status = cstmt.executeUpdate();
//            cstmt.close();
//            con.close();
//        } catch (Exception e) {
//            System.out.println("Error" + e);
//        }
//        return status;
//    }
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

    public static Users getUsersbyID(int UsersID) {
        Users user = new Users();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE UserID = ?");
            ps.setInt(1, UsersID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new Users(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Email"),
                        rs.getString("Tel"), rs.getString("Password"), rs.getBoolean("Status"), rs.getInt("RoleID"),
                        rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Address"), rs.getString("Zipcode"));
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return user;
    }

    public static int getRoleByUsername(String uname) {
        int role = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select RoleID from Users where UserName=?");
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
