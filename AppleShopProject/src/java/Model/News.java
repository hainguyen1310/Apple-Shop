
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class News {
    private int newsID;
    private String title, description, metaContent;
    private LocalDate dateUpdate;
    private boolean status;
    private String imageURL;

    public News() {
    }

    public News(int newsID, String title, String description, String metaContent, String dateUpdate, boolean status, String imageURL) {
        this.newsID = newsID;
        this.title = title;
        this.description = description;
        this.metaContent = metaContent;
        this.dateUpdate = LocalDate.parse(dateUpdate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        this.status = status;
        this.imageURL = imageURL;
    }

    public News(String title, String description, String metaContent, String dateUpdate, boolean status, String imageURL) {
        this.title = title;
        this.description = description;
        this.metaContent = metaContent;
        this.dateUpdate = LocalDate.parse(dateUpdate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        this.status = status;
        this.imageURL = imageURL;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getDateUpdate() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd").format(dateUpdate);
    }

    public void setDateUpdate(String dateUpdate) {
        this.dateUpdate = LocalDate.parse(dateUpdate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
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
    
}
