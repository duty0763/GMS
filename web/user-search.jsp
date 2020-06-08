<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>用户查询</title>

  <!-- Bootstrap -->
  <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
  <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
  <!-- Datatables -->

  <link href="/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
  <link href="/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
  <link href="/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
  <link href="/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
  <link href="/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">

      <%
        try {
          Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
          String url = "jdbc:mysql://127.0.0.1:3306/gms?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; //数据库名
          String username = "root";  //数据库用户名
          String password = "123456";  //数据库用户密码
          Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

          if(conn != null) {
      %>

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
                    <li><a href="announcement_publish.jsp">发布馆内设施罚款条例公告</a></li>
                    <li><a href="manager-search.jsp">查询管理员用户</a></li>
                    <li><a href="user-search.jsp">查询用户</a></li>
                    <li><a href="password_change.jsp">修改密码</a></li>
                  </ul>
                </li>
                <li><a><i class="fa fa-university"></i> 场地管理 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="ground_add.jsp">添加场地</a></li>
                    <li><a href="ground_search.jsp">场地查询</a></li>
                    <li><a href="ground_announcement.jsp">场地公告</a></li>
                    <li><a href="ground_publish.jsp">发布场地公告</a></li>
                  </ul>
                </li>
                <li><a><i class="fa fa-futbol-o"></i> 赛事管理 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="match-search.jsp">赛事信息查询</a></li>
                    <li><a href="match_publish.jsp">赛事发布</a></li>
                    <li><a href="referee_announcement.jsp">裁判简介公告</a></li>
                    <li><a href="referee_publish.jsp">发布裁判简介公告</a></li>
                  </ul>
                </li>
                <li><a><i class="fa fa-wrench"></i> 器材管理 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="equipment_add.jsp">新增器材</a></li>
                    <li><a href="equipment_search.jsp">器材查询</a></li>
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
                <h2>用户查询</h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="card-box table-responsive">
                      <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                          <tr>
                            <th>一卡通号</th>
                            <th>专业班级</th>
                            <th>姓名</th>
                            <th>手机号</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                          Statement stmt = null;
                          ResultSet rs = null;
                          String sql = "SELECT * FROM user";  //查询语句
                          stmt = conn.createStatement();
                          rs = stmt.executeQuery(sql);
                          while (rs.next()) {
                        %>
                        <tr>
                          <td><%=rs.getString("userId")%></td>
                          <td><%=rs.getString("major")%></td>
                          <td><%=rs.getString("userName")%></td>
                          <td><%=rs.getString("phone")%></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                      </table>
                    </div>
                  </div>
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

      <%
        }
        else{
        System.out.println("数据库连接失败！");
        }
        }catch (Exception e) {
        //e.printStackTrace();
        System.out.println("数据库连接异常！");
        }
      %>

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
  <!-- iCheck -->
  <script src="/vendors/iCheck/icheck.min.js"></script>
  <!-- Datatables -->
  <script src="/vendors/datatables.net/js/jquery.dataTables.js"></script>
  <script src="/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
  <script src="/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
  <script src="/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="/vendors/datatables.net-buttons/js/buttons.jsp5.min.js"></script>
  <script src="/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
  <script src="/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
  <script src="/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
  <script src="/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
  <script src="/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
  <script src="/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
  <script src="/vendors/jszip/dist/jszip.min.js"></script>
  <script src="/vendors/pdfmake/build/pdfmake.min.js"></script>
  <script src="/vendors/pdfmake/build/vfs_fonts.js"></script>

  <!-- Custom Theme Scripts -->
  <script src="/build/js/custom.min.js"></script>

</body>

</html>