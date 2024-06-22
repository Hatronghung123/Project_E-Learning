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
//        System.out.println((dao.getAccountByEmailPass("tuong0505ht@gmail.com", "10101010")).getEmail());
//        System.out.println(dao.checkAccountExist("tuong0505ht@gmail.com"));
////        dao.insertUser(new Account("tuongdeptrai@gmail.com", "67676767", 4), new Profile("Pham Cat Tuong", 0));
//        Account a = dao.getAccountByEmailPass("tuong0505ht@gmail.com", "10101010");
//        System.out.println(dao.getProfile(a).getFullname());
//        System.out.println("Succesfully");
      
System.out.println(dao.getAccountById(1));
    }
    
    
public Account getAccountById(int accid) {
        connection = getConnection();
        String sql = """
                    SELECT [AccountId], [Email], [Password], [RoleId]
                       FROM [Project Online Learning].[dbo].[Account]
                       WHERE [AccountId] = ?;""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accid);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int account_id = resultSet.getInt(1);
                String email = resultSet.getString(2);
                String pass = resultSet.getString(3);
                int role_id = resultSet.getInt(4);
                
                return new Account(email, pass, role_id);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    //tra ve account theo EMAIL & PASS
    public Account getAccountByEmailPass(String email, String password) {
        connection = getConnection();
        String sql = """
                     SELECT [AccountId]
                           ,[Email]
                           ,[Password]
                           ,[Status]
                           ,[RoleId]
                       FROM [dbo].[Account]  where Email like ? and Password like ?""";
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

    // login with google
    public Account getAccountGoogle(String email) {
        connection = getConnection();
        String sql = """
                     SELECT [AccountId]
                           ,[Email]
                           ,[Password]
                           ,[Status]
                           ,[RoleId]
                       FROM [dbo].[Account]  where Email like ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
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

    public void insertUser(Account account, Profile profile) {
        insertAccount(account);
        Account new_insert_account = getAccountByEmailPass(account.getEmail(), account.getPassword());
        insertProfile(profile, new_insert_account.getAccount_id());
    }

    public void insertAccount(Account account) {
        connection = getConnection();
        String sql_account = """
                             INSERT INTO [dbo].[Account]
                                        ([Email]
                                        ,[Password]
                                        ,[Status]
                                        ,[RoleId])
                                  VALUES
                                        (?,?,1,?)""";
        try {
            statement = connection.prepareStatement(sql_account);
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getPassword());
            statement.setInt(3, account.getRole_id());

            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void insertProfile(Profile profile, int account_id) {
        connection = getConnection();
        String sql_profile = """
                             INSERT INTO [dbo].[Profile]
                                        ([ProfileId]
                                        ,[FullName]
                                        ,[Gender]
                                        ,[Avatar]
                                        ,[Money]
                                        ,[ManagedBy])
                                  VALUES
                                        (?,?,null,null,0,?)""";

        try {
            statement = connection.prepareStatement(sql_profile);
            statement.setInt(1, account_id);
            statement.setString(2, profile.getFullname());
            if (profile.getManaged_by() == 0) {
                statement.setString(3, null);
            } else {
                statement.setInt(3, profile.getManaged_by());
            }
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Profile getProfile(Account account_login) {
        connection = getConnection();
        String sql = """
                     SELECT [ProfileId]
                           ,[FullName]
                           ,[Gender]
                           ,[Avatar]
                           ,[Money]
                           ,[ManagedBy]
                       FROM [Project Online Learning].[dbo].[Profile]
                       where ProfileId = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, account_login.getAccount_id());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int profile_id = resultSet.getInt(1);
                String fullname = resultSet.getString(2);
                boolean gender = resultSet.getBoolean(3);
                String avt = resultSet.getString(4);
                double money = resultSet.getDouble(5);
                int manageBy = resultSet.getInt(6);
                return new Profile(profile_id, fullname, gender, avt, money, manageBy);
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
        String sql = """
                     select COUNT(AccountId) as NumberOfAccount from Account
                       where Email = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1) != 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public void updatePassword(Account account) {
        connection = getConnection();
        String sql = """
                     UPDATE [dbo].[Account]
                        SET [Password] = ?
                          
                      WHERE Email = ?""";
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
        String sql = "UPDATE Account\n"
                + "   SET \n"
                + "      [Password] = ?\n"
                + "      \n"
                + " WHERE AccountId = ?";
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

//    public void updateEmail_ByAccId(String email, int account_id) {
//        connection = getConnection();
//        String sql = "UPDATE Account\n"
//                + "   SET \n"
//                + "      [Email] = ?\n"
//                + "      \n"
//                + " WHERE AccountId = ?";
//        try {
//            statement = connection.prepareStatement(sql);
//            statement.setString(1, email);
//            statement.setInt(2, account_id);
//            // thực thi câu lệnh
//            statement.executeUpdate();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//    }
    ///Profile
    public void updateFullName_ByAccId(String fullname, int account_id) {
        connection = getConnection();
        String sql = """
                     UPDATE [dbo].[Profile]
                        SET [FullName] =  ?
                      WHERE ProfileId = ?""";
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
        String sql = """
                     UPDATE [dbo].[Profile]
                     SET [Gender] =  ?
                     WHERE ProfileId = ?""";
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

    public void updateAvatar_ByAccId(String avt_path_in_server, int account_id) {
        connection = getConnection();
        String sql = """
                      update Profile
                      set Avatar = ?
                      where ProfileId = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, avt_path_in_server);
            statement.setInt(2, account_id);
            // thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
