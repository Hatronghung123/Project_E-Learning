/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import Model.CourseManageDTO;
import Model.ProfileDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class ProfileManageDAO extends DBContext{
    public static void main(String[] args) {
        ProfileManageDAO dao = new ProfileManageDAO();
        ArrayList<ProfileDTO> list = dao.getMyListManagedMentor(2);
        System.out.println(list.get(0).getFullname());
        
    }

     public ArrayList<ProfileDTO> getMyListManagedMentor(int manager_account_id) {
        connection = getConnection();
        ArrayList<ProfileDTO> list = new ArrayList<>();
        String sql = """
                     select * from Profile p
                     join Account a
                     on p.ProfileId = a.AccountId
                     where p.ManagedBy = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, manager_account_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int profile_id = resultSet.getInt(1);
                String full_name = resultSet.getString(2);
                String avatar = resultSet.getString(4);
                boolean gender = resultSet.getBoolean(3);
                float money = resultSet.getFloat(5);
                String email = resultSet.getString(8);
               
                
                list.add(new ProfileDTO(profile_id, full_name, gender, avatar, money, email));                        
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
