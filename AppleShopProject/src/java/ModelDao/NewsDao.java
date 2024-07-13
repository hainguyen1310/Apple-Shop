
package ModelDao;

import Connection.DBConnection;
import Model.News;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NewsDao {
    public static ArrayList<News> getAllNews() {
        ArrayList<News> list = new ArrayList<News>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_News_getAll()}");
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
            CallableStatement cstmt = con.prepareCall("{call usp_News_addNews(?,?,?,?,?)}");
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
            CallableStatement cstmt = con.prepareCall("{call usp_News_updateNews(?,?,?,?,?,?,?)}");
            cstmt.setInt(1, news.getNewsID());
            cstmt.setString(2, news.getTitle());
            cstmt.setString(3, news.getDescription());
            cstmt.setString(4, news.getMetaContent());
            cstmt.setBoolean(5, news.isStatus());
            cstmt.setString(6, news.getImageURL());
            cstmt.setString(7, news.getDateUpdate());
            ResultSet rs = cstmt.executeQuery();
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
            CallableStatement cstmt = con.prepareCall("{call usp_News_deleteNews(?)}");
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
            CallableStatement cstmt = con.prepareCall("{call usp_News_getByNewsID(?)}");
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
