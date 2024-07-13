
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Feedback {
    private int userID, productID;
    private boolean status;
    private int rating;
    private LocalDate date;

    public Feedback() {
    }

    public Feedback(int userID, int productID, boolean status, int rating, String date) {
        this.userID = userID;
        this.productID = productID;
        this.status = status;
        this.rating = rating;
        this.date = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDate() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd").format(date);
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
    
}
