/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.ModuleDTO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tuong
 */
public class ModuleDAO extends DBContext{
    //Lấy lisst module theo course ID
    public ArrayList<Model.ModuleDTO> getListModulByCid(String courseId) throws SQLException {
        connection = getConnection();
        ArrayList<Model.ModuleDTO> list = new ArrayList<>();
        String sql = """
                      select * from Module where CourseId = ?
                       order by ModuleNumber asc""";
        try {
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, courseId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int moduleid = resultSet.getInt("ModuleId");
                String modulename = resultSet.getString("ModuleName");
                int module_number = resultSet.getInt("ModuleNumber");
                list.add(new Model.ModuleDTO(moduleid, modulename, module_number));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void insertModule(String courseId, ModuleDTO new_module){
        connection = getConnection();
        String sql = """
                      insert into Module
                      values
                      (?,?,?)""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, new_module.getModulename());
            statement.setString(2, courseId);
            statement.setInt(3, new_module.getModule_number());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ModuleDAO dao = new ModuleDAO();
        dao.insertModule("2", new ModuleDTO("ABC", 7));
    }
}
