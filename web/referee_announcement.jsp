<%@page import="java.sql.*" %>
<%@ page import="dao.Dao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="images/favicon.ico" type="image/ico" />

  <title>海大体育馆管理系统</title>

  <!-- Bootstrap -->
  <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
  <!-- bootstrap-progressbar -->
  <link href="/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
  <!-- JQVMap -->
  <link href="/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
  <!-- bootstrap-daterangepicker -->
  <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
  <!-- Custom Theme Style -->
  <link href="/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
  <div class="main_container">

    <%
      Dao dao = new Dao();
      String role = (String) session.getAttribute("role");%>

    <!--左边导航栏 ---------------------------------------------------------------------->
    <div class="col-md-3 left_col">
      <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
          <a href="index.jsp" class="site_title"><i class="fa fa-home"></i><span><small> 海大体育馆管理系统
                </small></span></a>
        </div>
        <div class="clearfix"></div>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
          <div class="menu_section">
            <ul class="nav side-menu">
              <li><a><i class="fa fa-male"></i> 用户管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li><a href="index.jsp">馆内设施罚款条例公告</a></li>
                  <%
                    if (role.equals("2") || role.equals("3")) {
                  %>
                  <li><a href="announcement_publish.jsp">发布馆内设施罚款条例公告</a></li>
                  <li><a href="user_search.jsp">查询用户</a></li>
                  <%
                    }
                  %>
                  <li><a href="password_change.jsp">修改密码</a></li>
                </ul>
              </li>
              <li><a><i class="fa fa-university"></i> 场地管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">

                  <%
                    if (role.equals("2") || role.equals("3")) {
                  %>
                  <li><a href="ground_add.jsp">添加场地</a></li>
                  <li><a href="ground_publish.jsp">发布场地公告</a></li>
                  <%
                    }
                  %>
                  <!--0空闲 1租用 2校队占用 3赛事占用 4禁用-->
                  <li><a href="ground_search.jsp">场地查询</a></li>
                  <!--在底部放置预约的选项
                        在如果有预约 在预约下面显示预约信息（包括修改和删除功能）-->
                  <li><a href="ground_announcement.jsp">场地公告</a></li>
                </ul>
              </li>
              <li><a><i class="fa fa-futbol-o"></i> 赛事管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <%
                    if (role.equals("1") || role.equals("2") || role.equals("3")) {
                  %>
                  <li><a href="match_publish.jsp">赛事发布</a></li>
                  <%
                    }
                  %>
                  <%
                    if (role.equals("2") || role.equals("3")) {
                  %>
                  <li><a href="referee_publish.jsp">发布裁判简介公告</a></li>
                  <%
                    }
                  %>
                  <li><a href="match_search.jsp">赛事信息查询</a></li>
                  <li><a href="referee_announcement.jsp">裁判简介公告</a></li>
                </ul>
              </li>
              <li><a><i class="fa fa-wrench"></i> 器材管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <%
                    if (role.equals("2") || role.equals("3")) {
                  %>
                  <li><a href="equipment_add.jsp">新增器材</a></li>
                  <!--器材号不用写 主键自增就行-->
                  <%
                    }
                  %>
                  <li><a href="equipment_search.jsp">器材查询</a></li>
                  <!--或者查询放两个查询列表 一个是正常的器材查询 一个是维修的查询-->
                  <!--在器材每一个item右边放一个增加数量和减少数量的输入框 和buttton 改变数量 再加一个删除按钮-->
                  <li><a href="equipment_borrow.jsp">租用器材</a></li>
                  <li><a href="equipment_return.jsp">器材归还</a></li>
                  <li><a href="equipment_charge.jsp">器材收费表准查询</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
        <!-- /sidebar menu -->

      </div>
    </div>
    <!--/左边导航栏 ---------------------------------------------------------------------->


    <!--上边信息栏 ---------------------------------------------------------------------->
    <div class="top_nav">
      <div class="nav_menu">
        <div class="nav toggle">
          <a id="menu_toggle"><i class="fa fa-bars"></i></a>
        </div>
        <nav class="nav navbar-nav">
          <ul class=" navbar-right">
            <span class="pull-right">欢迎您，${sessionScope.userName}!&nbsp;&nbsp;&nbsp; <a href="logout.action"> 退出登录 <i class="fa fa-sign-out"></i></a></span>
          </ul>
        </nav>
      </div>
    </div>
    <!--/上边信息栏 ---------------------------------------------------------------------->


    <!--内容 ---------------------------------------------------------------------->
    <div class="right_col" role="main">
      <div class="row">
        <div class="col-md-12 col-sm-12 ">
          <div class="x_panel">
            <div class="x_title">
              <h2>裁判简介公告</h2>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <div class="dashboard-widget-content">
                <!--公告item li ---------------------------------------------------------------------->
                <ul class="list-unstyled timeline widget">
                  <%
                    String sql = "select * from refereeannouncement";
                    ResultSet rs = dao.executeQuery(sql);
                    while (rs.next()) {
                  %>
                  <li>
                    <div class="block">
                      <div class="block_content">
                        <h2 class="title"><%=rs.getString("title") %>
                        </h2>
                        <div class="byline">
                          <span><%=rs.getString("publisher") %></span>&nbsp;&nbsp;&nbsp;<span><%=rs.getString("time").substring(0, rs.getString("time").indexOf("."))%></span>
                        </div>
                        <p class="excerpt"><%=rs.getString("content") %>
                        </p>
                      </div>

                    </div>
                  </li>
                  <%
                    }
                  %>
                </ul>
                <!--/公告item li ---------------------------------------------------------------------->
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/内容 ---------------------------------------------------------------------->










    <!--底部 ---------------------------------------------------------------------->
    <footer>
      <div class="pull-right">GDOU_Managerment_System</div>
      <div class="clearfix"></div>
    </footer>
    <!--/底部 ---------------------------------------------------------------------->
  </div>
</div>






<!----------------------------------------- JS引用 ----------------------------------------->

<!-- jQuery -->
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="/vendors/Flot/jquery.flot.js"></script>
<script src="/vendors/Flot/jquery.flot.pie.js"></script>
<script src="/vendors/Flot/jquery.flot.time.js"></script>
<script src="/vendors/Flot/jquery.flot.stack.js"></script>
<script src="/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/vendors/moment/min/moment.min.js"></script>
<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- Custom Theme Scripts -->
<script src="/build/js/custom.min.js"></script>

</body>

</html>