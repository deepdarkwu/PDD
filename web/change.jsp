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

    <title>修改个人信息</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/structure.css">

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
<form class="box login"  onsubmit="return check();" name="form" method="post" action="changeinfo.ddf">
    <fieldset class="boxBody">
        <label>密码</label>
        <input type="password"  placeholder="密码" name="password" type="password" value="<%=u.getPassword()%>">
        <label>再次输入密码</label>
        <input type="password"  placeholder="二次密码" name="password2" type="password" value="<%=u.getPassword()%>">
        <label>电话</label>
        <input type="text" placeholder="电话" name="phone" type="text" value="<%=u.getPhone()%>">
        <label>QQ</label>
        <input type="text"  placeholder="QQ" name="qq" type="text" value="<%=u.getQq()%>">
        <label>邮箱</label>
        <input type="text"  placeholder="邮箱" name="mail" type="text" value="<%=u.getMail()%>">
    </fieldset>
        <br>
        <input type="submit" class="btn btn-success center-block" value="修改"></input>

</form>

<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>
<script type="text/javascript">

    function check()
    {
        if(form.phone.value.length!=11)
        {
            alert('电话不合法');
            form.phone.focus();
            return false;
        }
        if(form.mail.value.length<1)
        {
            alert('邮箱不合法');
            form.mail.focus();
            return false;
        }
        if(form.qq.value.length<6 || form.id.value.length>16)
        {
            alert('qq账号不合法');
            form.qq.focus();
            return false;
        }
        if(form.password.value.length<6 ||form.password.value.length>16)
        {
            alert('密码不合法！请输入6-16位密码');
            form.password.focus();
            return false;
        }
        if(form.password.value != form.password2.value)//判断两次输入的密码是否一致
        {
            alert("两次输入的密码不一致！");
            form.password2.focus();
            return false;
        }
    }
</script>
</body>

</html>

