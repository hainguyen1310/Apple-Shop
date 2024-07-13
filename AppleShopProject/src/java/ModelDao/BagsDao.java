
package ModelDao;

import Connection.DBConnection;
import Model.Bags;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BagsDao {
    public static ArrayList<Bags> getAllBags() {
        ArrayList<Bags> list = new ArrayList<Bags>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Bags_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Bags(rs.getInt("UserID"), rs.getInt("ProductID"), rs.getBoolean("Status"),
                rs.getInt("Stock")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addBags(Bags bags){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Bags_addBags(?,?,?,?)}");
            cstmt.setInt(1, bags.getUserID());
            cstmt.setInt(2, bags.getProductID());
            cstmt.setBoolean(3, bags.isStatus());
            cstmt.setInt(4, bags.getStock());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateBags(Bags bags){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Bags_updateBags(?,?,?,?)}");
            cstmt.setInt(1, bags.getUserID());
            cstmt.setInt(2, bags.getProductID());
            cstmt.setBoolean(3, bags.isStatus());
            cstmt.setInt(4, bags.getStock());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteBags(int ProductID, int UserID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Bags_deleteBags(?,?)}");
            cstmt.setInt(1, UserID);
            cstmt.setInt(2, ProductID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Bags getBagsbyID(int ProductID, int UserID){
        Bags bags = new Bags();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Bags_getByBagsID(?,?)}");
            cstmt.setInt(1, UserID);
            cstmt.setInt(2, ProductID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                bags = new Bags(rs.getInt("UserID"), rs.getInt("ProductID"), rs.getBoolean("Status"),
                rs.getInt("Stock"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return bags;
    }
}
