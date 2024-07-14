
package ModelDao;

import Connection.DBConnection;
import Model.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrdersDao {
    public static ArrayList<Orders> getAllOrders() {
        ArrayList<Orders> list = new ArrayList<Orders>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from Orders");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getInt("OrderID"),rs.getInt("UserOrder"),rs.getString("DateOrder"),
                        rs.getString("Status")));
            }
            ps.close();
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
            PreparedStatement cstmt = con.prepareCall("insert into Orders(UserOrder,Status) values(?,?)");
            cstmt.setInt(1, order.getUserOrder());
            cstmt.setString(2, order.getStatus());
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
            PreparedStatement cstmt = con.prepareCall("update Orders set UserOrder = ?, Status = ?, DateOrder = ? where OrderID = @orderID");
            cstmt.setInt(4, order.getOrderID());
            cstmt.setInt(1, order.getUserOrder());
            cstmt.setString(2, order.getStatus());
            cstmt.setString(3,order.getDateOrder());
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
            PreparedStatement cstmt = con.prepareCall("delete from Orders where OrderID = ?");
            cstmt.setInt(1, OrdersID);
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
            PreparedStatement cstmt = con.prepareCall("select * from Orders where OrderID = ?");
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
