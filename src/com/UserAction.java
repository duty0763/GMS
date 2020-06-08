package com;

import java.sql.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;
import util.Encrypt;


public class UserAction extends ActionSupport {
    private Dao dao = new Dao();
    private String userId;
    private String userName;
    private String phone;
    private String password;
    private String rePassword;
    private String major;
    private String oldPassword;
    private String title;
    private String content;
    private String publisher;

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

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }


    public String login() {
        String MD5Password= Encrypt.Encrypt_md5(getPassword());
        String sql = "select * from user where userId='" + getUserId() + "' and password ='" + MD5Password + "'";
        ResultSet rS = dao.executeQuery(sql);
        try {
            if (rS.next()) {
                ActionContext.getContext().getSession().put("userName", rS.getString("userName"));
                ActionContext.getContext().getSession().put("userId", rS.getString("userId"));
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
            String MD5Password= Encrypt.Encrypt_md5(getPassword());
            String sql = "insert into user(userId,userName,password,major,phone) values('" + getUserId() + "','" + getUserName() + "','" + MD5Password + "','" + getMajor() + "','" + getPhone() + "')";
            int i = dao.executeUpdate(sql);
            if (i > -1) {
                ActionContext.getContext().getSession().put("userId", userId);
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


    public String modify() {
        String userId = ActionContext.getContext().getSession().get("userId").toString();
        String MD5OldPassword= Encrypt.Encrypt_md5(getOldPassword());
        String querySql = "select * from user where userId='" + userId + "' and password ='" + MD5OldPassword + "'";
        ResultSet rS = dao.executeQuery(querySql);
        try {
            if (!rS.next()) {
                return "error";
            }
        } catch (SQLException e) {
// TODO Auto-generated catch block
            e.printStackTrace();
        }

        if (getPassword().equals(getRePassword())) {
            String MD5Password= Encrypt.Encrypt_md5(getPassword());
            String sql = "update user set password = '" + MD5Password + "' where userId = '" + userId + "'";
            int i = dao.executeUpdate(sql);
            if (i > -1) {
                ActionContext.getContext().getSession().clear();
                return "unLogin";
            }
            return "error";
        } else {
            return "error";
        }
    }

    public String finePublish() {
        String sql = "insert into fineAnnouncement(title,content,publisher,phone) values('" + getTitle() + "','" + getContent() + "','" + getPublisher() + "','" + getPhone() + "')";
        int i = dao.executeUpdate(sql);
        System.out.println(sql);
        if (i > -1) {
            return "success";
        }
        return "error";
    }


}




