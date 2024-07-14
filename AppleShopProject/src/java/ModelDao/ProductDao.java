
package ModelDao;

import Connection.DBConnection;
import Model.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;

public class ProductDao {
    public static ArrayList<Product> getAllProduct(){
        ArrayList<Product> list = new ArrayList<Product>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from Product");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("CategoryID"),
                rs.getFloat("Price"), rs.getInt("Stock"), rs.getString("DateUpdate"), rs.getBoolean("Status"),
                rs.getString("ImageURL"), rs.getString("Description"), rs.getString("MetaContent")));
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addProduct(Product product){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("Insert into Product(ProductName,CategoryID,Price,Stock,Status,ImageURL,Description,MetaContent)"
                    + " values (?,?,?,?,?,?,?,?)");
            cstmt.setString(1, product.getProductName());
            cstmt.setInt(2, product.getCategoryID());
            cstmt.setFloat(3, product.getMoney());
            cstmt.setInt(4, product.getStock());
            cstmt.setBoolean(5, product.isStatus());
            cstmt.setString(6, product.getImageURL());
            cstmt.setString(7, product.getDescription());
            cstmt.setString(8, product.getMetaContent());
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateProduct(Product product){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("update Product set ProductName = ?, CategoryID = ?, "
                    + "Price = ?, Stock = ?, Status = ?, ImageURL = ?, "
                    + "Description = ?, MetaContent = ? where ProductID = ?");
            cstmt.setString(1, product.getProductName());
            cstmt.setInt(2, product.getCategoryID());
            cstmt.setFloat(3, product.getMoney());
            cstmt.setInt(4, product.getStock());
            cstmt.setBoolean(5, product.isStatus());
            cstmt.setString(6, product.getImageURL());
            cstmt.setString(7, product.getDescription());
            cstmt.setString(8, product.getMetaContent());
            cstmt.setInt(9, product.getProductID());
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteProduct(int ProductID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("Delete from Product where ProductID=?");
            cstmt.setInt(1, ProductID);
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Product getProductbyID(int ProductID){
        Product product = new Product();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("Select* from Product where ProductID=?");
            cstmt.setInt(1, ProductID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("CategoryID"),
                rs.getFloat("Price"), rs.getInt("Stock"), rs.getString("DateUpdate"), rs.getBoolean("Status"),
                rs.getString("ImageURL"), rs.getString("Description"), rs.getString("MetaContent"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return product;
    }
}
