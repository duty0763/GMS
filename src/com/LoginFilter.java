package com;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 写入登录认证业务逻辑

        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        Object object = session.getAttribute("userName");//获取session中作为判断的字段
        String path = request.getServletPath();  //获取路径 request.getServletPath()返回：/main/list.jsp
        String url = request.getRequestURI();// 获得用户请求的URI， request.getRequestURI() 返回：项目名/main/list.jsp


        if (url.contains(".css") || url.contains(".js") || url.contains(".png") || url.contains(".jpg")) {
            //如果发现是css或者js文件，直接放行
            filterChain.doFilter(servletRequest, servletResponse);
        } else if (object == null && path.indexOf("login") < 0) {
            //判断请求的 路径中是否包含了 登录页面的请求
            //如果包含了，那么不过滤 继续执行操作
            //如果不是login.jsp进行过滤
            response.sendRedirect("login.jsp");
        } else {
            filterChain.doFilter(servletRequest, servletResponse); // 已经登陆,继续此次请求
        }

    }

    @Override
    public void destroy() {

    }
}