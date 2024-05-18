/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Entities.Account;
import java.sql.SQLException;

/**
 *
 * @author hatro
 */
public class AccountDAO extends DBContext {

    public Account findByEmailAndPass(Account accout) {
        connection = getConnection();
        String sql = "SELECT [uid]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[amount]\n"
                + "      ,[code]\n"
                + "      ,[roleid]\n"
                + "  FROM [dbo].[account]\n"
                + "  where email like ? and password like ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, accout.getEmail());
            statement.setString(2, accout.getPassword());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int uid = resultSet.getInt(1);
                String username = resultSet.getString(2);
                String password = resultSet.getString(3);
                String email = resultSet.getString(4);
                double amount = resultSet.getDouble(5);
                String code = resultSet.getString(6);
                int roleid = resultSet.getInt(7);
                Account account = new Account(uid, username, password, email, amount, code, roleid);
                return account;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    
    
    public Account insertAccount(Account account) {
        connection = getConnection();
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[amount]\n"
                + "           ,[code]\n"
                + "           ,[roleid])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, 2)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, account.getFullname());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getEmail());
            statement.setDouble(4, account.getAmount());
            statement.setString(5, account.getCode());

            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return account;
    }

    
     public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
//        Account account = new Account("cao", "123", "cao1@gmail.com",1000,"abv");
        Account sqlTest = new Account("1234", "tuong0505ht@gmail.com");
        System.out.println(dao.findByEmailAndPass(sqlTest));
    }
    public Account checkAccountIsExit(Account account) {
        connection = getConnection();
        String sql = "SELECT [uid]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[amount]\n"
                + "      ,[code]\n"
                + "      ,[roleid]\n"
                + "  FROM [dbo].[account]\n"
                + "  where email like ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, account.getEmail());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int uid = resultSet.getInt(1);
                String fullname = resultSet.getString(2);
                String password = resultSet.getString(3);
                String email = resultSet.getString(4);
                double amount = resultSet.getDouble(5);
                String code = resultSet.getString(6);
                int roleid = resultSet.getInt(7);
                Account accountCheckIsExit = new Account(uid, fullname, password, email, amount, code, roleid);
                return accountCheckIsExit;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public Account findByEmail(Account accout) {
        connection = getConnection();
        String sql = "SELECT [uid]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[amount]\n"
                + "      ,[code]\n"
                + "      ,[roleid]\n"
                + "  FROM [dbo].[account]\n"
                + "  where email like ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, accout.getEmail());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int uid = resultSet.getInt(1);
                String username = resultSet.getString(2);
                String password = resultSet.getString(3);
                String email = resultSet.getString(4);
                double amount = resultSet.getDouble(5);
                String code = resultSet.getString(6);
                int roleid = resultSet.getInt(7);
                Account account = new Account(uid, username, password, email, amount, code, roleid);
                return account;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    

}
