
package ModelDao;

import Connection.DBConnection;
import Model.OrderDetail;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDetailDao {
    public static ArrayList<OrderDetail> getAllOrderDetail() {
        ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_OrderDetail_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt("OrderID"), rs.getInt("ProductID"),
                rs.getInt("Stock"), rs.getFloat("PriceOrder")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addOrderDetail(OrderDetail orderdetail){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_OrderDetail_addOrderDetail(?,?,?,?)}");
            cstmt.setInt(1, orderdetail.getOrderID());
            cstmt.setInt(2, orderdetail.getProductID());
            cstmt.setInt(3, orderdetail.getStock());
            cstmt.setFloat(4, orderdetail.getPriceOrder());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateOrderDetail(OrderDetail orderdetail){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_OrderDetail_updateOrderDetail(?,?,?,?)}");
            cstmt.setInt(1, orderdetail.getOrderID());
            cstmt.setInt(2, orderdetail.getProductID());
            cstmt.setInt(3, orderdetail.getStock());
            cstmt.setFloat(4, orderdetail.getPriceOrder());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteOrderDetail(int ProductID, int OrderID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_OrderDetail_deleteOrderDetail(?,?)}");
            cstmt.setInt(1, OrderID);
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
    
    public static OrderDetail getOrderDetailbyID(int ProductID, int OrderID){
        OrderDetail orderdetail = new OrderDetail();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_OrderDetail_getByOrderDetailID(?,?)}");
            cstmt.setInt(1, OrderID);
            cstmt.setInt(2, ProductID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                orderdetail = new OrderDetail(rs.getInt("OrderID"), rs.getInt("ProductID"),
                rs.getInt("Stock"), rs.getFloat("PriceOrder"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return orderdetail;
    }
}
