package ModelDao;

import Connection.DBConnection;
import Model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderDetailDao {

    public static ArrayList<OrderDetail> getAllOrderDetail(){
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
        try {
            Connection con = DBConnection.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("Select * from OrderDetail");
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt("OrderID"), rs.getInt("ProductID"),
                        rs.getInt("Stock"), rs.getFloat("PriceOrder")));
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addOrderDetail(OrderDetail orderdetail) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("insert into OrderDetail(OrderID,ProductID,StockOrder,PriceOrder)"
                    + "values(?,?,?,?)");
            cstmt.setInt(1, orderdetail.getOrderID());
            cstmt.setInt(2, orderdetail.getProductID());
            cstmt.setInt(3, orderdetail.getStock());
            cstmt.setFloat(4, orderdetail.getPriceOrder());
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    public static int updateOrderDetail(OrderDetail orderdetail) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("update OrderDetail set StockOrder = ?, PriceOrder = ? "
                    + "where OrderID = ? and ProductID = ?");
            cstmt.setInt(3, orderdetail.getOrderID());
            cstmt.setInt(4, orderdetail.getProductID());
            cstmt.setInt(1, orderdetail.getStock());
            cstmt.setFloat(2, orderdetail.getPriceOrder());
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    public static int deleteOrderDetail(int ProductID, int OrderID) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("delete from OrderDetail where OrderID = ? and ProductID = ?");
            cstmt.setInt(1, OrderID);
            cstmt.setInt(2, ProductID);
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }

    public static OrderDetail getOrderDetailbyID(int ProductID, int OrderID) {
        OrderDetail orderdetail = new OrderDetail();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareCall("select * from OrderDetail where OrderID = ? and ProductID = ?");
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
