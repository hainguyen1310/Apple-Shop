package Model;

public class Bags {
    private int userId;
    private int productId;
    private boolean status;
    private int stock;

    public Bags() {
    }

    public Bags(int userId, int productId, boolean status, int stock) {
        this.userId = userId;
        this.productId = productId;
        this.status = status;
        this.stock = stock;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
}
