
package ModelDao;

import Connection.DBConnection;
import Model.Users;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDao {
    public static ArrayList<Users> getAllUsers() {
        ArrayList<Users> list = new ArrayList<Users>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_User_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Email")
                , rs.getString("Tel"),rs.getString("Password"), rs.getBoolean("Status"), rs.getInt("RoleID"), 
                rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Address"), rs.getString("Zipcode")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addUser(Users user){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_User_addUser(?,?,?,?,?,?)}");
            cstmt.setString(1, user.getUserName());
            cstmt.setString(2, user.getEmail());
            cstmt.setString(3, user.getTel());
            cstmt.setString(4, user.getPassword());
            cstmt.setBoolean(5, user.isStatus());
            cstmt.setInt(6, user.getRoleID());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateUsers(Users user){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_User_updateUser(?,?,?,?,?,?,?)}");
            cstmt.setInt(1, user.getUserID());
            cstmt.setString(2, user.getUserName());
            cstmt.setString(3, user.getEmail());
            cstmt.setString(4, user.getTel());
            cstmt.setString(5, user.getPassword());
            cstmt.setBoolean(6, user.isStatus());      
            cstmt.setInt(7, user.getRoleID());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateFullUsers(Users user){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_User_updateUser(?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setInt(1, user.getUserID());
            cstmt.setString(2, user.getUserName());
            cstmt.setString(3, user.getEmail());
            cstmt.setString(4, user.getTel());
            cstmt.setString(5, user.getPassword());
            cstmt.setBoolean(6, user.isStatus());      
            cstmt.setInt(7, user.getRoleID());
            cstmt.setString(5, user.getPassword());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteUsers(int UsersID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_User_deleteUser(?)}");
            cstmt.setInt(1, UsersID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Users getUsersbyID(int UsersID){
        Users user = new Users();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_User_getByUserID(?)}");
            cstmt.setInt(1, UsersID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                user = new Users(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Email")
                , rs.getString("Tel"),rs.getString("Password"), rs.getBoolean("Status"), rs.getInt("RoleID"), 
                rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Address"), rs.getString("Zipcode"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return user;
    }
}
