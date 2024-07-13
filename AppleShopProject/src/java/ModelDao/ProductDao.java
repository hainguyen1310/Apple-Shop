
package ModelDao;

import Connection.DBConnection;
import Model.Product;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDao {
    public static ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<Product>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Product_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("CategoryID"),
                rs.getFloat("Price"), rs.getInt("Stock"), rs.getString("DateUpdate"), rs.getBoolean("Status"),
                rs.getString("ImageURL"), rs.getString("Description"), rs.getString("MetaContent")));
            }
            cstmt.close();
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
            CallableStatement cstmt = con.prepareCall("{call usp_Product_addProduct(?,?,?,?,?,?,?,?)}");
            cstmt.setString(1, product.getProductName());
            cstmt.setInt(2, product.getCategoryID());
            cstmt.setFloat(3, product.getMoney());
            cstmt.setInt(4, product.getStock());
            cstmt.setBoolean(5, product.isStatus());
            cstmt.setString(6, product.getImageURL());
            cstmt.setString(7, product.getDescription());
            cstmt.setString(8, product.getMetaContent());
            ResultSet rs = cstmt.executeQuery();
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
            CallableStatement cstmt = con.prepareCall("{call usp_Product_updateProduct(?,?,?,?,?,?,?,?,?)}");
            cstmt.setInt(1, product.getProductID());
            cstmt.setString(2, product.getProductName());
            cstmt.setInt(3, product.getCategoryID());
            cstmt.setFloat(4, product.getMoney());
            cstmt.setInt(5, product.getStock());
            cstmt.setBoolean(6, product.isStatus());
            cstmt.setString(7, product.getImageURL());
            cstmt.setString(8, product.getDescription());
            cstmt.setString(9, product.getMetaContent());
            ResultSet rs = cstmt.executeQuery();
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
            CallableStatement cstmt = con.prepareCall("{call usp_Product_deleteProduct(?)}");
            cstmt.setInt(1, ProductID);
            ResultSet rs = cstmt.executeQuery();
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
            CallableStatement cstmt = con.prepareCall("{call usp_Product_getByProductID(?)}");
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
