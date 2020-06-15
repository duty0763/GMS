package com;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class EquAction extends ActionSupport {
        private Dao dao = new Dao();
        private int equId;
        private String equName;
        private int equNum;
        private float equPrice;
        private float equRenPrice;
        private int changeNum;
        private int maiNum;

        public int getEquId() {
            return equId;
        }

        public void setEquId(int equId) {
            this.equId = equId;
        }

        public String getEquName() {
            return equName;
        }

        public void setEquName(String equName) {
            this.equName = equName;
        }

        public int getEquNum() {
            return equNum;
        }

        public void setEquNum(int equNum) {
            this.equNum = equNum;
        }

        public float getEquPrice() {
            return equPrice;
        }

        public void setEquPrice(float equPrice) {
            this.equPrice = equPrice;
        }

        public float getEquRenPrice() {
            return equRenPrice;
        }

        public void setEquRenPrice(float equRenPrice) {
            this.equRenPrice = equRenPrice;
        }

        public int getChangeNum() {
            return changeNum;
        }

        public void setChangeNum(int changeNum) {
            this.changeNum = changeNum;
        }

    public int getMaiNum() {
        return maiNum;
    }

    public void setMaiNum(int maiNum) {
        this.maiNum = maiNum;
    }

    public String  equAdd() {

        System.out.println(getEquName()+" "+getEquNum()+" "+getEquPrice()+" "+getEquRenPrice());
        String sql = "select * from equipment where equName='" + getEquName() + "'";
        String sql2 = "insert into equipment(equName,equNum,equPrice,equRenPrice) values('" + getEquName() + "','" + getEquNum() + "','" + getEquPrice() + "','" + getEquRenPrice() + "')";
//        int i = dao.executeUpdate(sql2);
        ResultSet rS = dao.executeQuery(sql);
         try {
             if (rS.next()) {
                 System.out.println(rS.getString("equPrice"));
                 System.out.println(rS.getString("equRenPrice"));
                 System.out.println(rS.getInt("equNum"));
                 int num = rS.getInt("equNum") +getEquNum();
                 System.out.println(num);
                 sql = "update equipment set equNum = '" + num + "',equPrice = '"+ getEquPrice()+"',equRenPrice ='"+getEquRenPrice()+"'where equName = '" + getEquName() + "'";

                 int i = dao.executeUpdate(sql);
                 System.out.println(sql);
                 if (i>-1){
                     return "equAddSuccess";
                 }
                 return "equAddSuccess";
             }else {
                 int i = dao.executeUpdate(sql2);
                 if (i>-1){
                     return "equAddSuccess";
                 }else {
                     return "error";
                 }
             }

         }catch (SQLException e) {
// TODO Auto-generated catch block
             e.printStackTrace();
             return "error";
            }
        }

    public String deleteEqu(){

        int num=getEquNum()-getChangeNum();
        String sql="update equipment set equNum='"+num+"' where equId = '"+getEquId()+"'";
        int i=dao.executeUpdate(sql);
        if (i>-1){
            return "changeSuccess";
        }
        return "error";

    }

    public String mainEqu(){
        System.out.println(getEquId());
        System.out.println(getChangeNum());
        System.out.println(getMaiNum());
        int num =getChangeNum()+getMaiNum();
        String sql="update equipment set equMaiNum='"+num+"' where equId = '"+getEquId()+"'";
        int i=dao.executeUpdate(sql);
        if (i>-1){
            return "changeSuccess";
        }
        return "error";
    }

    }


