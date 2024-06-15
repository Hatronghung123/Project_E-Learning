/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import java.sql.SQLException;

/**
 *
 * @author tuong
 */
public class EnrollmentDAO extends DBContext {
    public static void main(String[] args) {
        
    }
    
    
    public Account getAccountByEmailPass(String email, String password) {
        connection = getConnection();
        String sql = "";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int account_id = resultSet.getInt(1);
                String email_in_db = resultSet.getString(2);
                String password_in_db = resultSet.getString(3);
                int role_id = resultSet.getInt(5);
                boolean status = resultSet.getBoolean(4);

                return new Account(account_id, email_in_db, password_in_db, status, role_id);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    
}
