
package ModelDao;

import Connection.DBConnection;
import Model.Feedback;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FeedbackDao {
    public static ArrayList<Feedback> getAllFeedback() {
        ArrayList<Feedback> list = new ArrayList<Feedback>();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Feedback_getAll()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt("UserID"), rs.getInt("ProductID"), rs.getBoolean("Status"),
                rs.getInt("Rating"),rs.getString("DateUpdate")));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return list;
    }

    public static int addFeedback(Feedback feedback){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Feedback_addFeedback(?,?,?,?)}");
            cstmt.setInt(1, feedback.getUserID());
            cstmt.setInt(2, feedback.getProductID());
            cstmt.setBoolean(3, feedback.isStatus());
            cstmt.setInt(4, feedback.getRating());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int updateFeedback(Feedback feedback){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Feedback_updateFeedback(?,?,?,?,?)}");
            cstmt.setInt(1, feedback.getUserID());
            cstmt.setInt(2, feedback.getProductID());
            cstmt.setBoolean(3, feedback.isStatus());
            cstmt.setInt(4, feedback.getRating());
            cstmt.setString(5, feedback.getDate());
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static int deleteFeedback(int ProductID, int UserID){
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Feedback_deleteFeedback(?,?)}");
            cstmt.setInt(1, UserID);
            cstmt.setInt(2, ProductID);
            ResultSet rs = cstmt.executeQuery();
            status = cstmt.executeUpdate();
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return status;
    }
    
    public static Feedback getFeedbackbyID(int ProductID, int UserID){
        Feedback feedback = new Feedback();
        try {
            Connection con = DBConnection.getConnection();
            CallableStatement cstmt = con.prepareCall("{call usp_Feedback_getByFeedbackID(?,?)}");
            cstmt.setInt(1, UserID);
            cstmt.setInt(2, ProductID);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                feedback = new Feedback(rs.getInt("UserID"), rs.getInt("ProductID"), rs.getBoolean("Status"),
                rs.getInt("Rating"),rs.getString("DateUpdate"));
            }
            cstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return feedback;
    }
}
