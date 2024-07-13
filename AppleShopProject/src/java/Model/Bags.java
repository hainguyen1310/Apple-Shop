
package Model;

public class Bags {
    private int userID, productID;
    private boolean status;
    private int stock;

    public Bags() {
    }

    public Bags(int userID, int productID, boolean status, int stock) {
        this.userID = userID;
        this.productID = productID;
        this.status = status;
        this.stock = stock;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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
