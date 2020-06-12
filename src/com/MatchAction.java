package com;

import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;

import java.sql.Timestamp;


public class MatchAction extends ActionSupport {
    private Dao dao = new Dao();
    private String mId;
    private String groundName;
    private String applicant;
    private String phone;
    private String referee;
    private Timestamp startTime;
    private Timestamp endTime;
    private String refereetitle;
    private String refereecontent;
    private String refereepublisher;
    private String refereepublisherphone;

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getmId() {
        return mId;
    }

    public void setmId(String mId) {
        this.mId = mId;
    }



    public String getRefereetitle() {
        return refereetitle;
    }

    public void setRefereetitle(String refereetitle) {
        this.refereetitle = refereetitle;
    }


    public String getRefereecontent() {
        return refereecontent;
    }

    public void setRefereecontent(String refereecontent) {
        this.refereecontent = refereecontent;
    }

    public String getRefereepublisher() {
        return refereepublisher;
    }

    public void setRefereepublisher(String refereepublisher) {
        this.refereepublisher = refereepublisher;
    }

    public String getRefereepublisherphone() {
        return refereepublisherphone;
    }

    public void setRefereepublisherphone(String refereepublisherphone) {
        this.refereepublisherphone = refereepublisherphone;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGroundName() {
        return groundName;
    }

    public void setGroundName(String groundName) {
        this.groundName = groundName;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }



    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee;
    }









    public String setMatch() {

        String sql = "insert into matchdetail(groundName,applicant,phone,referee,starttime,endtime) values('" + getGroundName() + "','" + getApplicant() + "','" + getPhone() + "','" + getReferee() + "','" + getStartTime() + "','" + getEndTime() + "')";
        int i = dao.executeUpdate(sql);
        System.out.println(sql);
        if (i > -1) {
            return "success";
        }
        return "error";
    }

    public String setPublish() {
        String sql = "insert into refereeannouncement(title,content,publisher,phone) values('" + getRefereetitle() + "','" + getRefereecontent() + "','" + getRefereepublisher() + "','" + getRefereepublisherphone() + "')";
        int i = dao.executeUpdate(sql);
        System.out.println(sql);
        if (i > -1) {
            return "success";
        }
        return "error";
    }

    public String deleteMatch() {
        String sql = "delete from matchdetail where mId= '" + getmId() + "'";
        int a = dao.executeUpdate(sql);
        if (a > -1) {
            return "success";
        }
        return "error";
    }


}




