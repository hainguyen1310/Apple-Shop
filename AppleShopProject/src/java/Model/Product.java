package Model;

import java.time.LocalDate;

public class Product {
    private int productId;
    private String productname;
    private int categoryId;
    private long price;
    private int stock;
    private LocalDate dateUpdate;
    private boolean status;
    private String imageUrl;
    private String description;
    private String metacontent;

    public Product() {
    }

    public Product(int productId, String productname, int categoryId, long price, int stock, LocalDate dateUpdate, boolean status, String imageUrl, String description, String metacontent) {
        this.productId = productId;
        this.productname = productname;
        this.categoryId = categoryId;
        this.price = price;
        this.stock = stock;
        this.dateUpdate = dateUpdate;
        this.status = status;
        this.imageUrl = imageUrl;
        this.description = description;
        this.metacontent = metacontent;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public LocalDate getDateUpdate() {
        return dateUpdate;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMetacontent() {
        return metacontent;
    }

    public void setMetacontent(String metacontent) {
        this.metacontent = metacontent;
    }
    
}
