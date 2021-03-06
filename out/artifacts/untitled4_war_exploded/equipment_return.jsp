<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<%@ page import="dao.Dao" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>DataTables | Gentelella</title>

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
        Dao dao=new Dao();
        String userId=(String) session.getAttribute("userId");
        String role = (String) session.getAttribute("role");
      %>
      <!--左边导航栏 ---------------------------------------------------------------------->
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.jsp" class="site_title"><i class="fa fa-home"></i><span><small> 海大体育馆管理系统
                </small></span></a>
          </div>
          <div class="clearfix"></div>
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
                    <li><a href="ground_search.jsp">场地查询</a></li>
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
                    <%
                      }
                    %>
                    <li><a href="equipment_search.jsp">器材查询</a></li>
                    <li><a href="equipment_borrow.jsp">租用器材</a></li>
                    <li><a href="equipment_return.jsp">器材归还</a></li>
                    <li><a href="equipment_charge.jsp">器材收费表准查询</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
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
                <h2>器材归还</h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="card-box table-responsive">
                      <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                          <tr>
                            <th>订单号</th>
                            <th>器材名称</th>                           
                            <th>数量</th>
                            <th>租用时间</th>
                            <th>租用状态</th>
                            <th>归还</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                          String sql = "SELECT * FROM `order`";  //查询语句
                          ResultSet rs = dao.executeQuery(sql);
                          String timeStamp;
                          Date date=new Date();
                          String uTime;
                          SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                          String nowTime=df.format(date);
                          while (rs.next()) {
                             timeStamp = df.format(rs.getTimestamp("ordTime"));
                            Date d1 = df.parse(timeStamp);
                            Date d2 = df.parse(nowTime);
                            uTime=(((d2.getTime() - d1.getTime()) / (60 * 60 * 1000)) % 24) + "小时"+(((d2.getTime() - d1.getTime()) / (60*1000)+480) % 60) + "分钟";
                        %>
                          <tr>
                              <form action="equRet.action" method="post">
                            <%if (rs.getString("userId").equals(userId)) {%>
                            <td><%=rs.getString("ordId")%></td>
                              <input type="hidden" name="ordId"value="<%=rs.getString("ordId")%>">
                            <td><%=rs.getString("equName")%></td>
                            <td><%=rs.getString("renNum")%></td>
                            <%if (rs.getString("ordState").equals("0")) {%>
                            <td><%=uTime%></td>
                              <input type="hidden" name="ordUTime"value="<%=uTime%>">
                              <%}%>
                              <%if (rs.getString("ordState").equals("1")||rs.getString("ordState").equals("2")) {%>
                              <td><%=rs.getString("ordUTime")%></td>
                              <%}%>
                            <%if (rs.getString("ordState").equals("0")) {%>
                            <td>使用中</td>
                            <%}%>
                            <%if (rs.getString("ordState").equals("1")||rs.getString("ordState").equals("2")) {%>
                            <td>已结账</td>
                            <%}%>
                            <%if (rs.getString("ordState").equals("0")) {%>
                              <td>
                                  <button type="submit" class="buttons btn btn-success">归还</button>
                              </td>
                            <%}%>
                            <%if (rs.getString("ordState").equals("1")) {%>
                            <td>等待管理员确认</td>
                            <%}%>
                             <%if (rs.getString("ordState").equals("2")) {%>
                             <td>订单已完成</td>
                             <%}%>
                            <%}%>
                              </form>
                          </tr>
                        <%if (role.equals("2")||role.equals("3")) {
                        %>
                        <tr>
                            <form action="manCheck.action" method="post">
                                <%if (rs.getString("ordState").equals("1")) {%>
                                <td><%=rs.getString("ordId")%></td>
                                <input type="hidden" name="ordId"value="<%=rs.getString("ordId")%>">
                                <td><%=rs.getString("equName")%></td>
                                <td><%=rs.getString("renNum")%></td>
                                <td><%=rs.getString("ordUTime")%></td>
                                <td>已结账</td>
                                <td>
                                    <button type="submit" class="buttons btn btn-success">确认归还</button>
                                </td>

                                <%}%>
                            </form>
                        </tr>
                        <%}%>
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