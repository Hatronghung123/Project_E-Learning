/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * SELECT [account_id] ,[email] ,[password] ,[role_id] ,[is_active]
 * ,[managed_by] FROM [dbo].[tbl_account]
 *
 */
public class Account {

    private int account_id;
    private String email;
    private String password;
    private int role_id;
    /*
     role_id = 1 =>ADMIN
                2 => Manager
                3 => Mentor
                4 => Mentee
     */
    private boolean active;
    private int managed_by;

    public Account() {
    }

    public Account(String email) {
        this.email = email;
    }

    public Account(int account_id, String email, String password, int role_id, boolean active, int managed_by) {
        this.account_id = account_id;
        this.email = email;
        this.password = password;
        this.role_id = role_id;
        this.active = active;
        this.managed_by = managed_by;
    }

//    public Account(String fullname, String password, String email, double amount, String code) {
//        this.fullname = fullname;
//        this.password = password;
//        this.email = email;
//        this.amount = amount;
//        this.code = code;
//    }

//    public Account(int uid, String fullname, String password, String email, double amount, String code, int roleid) {
//        this.uid = uid;
//        this.fullname = fullname;
//        this.password = password;
//        this.email = email;
//        this.amount = amount;
//        this.code = code;
//        this.roleid = roleid;
//    }

//    public Account(String fullname, String password, String email) {
//        this.fullname = fullname;
//        this.password = password;
//        this.email = email;
//    }

    public Account(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getManaged_by() {
        return managed_by;
    }

    public void setManaged_by(int managed_by) {
        this.managed_by = managed_by;
    }

}
