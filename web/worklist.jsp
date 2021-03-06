<%@ page import="java.net.URLDecoder" %>
<%@ page import="tool.JdbcConn" %>
<%@ page import="bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="bean.PersonGrade" %>
<%@ page import="bean.HomeWork" %><%--
  Created by IntelliJ IDEA.
  User: wzf
  Date: 2017/4/20
  Time: 14:21
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

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">DDF学生管理系统</a>
        </div>
        <!-- /.navbar-header -->
        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i><%=u.getName() %><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="personal.jsp"><i class="fa fa-user fa-fw"></i><%=u.getName() %>的个人主页</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="logout.ddf"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">

                    <li>
                        <a href="main.jsp"><i class="fa fa-dashboard fa-fw"></i> 控制面板</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 个人信息总览<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="persongrade.jsp">个人成绩</a>
                            </li>
                            <li>
                                <a href="worklist.jsp">交作业情况</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="update.jsp"><i class="fa fa-file-text fa-fw"></i> 提交作业</a>
                    </li>
                    <li>
                        <a href="update_score.jsp"><i class="fa fa-edit fa-fw"></i> 提交成绩</a>
                    </li>
                    <li>
                        <a href="address.jsp"><i class="fa fa-phone-square fa-fw"></i> 通讯录</a>
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
                <h1 class="page-header">交作业情况</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        未交
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>科目</th>
                                <th>截止日期</th>
                                <th>当前完成人数</th>
                                <th>提交</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                JdbcConn jdbc = new JdbcConn();
                                ArrayList<HomeWork> works = jdbc.getPensonWork(u.getId());
                                for(HomeWork w : works){
                            %>
                            <tr class="gradeU">
                                <td><%=w.getSubject()%></td>
                                <td><%=w.getDate()%></td>
                                <td><%=jdbc.worksucnum(w.getId())%></td>
                                <td><a href="update.jsp">前往</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        已交
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>科目</th>
                                <th>截止日期</th>
                                <th>当前完成人数</th>

                            </tr>
                            </thead>
                            <tbody>

                            <%
                                ArrayList<HomeWork> suc = jdbc.homeworkList();
                                for(HomeWork s : suc){

                                    int a=0;
                                    for(HomeWork w : works) {
                                        if (s.getId().equals(w.getId()))
                                            a = 1;
                                    }
                                    if(a==0){
                            %>
                            <tr class="gradeU">
                                <td><%=s.getSubject()%></td>
                                <td><%=s.getDate()%></td>
                                <td><%=jdbc.worksucnum(s.getId())%></td>

                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="vendor/raphael/raphael.min.js"></script>
<script src="vendor/morrisjs/morris.min.js"></script>
<!--<script src="../data/morris-data.js"></script>-->

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>
</body>

</html>
