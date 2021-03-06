<%--
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

</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">登录
                        <%
                        String flag = request.getParameter("flag");
                        if(flag!=null){
                            if(flag.equals("1")){
                                out.print("<span style='color:red;font-size:15px'>密码错误</span>");
                            }else if(flag.equals("0")){
                                out.print("<span style='color:red;font-size:15px'>用户不存在</spanp>");
                            }else{}
                        }
                    %></h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="login.ddf" method="post" onsubmit="return check();" name="form">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="学号" name="id" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="密码" name="password" type="password" value="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <a href="adminlogin.jsp">管理员登录</a>
                                </label>

                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" class="btn btn-lg btn-success btn-block" value="登录"></input>
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
<script type="text/javascript">
    //验证信息填写是否有误
    function check()
    {
       // alert("adsf");
        if(form.id.value.length<6 || form.id.value.length>16)
        {
            alert('用户名不合法！请输入6-16位用户名');
            form.id.focus();
            return false;
        }
        if(form.password.value.length<6 ||form.password.value.length>16)
        {
            alert('密码不合法！请输入6-16位密码');
            form.id.focus();
            return false;
        }
    }
</script>
</body>

</html>

