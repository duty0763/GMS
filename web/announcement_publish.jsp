<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
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
                <h2>发布馆内设施罚款条例公告</h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <form data-parsley-validate="" class="form-horizontal form-label-left">
                  <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">内容
                    </label>
                    <div class="col-md-6 col-sm-6 ">
                        <textarea class="form-control" rows="15" placeholder="请在此处输入内容"></textarea>
                    </div>
                  </div>
                  <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">发布人
                    </label>
                    <div class="col-md-6 col-sm-6 ">
                      <input type="text" id="publishUser" name="publishUser" required="required" class="form-control">
                    </div>
                  </div>
                  <div class="item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">电话号码
                    </label>
                    <div class="col-md-6 col-sm-6 ">
                      <input type="text" id="phone" name="phone" required="required" class="form-control">
                    </div>
                  </div>

                  <div class="ln_solid"></div>
                  <div class="item form-group">
                    <div class="col-md-6 col-sm-6 offset-md-3">
                      <button class="btn btn-primary" type="button">取消</button>
                      <button class="btn btn-primary" type="reset">重置</button>
                      <button type="submit" class="btn btn-success">提交</button>
                    </div>
                  </div>
                </form>
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