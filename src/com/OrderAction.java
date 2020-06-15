package com;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;

import java.text.SimpleDateFormat;
import java.util.Date;


public class OrderAction extends ActionSupport {
    private Dao dao = new Dao();
    private int ordId;
    private String userId;
    private String[] equName;
    private  String ordState;
    public int[] renNum;
    Date date=new Date();
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private String ordTime=format.format(date);
    private String ordUTime=format.format(date);
    private String[] equRet;


    public int getOrdId() {
        return ordId;
    }

    public void setOrdId(int ordId) {
        this.ordId = ordId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }



    public String[] getEquName() {
        return equName;
    }

    public void setEquName(String[] equName) {
        this.equName = equName;
    }

    public String getOrdState() {
        return ordState;
    }

    public void setOrdState(String ordState) {
        this.ordState = ordState;
    }

    public int[] getRenNum() {
        return renNum;
    }

    public void setRenNum(int[] renNum) {
        this.renNum = renNum;
    }

    public String getOrdTime() {
        return ordTime;
    }

    public void setOrdTime(String ordTime) {
        this.ordTime = ordTime;
    }

    public String getOrdUTime() {
        return ordUTime;
    }

    public void setOrdUTime(String ordUTime) {
        this.ordUTime = ordUTime;
    }

    public String[] getEquRet() {
        return equRet;
    }

    public void setEquRet(String[] equRet) {
        this.equRet = equRet;
    }



    public String  ordAdd() {
        System.out.println(ActionContext.getContext().getSession().get("userId"));
        System.out.println(getOrdTime());
        String userId=ActionContext.getContext().getSession().get("userId").toString();
        setUserId(userId);
        String sql="";
        System.out.println(getUserId()+" "+getRenNum()[0]+" "+getEquName()[0]);
        for (int i=0;i<getEquName().length;i++){
            if (getRenNum()[i]>0){
                sql="INSERT INTO `order`(userId,equName,ordState,ordTime,renNum)values('"+getUserId()+"','"+ getEquName()[i] + "','" + 0+ "','" + getOrdTime() + "','" + getRenNum()[i] + "')";
                System.out.println(sql);
                int j=dao.executeUpdate(sql);
                if (j==-1){
                    return "error";
                }
            }
        }
        return "ordAddSuccess";
    }

    public String equReu(){
        System.out.println(getOrdId());
        System.out.println(getOrdUTime());
        String sql="update `order` set ordState='1',ordUTime='"+getOrdUTime()+"'where ordId='"+getOrdId()+"'";
        int a = dao.executeUpdate(sql);
        if (a>-1){
            return "equRetSuccess";
        }
        return "error";
    }

    public String manCheck(){
        System.out.println(getOrdId());
        String sql="update `order` set ordState='2'where ordId='"+getOrdId()+"'";
        System.out.println(sql);
        int a=dao.executeUpdate(sql);
        if (a>-1){
            return "manCheSuccess";
        }
        return "error";
    }



}
