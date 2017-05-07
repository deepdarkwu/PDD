<%@ page import="tool.JdbcConn" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.*" %><%--
  Created by IntelliJ IDEA.
  User: wzf
  Date: 2017/5/7
  Time: 11:11
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
            <a class="navbar-brand" href="index.html" style="color: #DBE8FC;">DDF学生管理系统（管理端）</a>
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
                                <a href="GradeAll.jsp">成绩总览</a>
                            </li>
                            <li>
                                <a href="adminwork.jsp">交作业情况总览</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="address.jsp"><i class="fa fa-table fa-fw"></i> 学生信息列表</a>
                    </li>
                    <li>
                        <a href="sendmes.jsp"><i class="fa fa-comments fa-fw"></i> 发送通知</a>
                    </li>
                    <li>
                        <a href="newhomework.jsp"><i class="fa fa-file-text-o fa-fw"></i> 发布作业</a>
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
                <h1 class="page-header">控制面板</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">

                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <%
                                        JdbcConn jdbc = new JdbcConn();
                                        int mesi=0;
                                        for(Message m : jdbc.messagelist()){
                                            mesi++;
                                        }
                                        out.print(mesi);
                                    %>
                                </div>
                                <div>发布通知</div>
                            </div>
                        </div>

                    </div>
                    <a href="#tongzhi">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="glyphicon glyphicon-th-list fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <%
                                        int addi=0;
                                        for(User uu : jdbc.list()){
                                            addi++;
                                        }
                                        out.print(addi);
                                    %>
                                </div>
                                <div>学生信息列表</div>
                            </div>
                        </div>
                    </div>
                    <a href="address.jsp">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="glyphicon glyphicon-list-alt fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <%
                                        int scorei=0;
                                        ArrayList<Grade> pg = jdbc.gradeList();
                                        for(Grade g :pg){
                                                scorei++;
                                        }
                                        out.print(scorei);
                                    %>
                                </div>
                                <div>成绩总览</div>
                            </div>
                        </div>
                    </div>
                    <a href="GradeAll.jsp">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-file-text-o fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <%
                                        int homei=0;
                                        ArrayList<HomeWork> works = jdbc.homeworkList();
                                        for(HomeWork w : works){
                                            homei++;
                                        }
                                        out.print(homei);
                                    %></div>
                                <div>作业总览</div>
                            </div>
                        </div>
                    </div>
                    <a href="HomeWorkAll.jsp">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    Actions
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a href="#">Action</a>
                                    </li>
                                    <li><a href="#">Another action</a>
                                    </li>
                                    <li><a href="#">Something else here</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>

                <div class="panel panel-default" id="tongzhi">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> 通知
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <ul class="timeline">
                            <%
                                String warn = "warning";
                                String danger = "danger";
                                String info = "info";
                                String success = "success";
                                int i=0;

                                ArrayList<Message> mess = jdbc.messagelist();
                                for(Message m : mess){

                                        i++;
                            %>
                            <li <% if(i%2==0){out.print("class=\"timeline-inverted\"");}%> onclick="infourl('<%=m.getUrl()%>')">
                                <div class="timeline-badge"><i class="fa"><%=m.getLevel()%></i>
                                </div>
                                <div class="timeline-panel <% if(m.getLevel()==0)out.print(success);
                                                                        else if(m.getLevel()==1)out.print(warn);
                                                                        else if(m.getLevel()==2)out.print(info);
                                                                        else  if(m.getLevel()==3)out.print(danger);
                                                                        else{}%>">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title"><%=m.getTitle()%></h4>

                                    </div>
                                    <div class="timeline-body">
                                        <p><%=m.getInfo()%></p>
                                        <br/>

                                    </div>
                                    <a href="<%=m.getUrl()%>" style="font-size: 12px;">点我直接进入</a>
                                </div>
                            </li>
                            <%

                                }
                            %>

                        </ul>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>

        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<script type="application/javascript">
    infourl(){
        alert("adf");
    }
</script>
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

<script type="application/javascript">
    $(function() {

        Morris.Area({
            element: 'morris-area-chart',
            data: [{
                period: '2010 Q1',
                iphone: 2666,
                ipad: null,
                itouch: 2647
            }, {
                period: '2010 Q2',
                iphone: 2778,
                ipad: 2294,
                itouch: 2441
            }, {
                period: '2010 Q3',
                iphone: 4912,
                ipad: 1969,
                itouch: 2501
            }, {
                period: '2010 Q4',
                iphone: 3767,
                ipad: 3597,
                itouch: 5689
            }, {
                period: '2011 Q1',
                iphone: 6810,
                ipad: 1914,
                itouch: 2293
            }, {
                period: '2011 Q2',
                iphone: 5670,
                ipad: 4293,
                itouch: 1881
            }, {
                period: '2011 Q3',
                iphone: 4820,
                ipad: 3795,
                itouch: 1588
            }, {
                period: '2011 Q4',
                iphone: 15073,
                ipad: 5967,
                itouch: 5175
            }, {
                period: '2012 Q1',
                iphone: 10687,
                ipad: 4460,
                itouch: 2028
            }, {
                period: '2012 Q2',
                iphone: 8432,
                ipad: 5713,
                itouch: 1791
            }],
            xkey: 'period',
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['iPhone', 'iPad', 'iPod Touch'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
        });

        Morris.Donut({
            element: 'morris-donut-chart',
            data: [{
                label: "Download Sales",
                value: 12
            }, {
                label: "In-Store Sales",
                value: 30
            }, {
                label: "Mail-Order Sales",
                value: 20
            }],
            resize: true
        });

        Morris.Bar({
            element: 'morris-bar-chart',
            data: [{
                y: '2006',
                a: 100,
                b: 90
            }, {
                y: '2007',
                a: 75,
                b: 65
            }, {
                y: '2008',
                a: 50,
                b: 40
            }, {
                y: '2009',
                a: 75,
                b: 65
            }, {
                y: '2010',
                a: 50,
                b: 40
            }, {
                y: '2011',
                a: 75,
                b: 65
            }, {
                y: '2012',
                a: 100,
                b: 90
            }],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B'],
            hideHover: 'auto',
            resize: true
        });

    });

</script>
</body>

</html>
