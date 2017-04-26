<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: wzf
  Date: 2017/4/21
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>登录</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="application/javascript">
        <%
            User u = (User)session.getAttribute("user");
            if(u==null){
                u = new User("null","null","null","null","null","null",10);
                out.print("alert(\"请登录\");");
                out.print("top.location='login.jsp';");
            }
        %>
    </script>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">更改个人信息</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="changeinfo.ddf" method="post">
                        <fieldset>
                            <div class="form-group">
                                <h3>密码</h3><input class="form-control" placeholder="密码" name="password" type="password" value="<%=u.getPassword()%>">
                            </div>
                            <div class="form-group">
                                <h3>二次输入密码</h3><input class="form-control" placeholder="二次密码" name="password2" type="password" value="<%=u.getPassword()%>">
                            </div>
                            <div class="form-group">
                                <h3>电话</h3><input class="form-control" placeholder="电话" name="phone" type="text" value="<%=u.getPhone()%>">
                            </div>
                            <div class="form-group">
                                <h3>QQ</h3><input class="form-control" placeholder="QQ" name="qq" type="text" value="<%=u.getQq()%>">
                            </div>
                            <div class="form-group">
                                <h3>邮箱</h3><input class="form-control" placeholder="邮箱" name="mail" type="text" value="<%=u.getMail()%>">
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" class="btn btn-lg btn-success btn-block" value="修改"></input>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>

</body>

</html>

