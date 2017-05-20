<%@ page import="bean.Admin" %>
<%@ page import="tool.JdbcConn" %>
<%@ page import="bean.User" %>
<%@ page import="tool.ZIP" %><%--
  Created by IntelliJ IDEA.
  User: wzf
  Date: 2017/5/7
  Time: 18:40
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

    <title>DDF学生管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script type="application/javascript">
    <%
        Admin a = (Admin)session.getAttribute("admin");
        if(a==null){
                a = new Admin("null","null","null");
                out.print("alert(\"请登录\");");
                out.print("top.location='adminlogin.jsp';");
            }
    %>
</script>
<body  style="background: #D8EBF5;">

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background: #395070;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="admin.jsp" style="color: #DBE8FC;">DDF学生管理系统（管理端）</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right" >

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #94BCF7">
                    <i class="fa fa-user fa-fw"></i><%=a.getName()%><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="logout.ddf"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation"  style="background: #D8EBF5;">
            <div class="sidebar-nav navbar-collapse" style="background: #D8EBF5;">
                <ul class="nav" id="side-menu" style="background: #D8EBF5;" >
                    <li>
                        <a href="admin.jsp"><i class="fa fa-dashboard fa-fw"></i> 控制面板</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 信息总览<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="gradeall.jsp">成绩总览</a>
                            </li>
                            <li>
                                <a href="adminwork.jsp">交作业情况总览</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i>学生管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="adminaddress.jsp"> 学生信息列表</a>
                            </li>
                            <li>
                                <a href="adduser.jsp">添加学生</a>
                            <li>
                                <a href="deleteuser.jsp">删除学生</a>
                            </li>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="sendmes.jsp"><i class="fa fa-comments fa-fw"></i> 发送通知</a>
                    </li>
                    <li>
                        <a href="newhomework.jsp"><i class="fa fa-file-text-o fa-fw"></i> 发布作业</a>
                    </li>
                    <li>
                        <a href="addsuject.jsp"><i class="fa fa-file-text-o fa-fw"></i> 发布成绩提交</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <%JdbcConn jdbc = new JdbcConn();%>
                <h1 class="page-header"><%=jdbc.getsubjectbyid(Integer.parseInt(request.getParameter("id")))%></h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        没交作业的人
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>邮箱</th>
                                <th>QQ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%

                                //System.out.println(jdbc.nothomework(request.getParameter("id")).size());
                                for(String s : jdbc.nothomework(request.getParameter("id"))){
                                    User u = jdbc.getuserbyid(s);

                            %>
                            <tr class="gradeU">
                                <td><%=u.getName()%></td>
                                <td><a href="tel:<%=u.getPhone()%>"><%=u.getPhone()%></a></td>
                                <td><a href="mailto:<%=u.getMail()%>"><%=u.getMail()%></a></td>
                                <td onclick="a('<%=u.getQq()%>')"><a style="cursor: pointer;"><%=u.getQq()%></a></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>

                    </div>
                    <!-- /.panel-body -->
                </div>

                <%
                    ZIP zip=new ZIP();
                    zip.zip(request.getParameter("id"));

                %>
                <button type="button" class="btn btn-primary" onclick="download()">打包下载</button>


                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<script type="application/javascript">
    function a (i){


        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        if (flag == true){
            top.location='tencent://message/?uin='+i;

        }
        else {
            top.location='mqqwpa://im/chat?chat_type=wpa&uin='+i+'&version=1';
        }
        //history.back();

    }
    function  download() {
        top.location="file/work.rar";

    }
</script>
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
