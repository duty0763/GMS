package com.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter("*.jsp")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        Object userName = session.getAttribute("userName");
        Object role = session.getAttribute("role");

        String path = request.getServletPath();  //获取路径
        String url = request.getRequestURI();// 获得用户请求的URI


//        if (url.contains(".css") || url.contains(".js") || url.contains(".png") || url.contains(".jpg")) {
//            //如果发现是css或者js文件，直接放行
//            System.out.println(url);
//            System.out.println("放行");
//            filterChain.doFilter(servletRequest, servletResponse);
//
//
//        } else if (userName == null && path.indexOf("login") < 0) {
//            //判断请求的 路径中是否包含了 登录页面的请求
//            //如果包含了，那么不过滤 继续执行操作
//            //如果不是login.jsp进行过滤
//
//            System.out.println("2");
//            response.sendRedirect("login.jsp");
//
//
//        }  else {
//            System.out.println("4");
//            filterChain.doFilter(servletRequest, servletResponse);
//        }

//        if (url.contains(".css") || url.contains(".js") || url.contains(".png") || url.contains(".jpg")) {
//            //如果发现是css或者js文件，直接放行
//            filterChain.doFilter(servletRequest, servletResponse);
//        } else if (userName == null && path.indexOf("login") < 0) {
//            response.sendRedirect("login.jsp");
//        }
//        else
//            filterChain.doFilter(servletRequest, servletResponse);
//        else {
//            System.out.println("进入判断1");
//            if ("0".equals(role) || "1".equals(role)) {
//                String url = url.substring(0, url.indexOf("."));
//                System.out.println("进入判断2");
//                if (!("/error".equals(url) || "/403".equals(url) || "/index".equals(url) || "/password_change".equals(url) || "/ground_search".equals(url) || "/ground_announcement".equals(url) || "/match_search".equals(url) || "/referee_announcement".equals(url) || "/equipment_search".equals(url) || "/equipment_borrow".equals(url) || "/equipment_charge".equals(url) || "/equipment_return".equals(url) || ("1".equals(role) && "/equipment_add".equals(url)))) {
//                    System.out.println("进入判断3");
//                    response.sendRedirect("403.jsp");
//                    System.out.println("进入判断4");
//                } else {
//                    filterChain.doFilter(servletRequest, servletResponse);
//                }
//            } else {
//                filterChain.doFilter(servletRequest, servletResponse);
//            }
//            filterChain.doFilter(servletRequest, servletResponse);
//        }

//        System.out.println(url);
////        if (url.contains(".css") || url.contains(".js") || url.contains(".png") || url.contains(".jpg")|| url.contains(".ico")|| url.contains("vendors") ) {
////            System.out.println("执行1");
////            filterChain.doFilter(servletRequest, servletResponse);
////        }
//         if (userName == null && path.indexOf("login") < 0) {
//
//            System.out.println("执行2");
//            response.sendRedirect("login.jsp");
//
//        }
//        else if("/403.jsp".equals(url)){
//            System.out.println("执行403!!!!!!!!!!");
//        }
//        else if("0".equals(role) || "1".equals(role)){
//            System.out.println("执行3");
//            String simpleUrl = url.substring(0, url.indexOf("."));
//            System.out.println(simpleUrl);
//            System.out.println("/match_search".equals(simpleUrl));
//
//
//            if (!("/index".equals(simpleUrl) || "/password_change".equals(simpleUrl) || "/ground_search".equals(simpleUrl) || "/ground_announcement".equals(simpleUrl) || "/match_search".equals(simpleUrl) || "/referee_announcement".equals(simpleUrl) || "/equipment_search".equals(simpleUrl) || "/equipment_borrow".equals(simpleUrl) || "/equipment_charge".equals(simpleUrl) || "/equipment_return".equals(simpleUrl) || ("1".equals(role) && "/match_publish".equals(simpleUrl)))) {
//                System.out.println("执行403!!!!");
////                response.sendRedirect("403.jsp");
//
//            }
//        }
//        else {
//            System.out.println("执行4");
//            filterChain.doFilter(servletRequest, servletResponse);}
//

//        if ("0".equals(role) || "1".equals(role)) {
//            String simpleUrl = url.substring(0, url.indexOf("."));
//            if ("/login".equals(simpleUrl) ||"/index".equals(simpleUrl) || "/password_change".equals(simpleUrl) || "/ground_search".equals(simpleUrl) || "/ground_announcement".equals(simpleUrl) || "/match_search".equals(simpleUrl) || "/referee_announcement".equals(simpleUrl) || "/equipment_search".equals(simpleUrl) || "/equipment_borrow".equals(simpleUrl) || "/equipment_charge".equals(simpleUrl) || "/equipment_return".equals(simpleUrl) || ("1".equals(role) && "/match_publish".equals(simpleUrl))) {
//                System.out.println("符合的路径");
//                filterChain.doFilter(servletRequest, servletResponse);
//            }
//            else response.sendRedirect("403.jsp");
//        }
//        else filterChain.doFilter(servletRequest, servletResponse);


        if (userName == null && path.indexOf("login") < 0) {
            response.sendRedirect("login.jsp");
            return;
        } else if ("0".equals(role) || "1".equals(role)) {

            String simpleUrl = url.substring(0, url.indexOf("."));
            if ("/login".equals(simpleUrl) || "/index".equals(simpleUrl) || "/password_change".equals(simpleUrl) || "/ground_search".equals(simpleUrl) || "/ground_announcement".equals(simpleUrl) || "/match_search".equals(simpleUrl) || "/referee_announcement".equals(simpleUrl) || "/equipment_search".equals(simpleUrl) || "/equipment_borrow".equals(simpleUrl) || "/equipment_charge".equals(simpleUrl) || "/equipment_return".equals(simpleUrl) || ("1".equals(role) && "/match_publish".equals(simpleUrl))) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                request.getRequestDispatcher("403.jsp").forward(request, response);
                return;
            }
        } else filterChain.doFilter(servletRequest, servletResponse);

    }


    @Override
    public void destroy() {

    }
}