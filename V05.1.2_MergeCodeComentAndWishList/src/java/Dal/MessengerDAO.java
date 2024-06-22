package Dal;

import Model.Account;
import Model.Messenger;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MessengerDAO extends DBContext {
   
    public static void main(String[] args) {
        MessengerDAO test = new MessengerDAO();

        try {

 System.out.println(test.getListMessengerBetween2User(2, 1));
        } catch (SQLException ex) {
            Logger.getLogger(MessengerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }
// Gửi Tin Nhắn Mới
    public void insertNewMessenger(Messenger mess) {
        String sql = """
            INSERT INTO [Project Online Learning].[dbo].[Message] ([SenderId], [ReceiverId], [MessageText], [MessageTime])
            VALUES (?, ?, ?, CURRENT_TIMESTAMP);
        """;
        
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, mess.getSender_id());
            statement.setInt(2, mess.getReceiver_id());
            statement.setString(3, mess.getMessenger_text());
            // statement.setDate(4, new java.sql.Date(mess.getMessenger_time().getTime())); 
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            
        }
    }
    //Lấy Danh Sách Tin Nhắn Giữa Hai Người Dùng
    public ArrayList<Messenger> getListMessengerBetween2User(int sender, int receiver) throws SQLException {
        ArrayList<Messenger> list = new ArrayList<>();
        String sql = """
            SELECT [MessageId], [SenderId], [ReceiverId], [MessageText], [MessageTime]
            FROM [Project Online Learning].[dbo].[Message]
            WHERE ([SenderId] = ? AND [ReceiverId] = ?)
               OR ([SenderId] = ? AND [ReceiverId] = ?)
            ORDER BY [MessageTime] ASC;
        """;
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);) {
             
            
            ps.setInt(1, sender);
            ps.setInt(2, receiver);
            ps.setInt(3, receiver);
            ps.setInt(4, sender);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int mess_id = rs.getInt(1);
                    int sender_id = rs.getInt(2);
                    int receiver_id = rs.getInt(3);
                    String mess_text = rs.getString(4);
                    Date mess_time = rs.getDate(5); 
                   
                    list.add(new Messenger(mess_id, sender_id, receiver_id, mess_text, mess_time));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi");
        }
        return list;
    }
    
    //Kết Nối Thông Tin Người Dùng Với Tin Nhắn
   public ArrayList<Messenger> getConnectUserWithMessenger() throws SQLException {
    ArrayList<Messenger> list = new ArrayList<>();
    String sql = """
        SELECT m.[MessageId], m.[SenderId], a1.[AccountId] AS SenderId, m.[ReceiverId], a2.[AccountId] AS ReceiverId, m.[MessageText], m.[MessageTime]
        FROM [Project Online Learning].[dbo].[Message] m
        JOIN [Project Online Learning].[dbo].[Account] a1 ON m.SenderId = a1.AccountId
        JOIN [Project Online Learning].[dbo].[Account] a2 ON m.ReceiverId = a2.AccountId
        ORDER BY m.[MessageTime] ASC;
    """;
    
    try {
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int mess_id = rs.getInt(1);
            int sender_id = rs.getInt(2);
            int receiver_id = rs.getInt(3);
            String mess_text = rs.getString(4);
            Timestamp mess_time = rs.getTimestamp("MessageTime");  

            list.add(new Messenger(mess_id, sender_id, receiver_id, mess_text, mess_time));
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("Lỗi");
    }
    return list;
}
    
    
    
}