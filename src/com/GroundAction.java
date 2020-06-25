package com;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;
import util.Encrypt;

import java.sql.ResultSet;
import java.sql.SQLException;


public class GroundAction extends ActionSupport {
    private Dao dao = new Dao();
    private String groundId;
    private String groundName;
    private String groundFee;
    private String groundStatus;
    private String useTime;
    private String noticeId;
    private String noticeTitle;
    private String noticeText;
    private String noticePublisher;
    private String noticePtime;
    private String groundEqu;


    String userId = ActionContext.getContext().getSession().get("userId").toString();


    public String getGroundEqu() {
        return groundEqu;
    }

    public void setGroundEqu(String groundEqu) {
        this.groundEqu = groundEqu;
    }

    public String getGroundId() {
        return groundId;
    }

    public void setGroundId(String groundId) {
        this.groundId = groundId;
    }

    public String getGroundName() {
        return groundName;
    }

    public void setGroundName(String groundName) {
        this.groundName = groundName;
    }

    public String getGroundFee() {
        return groundFee;
    }

    public void setGroundFee(String groundFee) {
        this.groundFee = groundFee;
    }

    public String getGroundStatus() {
        return groundStatus;
    }

    public void setGroundStatus(String groundStatus) {
        this.groundStatus = groundStatus;
    }

    public String getUseTime() {
        return useTime;
    }

    public void setUseTime(String useTime) {
        this.useTime = useTime;
    }

    public String getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeText() {
        return noticeText;
    }

    public void setNoticeText(String noticeText) {
        this.noticeText = noticeText;
    }

    public String getNoticePublisher() {
        return noticePublisher;
    }

    public void setNoticePublisher(String noticePublisher) {
        this.noticePublisher = noticePublisher;
    }

    public String getNoticePtime() {
        return noticePtime;
    }

    public void setNoticePtime(String noticePtime) {
        this.noticePtime = noticePtime;
    }


    //添加场地
    public String addGround(){
        String sql = "insert into ground(groundId,groundName,groundFee,groundStatus,useTime,groundEqu) values('" + getGroundId() + "','" + getGroundName() + "','" + getGroundFee() + "','0','0','"+getGroundEqu()+"')";
        int i = dao.executeUpdate(sql);
        System.out.println(sql);
        if (i > -1) {
            return "success";
        }
        return "error";
    }
    //发布场地公告
    public  String publishGround(){
        String sql = "insert into groundnotice(noticeTitle,noticeText,noticePublisher) values('" + getNoticeTitle() + "','" + getNoticeText() + "','" + getNoticePublisher() + "')";
        int i = dao.executeUpdate(sql);
        System.out.println(sql);
        if (i > -1) {
            return "success";
        }
        return "error";
    }
    //预约场地
    //普通预约
    public String orderGround1(){
        String sql = "update ground set groundStatus = '1',userId='"+userId+"',useTime='"+getUseTime()+"' where groundId='"+getGroundId()+"'";
        int a = dao.executeUpdate(sql);
        if (a > -1) {
            return "updateGround";
        }
        return "error";
    }
    //校队预约
    public String orderGround2(){
        String sql = "update ground set groundStatus = '2',useTime='"+getUseTime()+"' where groundId='"+getGroundId()+"'";
        int a = dao.executeUpdate(sql);
        if (a > -1) {
            return "updateGround";
        }
        return "error";
    }
    //取消预约
    public String orderGround3(){
        String sql = "update ground set groundStatus = '0',useTime='0' where groundId='"+getGroundId()+"'";
        int a = dao.executeUpdate(sql);
        if (a > -1) {
            return "updateGround";
        }
        return "error";
    }
    public String deleteGround(){
        String sql = "delete from ground where groundId= '" + getGroundId() + "'";
        int a= dao.executeUpdate(sql);
        if (a > -1) {
            return "updateGround";
        }
        return "error";

    }

}



