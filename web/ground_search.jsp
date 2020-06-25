<%@ page import="dao.Dao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>场地查询</title>

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
  <style>
    .buttons{padding: 4px 6px;margin: 0px;line-height: 1;font-size: 12px;}
    form{display: inline-flex}
  </style>
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <%
        Dao dao = new Dao();
        String role = (String) session.getAttribute("role");
        String userId=(String) session.getAttribute("userId");

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
                <h2>场地查询</h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="card-box table-responsive">

                      <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                          <tr>
                            <th>场地号</th>
                            <th>器材</th>
                            <th>收费标准 元/时</th>
                            <th>场地状态</th>
                            <th>预约时间</th>
                            <th>操作</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                          String sql = "SELECT * FROM ground WHERE groundStatus=0";  //查询语句
                          ResultSet rs = dao.executeQuery(sql);
                          while (rs.next()) {
                        %>
                          <tr>
                            <td><%=rs.getString("groundId")%></td>
                            <td><%=rs.getString("groundEqu")%></td>
                            <td><%=rs.getString("groundFee")%></td>

                              <%if (rs.getString("groundStatus").equals("0")) {%>
                              <td>空闲</td>
                              <%}%>
                              <%if (rs.getString("groundStatus").equals("1")) {%>
                              <td>普通租用</td>
                              <%}%>
                              <%if (rs.getString("groundStatus").equals("2")) {%>
                              <td>校队征用</td>
                              <%}%>
                              <%if (rs.getString("groundStatus").equals("3")) {%>
                              <td>赛事征用</td>
                              <%}%>

                            <td><select id="useTime">
                              <option value="今天上午8.30-11.30">今天上午8.30-11.30</option>
                              <option value="今天下午2.30-5.30">今天下午2.30-5.30</option>
                              <option value="整日">整日</option>
                              <option value="明天上午8.30-11.30">明天上午8.30-11.30</option>
                              <option value="明天下午2.30-5.30">明天下午2.30-5.30</option>
                              <option value="明天整日">明天整日</option>
                              <option value="后天上午8.30-11.30">后天上午8.30-11.30</option>
                              <option value="后天下午2.30-5.30">后天下午2.30-5.30</option>
                              <option value="后天整日">后天整日</option>
                            </select></td>
                            <td>
                                <form action="orderGround1.action" method="post"><input type="hidden" name="useTime" /><input type="hidden" name="groundId" value="<%=rs.getString("groundId")%>"  /><a class="buttons btn btn-success" onclick="submit(this)" style="color: #FFFFFF;cursor:pointer">普通预约</a></form>
                              <%if (role.equals("3")||role.equals("2")||role.equals("1")) {%>
                              <form action="orderGround2.action" method="post"><input type="hidden" name="useTime" /><input type="hidden" name="groundId" value="<%=rs.getString("groundId")%>"  /><a class="buttons btn btn-success" onclick="submit(this)" style="color: #FFFFFF;cursor:pointer">校队预约</a></form>
                              <form action="deleteGround.action" method="post"><input type="hidden" name="useTime" /><input type="hidden" name="groundId" value="<%=rs.getString("groundId")%>"  /><a class="buttons btn btn-danger" onclick="submit(this)" style="color: #FFFFFF;cursor:pointer">删除场地</a></form>
                              <%}%>
                            </td>
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
        <div class="row">
          <div class="col-md-12 col-sm-12 ">
            <div class="x_panel">
              <div class="x_title">
                <h2>场地预约</h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="card-box table-responsive">
                      <table id="table" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                          <th>场地号</th>
                          <th>器材</th>
                          <th>收费标准</th>
                          <th>预约时间</th>
                          <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% Dao dao1 = new Dao();
                          String sql1 = "SELECT * FROM ground WHERE groundStatus=1 OR groundStatus=2 OR groundStatus=3 ";  //查询语句
                          ResultSet rs1 = dao1.executeQuery(sql1);
                          while (rs1.next()) {
                        %>
                        <tr>
                          <td><%=rs1.getString("groundId")%></td>
                          <td><%=rs1.getString("groundEqu")%></td>
                          <td><%=rs1.getString("groundFee")%></td>
                          <td><%=rs1.getString("useTime")%></td>
                          <%if (role.equals("3")||userId.equals(rs1.getString("userId"))){%> <td><form action="orderGround3.action" method="post" ><input type="hidden" name="groundId" value="<%=rs1.getString("groundId")%>"  /><button type="submit" class="buttons btn btn-danger">取消预约</button></form></td>
                        </tr><%}%>
                         <%}%>
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
  <script>

      function submit(event) {
          event.parentNode.children[0].value=event.parentNode.parentNode.parentNode.children[4].children[0].value;
          event.parentNode.submit();
      }

  </script>
</body>

</html>