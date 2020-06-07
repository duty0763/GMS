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
                  <li><a href="">馆内设施罚款条例公告</a></li>
                  <li><a href="announcement_publish.jsp">发布馆内设施罚款条例公告</a></li>
                  <li><a href="manager-search.jsp">查询管理员用户</a></li>
                  <li><a href="user-search.jsp">查询用户</a></li>
                  <li><a href="password_change.jsp">修改密码</a></li>
                </ul>
              </li>
              <li><a><i class="fa fa-university"></i> 场地管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li><a href="ground_add.jsp">添加场地</a></li>
                  <!--0空闲 1租用 2校队占用 3赛事占用 4禁用-->
                  <li><a href="ground_search.jsp">场地查询</a></li>
                  <!--在底部放置预约的选项
                        在如果有预约 在预约下面显示预约信息（包括修改和删除功能）-->
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
                  <!--器材号不用写 主键自增就行-->
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
              <h2>馆内设施罚款条例公告</h2>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <div class="dashboard-widget-content">
                <!--公告item li ---------------------------------------------------------------------->
                <ul class="list-unstyled timeline widget">
                  <li>
                    <div class="block">
                      <div class="block_content">
                        <h2 class="title">关于湖光校区南大门及广场改造方案征求意见的通知海大体育馆关闭公告
                        </h2>
                        <div class="byline">
                          <span>梅志刚</span>&nbsp;&nbsp;&nbsp;<span>2020-05-29</span>
                        </div>
                        <p class="excerpt">学校全体师生、各届校友：

                          我校湖光校区南大门及广场建成于1998年，现外部装修已经陈旧，外墙砖有脱落现象，南门广场及周边环境也因海大路的扩建受到严重破坏，为美化南大门，建设美丽海大，学校立项改造湖光校区南大门及广场。为做好该项工作，学校委托设计单位提出了四个改造方案（见附件），现公开征求意见，敬请广大师生员工和校友提出意见和建议。
                          征集时间：2020年5月29日至2020年6月2日 联系邮箱：jjc@gdou.edu.cn 基建处 2020年5月29日
                        </p>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="block">
                      <div class="block_content">
                        <h2 class="title">关于继续封闭我校湖光校区南门的通知
                        </h2>
                        <div class="byline">
                          <span>关阳</span>&nbsp;&nbsp;&nbsp;<span>2020-05-19</span>
                        </div>
                        <p class="excerpt">
                          各单位、部门：目前，海大路扩建工程正处于收尾阶段，湖光校区南门尚未正式启用。近期出现个别教职员工经海大路从湖光校区南门进出校园的现象，给学校常态化疫情防控工作及校园实施封闭性管理增加了诸多风险隐患。当前，学校已进入学生分批次返校的重要时期，为全面加强校园进出管理，抓紧抓实抓细常态化疫情防控安保工作，确保校园安全和师生健康，学校继续封闭湖光校区南门，直至海大路正式启用。请全体师生员工继续从湖光校区西一门进出。
                          广东海洋大学 2020年5月19日</p>
                      </div>
                    </div>
                  </li>
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
