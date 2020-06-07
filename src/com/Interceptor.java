package com;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Interceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation arg0) throws Exception {
        ActionContext ac = arg0.getInvocationContext();
        // 获取session中的user类，若没有则user==null

        System.out.println("拦截器启动");

        Object userName = ac.getSession().get("userName");
        if (userName != null) {

            System.out.println("userName不为空");
            return arg0.invoke();
        } else {

            System.out.println("userName为空");
            return "unLogin";
        }

    }

}