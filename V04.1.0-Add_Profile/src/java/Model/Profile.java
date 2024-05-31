/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author tuong
 * SELECT TOP (1000) [profile_id]
      ,[fullname]
      ,[gender]
      ,[account_id]
      ,[avatar]
      ,[money]
  FROM [Project_Online_Learning].[dbo].[tbl_profile]

 */
public class Profile {
    int profile_id;
    String fullname;
    boolean gender;
    String avt;
    double money;

    public Profile() {
    }

    public Profile(int profile_id, String fullname, boolean gender, String avt, double money) {
        this.profile_id = profile_id;
        this.fullname = fullname;
        this.gender = gender;
        this.avt = avt;
        this.money = money;
    }

    public Profile(String fullname) {
        this.fullname = fullname;
    }
    

    public int getProfile_id() {
        return profile_id;
    }

    public void setProfile_id(int profile_id) {
        this.profile_id = profile_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
    
    
}
