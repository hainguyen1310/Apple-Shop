
package Model;

public class OrderDetail {
    private int orderID, productID, stock;
    private float priceOrder;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, int stock, float priceOrder) {
        this.orderID = orderID;
        this.productID = productID;
        this.stock = stock;
        this.priceOrder = priceOrder;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getPriceOrder() {
        return priceOrder;
    }

    public void setPriceOrder(float priceOrder) {
        this.priceOrder = priceOrder;
    }
    
}
