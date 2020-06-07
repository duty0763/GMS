package com;

import java.sql.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;

public class UserAction extends ActionSupport {
    private Dao dao = new Dao();
    private String userId;
    private String userName;
    private String password;
    private String rePassword;
    private String major;
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }



    public String login() {
        String sql = "select * from user where userId='" + getUserId() + "' and password ='" + getPassword() + "'";
        ResultSet rS = dao.executeQuery(sql);
        try {
            if (rS.next()) {
                ActionContext.getContext().getSession().put("userName", rS.getString("userName"));
                return "success";
            }
            return "error";
        } catch (SQLException e) {
// TODO Auto-generated catch block
            e.printStackTrace();
            return "error";
        }
    }


    public String register() {
        if (getPassword().equals(getRePassword())) {
            System.out.println(getUserName());
            String sql = "insert into user(userId,userName,password,major,phone) values('" + getUserId() + "','" + getUserName() + "','" + getPassword() + "','" + getMajor() + "','" + getPhone() + "')";
            int i = dao.executeUpdate(sql);
            if (i > -1) {
                ActionContext.getContext().getSession().put("userName", userName);
                return "success";
            }
            return "error";
        }
        return "error";
    }


    public String logout() {
        ActionContext.getContext().getSession().clear();
        return "unLogin";
    }

//
//    public String modify() {
//        if (repassword.equals(newpassword)) {
//            String sql = "update person set password = '"+ getNewpassword() + "'  where password='" + getPassword() + "'";
//            int i = dao.executeUpdate(sql);
//
//            if (i > -1) {
//                return "modify";
//            }
//            return "modifyerror";
//        } else {
//            return "modifyerror";
//        }
//
//    }


}




