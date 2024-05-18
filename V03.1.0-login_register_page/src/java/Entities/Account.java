/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author hatro
 */
public class Account {
    private int uid;
    private String fullname;
    private String password;
    private String email;
    private double amount;
    private String code;
    private int roleid;

    public Account() {
    }
    
    
//
//    public Account(String fullname, String email) {
//        this.fullname = fullname;
//        this.email = email;
//    }


    public Account(String fullname, String password, String email, double amount, String code) {
        this.fullname = fullname;
        this.password = password;
        this.email = email;
        this.amount = amount;
        this.code = code;
    }
    
    
    public Account(int uid, String fullname, String password, String email, double amount, String code, int roleid) {
        this.uid = uid;
        this.fullname = fullname;
        this.password = password;
        this.email = email;
        this.amount = amount;
        this.code = code;
        this.roleid = roleid;
    }

    public Account(String fullname, String password, String email) {
        this.fullname = fullname;
        this.password = password;
        this.email = email;
    }
    
    public Account( String password, String email) {
       
        this.password = password;
        this.email = email;
    }
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    @Override
    public String toString() {
        return super.toString(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    
}
