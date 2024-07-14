package ModelDao;

import Connection.DBConnection;
import Model.Bags;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BagsDao {

    public static ArrayList<Bags> getAllBags() throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Bags> list = new ArrayList<Bags>();
        try {
            Connection con = DBConnection.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("Select * from Bags");
            while (rs.next()) {
                list.add(new Bags(rs.getInt("UserID"), rs.getInt("ProductID"), rs.getBoolean("Status"),
                        rs.getInt("Stock")));
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        } finally {
            stmt.close();
            rs.close();
        }
        return list;
    }

    public static int addBags(Bags bags) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("insert into Bags(UserID,ProductID,Status,Stock)"
                    + "values(?,?,?,?)");
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

    public static int updateBags(Bags bags) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("update Bags set Status = ?, Stock = ?"
                    + "where UserID = ? and ProductID = ?");
            cstmt.setInt(3, bags.getUserID());
            cstmt.setInt(4, bags.getProductID());
            cstmt.setBoolean(1, bags.isStatus());
            cstmt.setInt(2, bags.getStock());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    public static int deleteBags(int ProductID, int UserID) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("delete from Bags where UserID = ? and ProductID = ?");
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

    public static Bags getBagsbyID(int ProductID, int UserID) {
        Bags bags = new Bags();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("select * from Bags where UserID = ? and ProductID = ?");
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
