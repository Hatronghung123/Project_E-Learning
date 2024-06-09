/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import Model.Profile;
import java.sql.SQLException;

/**
 *
 * @author hatro
 */
public class AccountDAO extends DBContext {

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
//        Account account = new Account("cao", "123", "cao1@gmail.com",1000,"abv");
        Account sqlTest = new Account("tuananh2003hy@gmail.com", "12345678");
        System.out.println(dao.getAccountByEmailPass("tuananh2003hy@gmail.com", "12345678"));
    }

    public Account getAccountByEmailPass(String email, String password) {
        connection = getConnection();
        String sql = "SELECT [account_id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[is_active]\n"
                + "      ,[managed_by]\n"
                + "  FROM [dbo].[tbl_account]"
                + "  where email like ? and password like ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int account_id = resultSet.getInt(1);
                String email_in_db = resultSet.getString(2);
                String password_in_db = resultSet.getString(3);
                int role_id = resultSet.getInt(4);
                boolean active = resultSet.getBoolean(5);
                int managed_by = resultSet.getInt(6);

                return new Account(account_id, email_in_db, password_in_db, role_id, active, managed_by);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void insertUser(Account account, Profile profile) {
        insertAccount(account);
        insertProfile(profile, account.getAccount_id());
    }

    public void insertAccount(Account account) {
        connection = getConnection();
        String sql_account = "INSERT INTO [dbo].[tbl_account]\n"
                + "           ([email]\n"
                + "           ,[password]\n"
                + "           ,[role_id]\n"
                + "           ,[is_active]\n"
                + "           ,[managed_by])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?))";
        try {
            statement = connection.prepareStatement(sql_account);
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getPassword());
            statement.setInt(3, account.getRole_id());
            statement.setBoolean(4, account.isActive());
            statement.setInt(5, account.getManaged_by());

            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void insertProfile(Profile profile, int account_id) {
        connection = getConnection();
        String sql_profile = "INSERT INTO [dbo].[tbl_profile]\n"
                + "           ([fullname]\n"
                + "           ,[gender]\n"
                + "           ,[account_id]\n"
                + "           ,[avatar]\n"
                + "           ,[money])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,0)";

        try {
            statement = connection.prepareStatement(sql_profile);
            statement.setString(1, profile.getFullname());
            statement.setBoolean(2, profile.isGender());
            statement.setInt(3, account_id);
            statement.setString(4, profile.getAvt());
            statement.setDouble(5, profile.getMoney());

            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    /*
    
SELECT [profile_id]
      ,[fullname]
      ,[gender]
      ,[account_id]
      ,[avatar]
      ,[money]
  FROM [dbo].[tbl_profile]
  where account_id = 2
     */
    public Profile getProfile(Account account_login) {
        connection = getConnection();
        String sql = "SELECT [profile_id]\n"
                + "      ,[fullname]\n"
                + "      ,[gender]\n"
                + "      ,[account_id]\n"
                + "      ,[avatar]\n"
                + "      ,[money]\n"
                + "  FROM [dbo].[tbl_profile]\n"
                + "  where account_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, account_login.getAccount_id());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int profile_id = resultSet.getInt(1);
                String fullname = resultSet.getString(2);
                boolean gender = resultSet.getBoolean(3);
                String avt = resultSet.getString(5);
                double money = resultSet.getDouble(6);

                return new Profile(profile_id, fullname, gender, avt, money);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

//    public Account checkAccountIsExit(Account account) {
//        connection = getConnection();
//        String sql = "SELECT [uid]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[email]\n"
//                + "      ,[amount]\n"
//                + "      ,[code]\n"
//                + "      ,[roleid]\n"
//                + "  FROM [dbo].[account]\n"
//                + "  where email like ?";
//        try {
//            statement = connection.prepareStatement(sql);
//            statement.setString(1, account.getEmail());
//            resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                int uid = resultSet.getInt(1);
//                String fullname = resultSet.getString(2);
//                String password = resultSet.getString(3);
//                String email = resultSet.getString(4);
//                double amount = resultSet.getDouble(5);
//                String code = resultSet.getString(6);
//                int roleid = resultSet.getInt(7);
//                Account accountCheckIsExit = new Account(uid, fullname, password, email, amount, code, roleid);
//                return accountCheckIsExit;
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//        return null;
//    }
    public boolean checkAccountExist(String email) {
        connection = getConnection();
        String sql = "SELECT [account_id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[is_active]\n"
                + "      ,[managed_by]\n"
                + "  FROM [dbo].[tbl_account]\n"
                + "  where email = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int account_id = resultSet.getInt(1);
                String account_email_in_db = resultSet.getString(2);
                String password = resultSet.getString(3);
                int role_id = resultSet.getInt(4);
                boolean active = resultSet.getBoolean(5);
                int managed_by = resultSet.getInt(6);
                Account accountCheckIsExit = new Account(account_id, email, password, role_id, active, managed_by);
                return accountCheckIsExit != null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

//    public Account findByEmail(String acc_email) {
//        connection = getConnection();
//        String sql = "SELECT [uid]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[email]\n"
//                + "      ,[amount]\n"
//                + "      ,[code]\n"
//                + "      ,[roleid]\n"
//                + "  FROM [dbo].[account]\n"
//                + "  where email like ?";
//        try {
//            statement = connection.prepareStatement(sql);
//            statement.setString(1, acc_email);
//            resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                int uid = resultSet.getInt(1);
//                String username = resultSet.getString(2);
//                String password = resultSet.getString(3);
//                String email = resultSet.getString(4);
//                double amount = resultSet.getDouble(5);
//                String code = resultSet.getString(6);
//                int roleid = resultSet.getInt(7);
//                Account account = new Account(uid, username, password, email, amount, code, roleid);
//                return account;
//            }
//
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//        return null;
//    }
    public void updatePassword(Account account) {
        connection = getConnection();
        String sql = "UPDATE [dbo].[tbl_account]\n"
                + "   SET \n"
                + "      [password] = ?\n"
                + "      \n"
                + " WHERE email = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, account.getPassword());
            statement.setString(2, account.getEmail());
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updatePassword_ByAccId(String password, int account_id) {
        connection = getConnection();
        String sql = "UPDATE [dbo].[tbl_account]\n"
                + "   SET \n"
                + "      [password] = ?\n"
                + "      \n"
                + " WHERE account_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, password);
            statement.setInt(2, account_id);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateEmail_ByAccId(String email, int account_id) {
        connection = getConnection();
        String sql = "UPDATE [dbo].[tbl_account]\n"
                + "   SET \n"
                + "      [email] = ?\n"
                + "      \n"
                + " WHERE account_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setInt(2, account_id);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    ///Profile
    public void updateFullName_ByAccId(String fullname, int account_id) {
        connection = getConnection();
        String sql = "UPDATE [dbo].[tbl_profile]\n"
                + "   SET [fullname] = ?\n"
                + "      \n"
                + " WHERE account_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setInt(2, account_id);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateGender_ByAccId(Boolean gender, int account_id) {
        connection = getConnection();
        String sql = "UPDATE [dbo].[tbl_profile]\n"
                + "   SET gender = ?\n"
                + "      \n"
                + " WHERE account_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setBoolean(1, gender);
            statement.setInt(2, account_id);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
