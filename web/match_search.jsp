<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<%@ page import="dao.Dao" %>

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

  <style>
    .buttons{padding: 4px 6px;margin: 0px;line-height: 1;font-size: 12px;}
  </style>

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
              <h2>赛事信息查询</h2>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <div class="row">
                <div class="col-sm-12">
                  <div class="card-box table-responsive">
                    <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                      <tr>
                        <th>赛事号</th>
                        <th>场地</th>
                        <th>申请人</th>
                        <th>电话</th>
                        <th>裁判</th>
                        <th>时间</th>
                        <%if (role.equals("3")) {%>
                        <th>操作</th>
                        <%}%>
                      </tr>
                      </thead>
                      <tbody>
                      <%

                        String sql = "select * from matchdetail";
                        ResultSet rs = dao.executeQuery(sql);



                        while (rs.next()) {
                          int mId =rs.getInt("mId");
                      %>

                      <tr>
                        <td><%=rs.getInt("mId") %></td>
                        <td><%=rs.getString("groundName") %></td>
                        <td><%=rs.getString("applicant") %></td>
                        <td><%=rs.getString("phone") %></td>
                        <td><%=rs.getString("referee") %></td>
                        <td><%=rs.getString("startTime").substring(0, rs.getString("startTime").indexOf("."))%> - <%=rs.getString("endTime").substring(0, rs.getString("endTime").indexOf("."))%></td>
                        <td>
                          <form action="deleteMatch.action" method="post" id="delete">
                            <button type="submit" id="<%=mId%>" onclick="postdel(this)"  class="buttons btn btn-danger">删除赛事</button>
                            <input type="hidden" name="mId" id="mId" />
                          </form>
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
<script>
  function postdel(event) {
    document.getElementById("mId").value = event.id;
    document.getElementById("delete").submit();
  }

</script>



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