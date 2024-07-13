package Model;

import java.time.LocalDate;

public class News {
    private int newsId;
    private String title;
    private String Description;
    private String metacontent;
    private LocalDate dateUpdate;
    private boolean status;
    private String imageUrl;

    public News(int newsId, String title, String Description, String metacontent, LocalDate dateUpdate, boolean status, String imageUrl) {
        this.newsId = newsId;
        this.title = title;
        this.Description = Description;
        this.metacontent = metacontent;
        this.dateUpdate = dateUpdate;
        this.status = status;
        this.imageUrl = imageUrl;
    }

    public News() {
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getMetacontent() {
        return metacontent;
    }

    public void setMetacontent(String metacontent) {
        this.metacontent = metacontent;
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
    
}
