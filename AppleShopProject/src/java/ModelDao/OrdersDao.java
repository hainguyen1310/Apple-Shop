
package ModelDao;

import Connection.DBConnection;
import Model.Orders;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrdersDao {
    public static ArrayList<Orders> getAllOrders() {
        ArrayList<Orders> list = new ArrayList<Orders>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Order_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getInt("OrdersID"),rs.getInt("UserOrder"),rs.getString("DateOrder"),
                        rs.getString("Status")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addOrders(Orders order){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Order_addOrder(?,? )}");
            cstmt.setInt(1, order.getUserOrder());
            cstmt.setString(2, order.getStatus());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateOrders(Orders order){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Order_updateOrder(?,?,?,?)}");
            cstmt.setInt(1, order.getOrderID());
            cstmt.setInt(2, order.getUserOrder());
            cstmt.setString(3, order.getStatus());
            cstmt.setString(4,order.getDateOrder());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteOrders(int OrdersID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Order_deleteOrder(?)}");
            cstmt.setInt(1, OrdersID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Orders getOrdersbyID(int OrdersID){
        Orders order = new Orders();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Order_getByOrderID(?)}");
            cstmt.setInt(1, OrdersID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                order = new Orders(rs.getInt("OrdersID"),rs.getInt("UserOrder"),rs.getString("DateOrder"),
                        rs.getString("Status"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return order;
    }
}
