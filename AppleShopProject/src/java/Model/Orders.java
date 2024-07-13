
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Orders {
    private int orderID, userOrder;
    private LocalDate dateOrder;
    private String status;

    public Orders() {
    }

    public Orders(int orderID, int userOrder, String dateOrder, String status) {
        this.orderID = orderID;
        this.userOrder = userOrder;
        this.dateOrder = LocalDate.parse(dateOrder, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        this.status = status;
    }

    public Orders(int userOrder, String dateOrder, String status) {
        this.userOrder = userOrder;
        this.dateOrder = LocalDate.parse(dateOrder, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(int userOrder) {
        this.userOrder = userOrder;
    }

    public String getDateOrder() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd").format(dateOrder);
    }

    public void setDateOrder(LocalDate dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
