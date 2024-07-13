
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Product {
    private int productID;
    private String productName;
    private int categoryID;
    private float money;
    private int stock;
    private LocalDate dateUpdate;
    private boolean status;
    private String imageURL, description, metaContent;

    public Product() {
    }

    public Product(int productID, String productName, int categoryID, float money, int stock, String dateUpdate, boolean status, String imageURL, String description, String metaContent) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.money = money;
        this.stock = stock;
        this.dateUpdate = LocalDate.parse(dateUpdate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        this.status = status;
        this.imageURL = imageURL;
        this.description = description;
        this.metaContent = metaContent;
    }

    public Product(String productName, int categoryID, float money, int stock, String dateUpdate, boolean status, String imageURL, String description, String metaContent) {
        this.productName = productName;
        this.categoryID = categoryID;
        this.money = money;
        this.stock = stock;
        this.dateUpdate = LocalDate.parse(dateUpdate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        this.status = status;
        this.imageURL = imageURL;
        this.description = description;
        this.metaContent = metaContent;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDateUpdate() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd").format(dateUpdate);
    }

    public void setDateUpdate(LocalDate dateUpdate) {
        this.dateUpdate = dateUpdate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMetaContent() {
        return metaContent;
    }

    public void setMetaContent(String metaContent) {
        this.metaContent = metaContent;
    }
    
}
