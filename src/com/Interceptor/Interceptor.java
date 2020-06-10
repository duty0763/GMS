package com.Interceptor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Interceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation arg0) throws Exception {
        ActionContext ac = arg0.getInvocationContext();
        // 获取session中的user类，若没有则user==null

        Object userName = ac.getSession().get("userName");
        String actionName =arg0.getProxy().getActionName();

        if (actionName.equals("login")||actionName.equals("register")){
            return arg0.invoke();
        }
        else if (userName != null) {
            return arg0.invoke();
        } else {
            return "unLogin";
        }

    }

}