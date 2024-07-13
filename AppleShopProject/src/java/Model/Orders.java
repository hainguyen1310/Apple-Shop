package Model;

import java.time.LocalDate;

public class Orders {
    private int ordersId;
    private int userOrder;
    private LocalDate dateOrder;
    private boolean status;

    public Orders() {
    }

    public Orders(int ordersId, int userOrder, LocalDate dateOrder, boolean status) {
        this.ordersId = ordersId;
        this.userOrder = userOrder;
        this.dateOrder = dateOrder;
        this.status = status;
    }

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public int getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(int userOrder) {
        this.userOrder = userOrder;
    }

    public LocalDate getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(LocalDate dateOrder) {
        this.dateOrder = dateOrder;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
