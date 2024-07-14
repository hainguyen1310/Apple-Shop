
package ModelDao;

import Connection.DBConnection;
import Model.News;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NewsDao {
    public static ArrayList<News> getAllNews() {
        ArrayList<News> list = new ArrayList<News>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("select * from News");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("NewsID"), rs.getString("Title"), rs.getString("Description")
                , rs.getString("MetaContent"), rs.getString("DateUpdate"), rs.getBoolean("Status")
                , rs.getString("ImageURL")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addNews(News news){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("INSERT INTO News (Title,Description,MetaContent,Status,ImageURL) VALUES (?,?,?,?,?)");
            cstmt.setString(1, news.getTitle());
            cstmt.setString(2, news.getDescription());
            cstmt.setString(3, news.getMetaContent());
            cstmt.setBoolean(4, news.isStatus());
            cstmt.setString(5, news.getImageURL());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateNews(News news){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement cstmt = con.prepareStatement("update News set Title = ?, Description = ?,MetaContent=?,Status=?,ImageURL=?,DateUpdate=? where NewsID=?");
            cstmt.setInt(7, news.getNewsID());
            cstmt.setString(1, news.getTitle());
            cstmt.setString(2, news.getDescription());
            cstmt.setString(3, news.getMetaContent());
            cstmt.setBoolean(4, news.isStatus());
            cstmt.setString(5, news.getImageURL());
            cstmt.setString(6, news.getDateUpdate());
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteNews(int NewsID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("delete from News where NewsID=?");
            cstmt.setInt(1, NewsID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static News getNewsbyID(int NewsID){
        News news = new News();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("select * from News where NewsID = ?");
            cstmt.setInt(1, NewsID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                news = new News(rs.getInt("NewsID"), rs.getString("Title"), rs.getString("Description")
                , rs.getString("MetaContent"), rs.getString("DateUpdate"), rs.getBoolean("Status")
                , rs.getString("ImageURL"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return news;
    }
}
