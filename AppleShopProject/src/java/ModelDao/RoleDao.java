package ModelDao;

import Connection.DBConnection;
import Model.Role;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RoleDao {

    public static ArrayList<Role> getAllRole() {
        ArrayList<Role> list = new ArrayList<Role>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Role_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Role(rs.getInt("RoleID"), rs.getString("RoleName")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addRole(Role role){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Role_addRole(?)}");
            cstmt.setString(1, role.getRoleName());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateRole(Role role){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Role_updateRole(?,?)}");
            cstmt.setString(1, role.getRoleName());
            cstmt.setInt(2, role.getRoleID());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteRole(int roleID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Role_deleteRole(?)}");
            cstmt.setInt(1, roleID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Role getRolebyID(int roleID){
        Role role = new Role();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Role_getByRoleID(?)}");
            cstmt.setInt(1, roleID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                role = new Role(rs.getInt("RoleID"), rs.getString("RoleName"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return role;
    }
}
