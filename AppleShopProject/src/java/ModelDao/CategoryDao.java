
package ModelDao;

import Connection.DBConnection;
import Model.Category;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryDao {
    public static ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<Category>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("select * from Category");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addCategory(Category category){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("INSERT INTO Category (CategoryName) VALUES (?)");
            cstmt.setString(1, category.getCategoryName());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateCategory(Category category){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("update Category set CategoryName=? where CategoryID=?");
            cstmt.setString(1, category.getCategoryName());
            cstmt.setInt(2, category.getCategoryID());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteCategory(int CategoryID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("delete from Category where CategoryID=?");
            cstmt.setInt(1, CategoryID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Category getCategorybyID(int CategoryID){
        Category category = new Category();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("SELECT * FROM Category WHERE CategoryID = ?");
            cstmt.setInt(1, CategoryID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                category = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return category;
    }
}
