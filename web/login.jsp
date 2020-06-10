<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>海大体育馆系统登录/注册</title>

    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="/vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="login.action" method="post">
                    <h1>海大体育馆系统登录</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="一卡通号" required="" name="userId"/>
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="密码" required="" name="password"/>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary btn-sm">登录</button>
                        <a class="reset_pass" href="#">忘记密码？</a>
                    </div>
                    <div class="clearfix"></div>
                    <div class="separator">
                        <p class="change_link">没有账号？
                            <a href="#signup" class="to_register"> 点此注册账号 </a>
                        </p>
                        <div class="clearfix"></div>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <div class="pull-right">GDOU_Managerment_System</div>
                    </div>
                </form>
            </section>
        </div>

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form action="register.action" method="post">
                    <h1>海大体育馆系统注册</h1>
                    <div>
                        <input type="text" class="form-control" name="userId" placeholder="一卡通号" required=""/>
                    </div>
                    <div>
                        <input type="text" class="form-control" name="major" placeholder="专业班级(教职工不用填写)" />
                    </div>
                    <div>
                        <input type="text" class="form-control" name="userName" placeholder="姓名" required=""/>
                    </div>
                    <div>
                        <input type="text" class="form-control" name="phone" placeholder="电话号码" required=""/>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="password" placeholder="密码" required=""/>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="rePassword" placeholder="重复密码" required=""/>
                    </div>
                    <p>
                    <input type="radio" class="flat" name="role" value="0" checked=""/> 学生&nbsp;&nbsp;&nbsp;
                    <input type="radio" class="flat" name="role" value="1"/> 教职工
                    </p>
                    <div>
                        <button type="submit" class="btn btn-primary btn-sm">注册</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">已有账号？
                            <a href="#signin" class="to_register"> 点此登录 </a>
                        </p>

                        <div class="clearfix"></div>
                        <div class="clearfix"></div>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <div class="pull-right">GDOU_Managerment_System</div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/vendors/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/vendors/moment/min/moment.min.js"></script>
<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="/vendors/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="/vendors/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="/vendors/starrr/dist/starrr.js"></script>
<!-- Custom Theme Scripts -->
<script src="/build/js/custom.min.js"></script>

</body>
</html>
