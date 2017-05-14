<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="tool.JdbcConn" %>
<%@ page import="java.lang.reflect.Member" %>
<%@ page import="bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
                        <i class="fa fa-user fa-fw"></i><%=u.getName()%><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="personal.jsp"><i class="fa fa-user fa-fw"></i><%=u.getName() %>个人主页</a>
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
                                    <div>通知</div>
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
                                    <i class="fa fa-file-text fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%
                                        int homei=0;
                                        ArrayList<HomeWork> works = jdbc.getPensonWork(u.getId());
                                        for(HomeWork w : works){
                                            homei++;
                                        }
                                        out.print(homei);
                                    %></div>
                                    <div>提交作业</div>
                                </div>
                            </div>
                        </div>
                        <a href="update.jsp">
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
                                    <i class="fa fa-edit fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%
                                            int scorei=0;
                                            ArrayList<PersonGrade> pg = jdbc.getPensonGrade(u.getId());
                                            for(PersonGrade g :pg){
                                                if(g.getScore().equals("0")){
                                                        scorei++;
                                                    }
                                            }
                                            out.print(scorei);
                                        %>
                                    </div>
                                    <div>提交成绩</div>
                                </div>
                            </div>
                        </div>
                        <a href="update_score.jsp">
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
                                    <i class="fa fa-phone-square fa-5x"></i>
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
                                    <div>通讯录</div>
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
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            个人平均分分布
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-pie-chart"></div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    
                    <!-- /.panel -->
                    <div class="panel panel-default" id="tongzhi">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
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
                                        if(u.getPosition()<=m.getLevel()){
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

    <!-- jQuery -->
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Flot Charts JavaScript -->
    <script src="vendor/flot/excanvas.min.js"></script>
    <script src="vendor/flot/jquery.flot.js"></script>
    <script src="vendor/flot/jquery.flot.pie.js"></script>
    <script src="vendor/flot/jquery.flot.resize.js"></script>
    <script src="vendor/flot/jquery.flot.time.js"></script>
    <script src="vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
    <!--<script src="../data/flot-data.js"></script>-->

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <script type="application/javascript">
        //Flot Pie Chart
        <%
            ArrayList<Integer> ave = jdbc.chart(jdbc.ave(u.getId()));
            //jdbc.adminave();
        %>
        $(function() {

            var data = [{
                label: "不及格",
                data: <%=ave.get(0)%>
            }, {
                label: "60-70",
                data: <%=ave.get(1)%>
            }, {
                label: "70-80",
                data: <%=ave.get(2)%>
            }, {
                label: "80-90",
                data: <%=ave.get(3)%>
            }, {
                label: "90-100",
                data: <%=ave.get(4)%>
            }];

            var plotObj = $.plot($("#flot-pie-chart"), data, {
                series: {
                    pie: {
                        show: true
                    }
                },
                grid: {
                    hoverable: true
                },
                tooltip: true,
                tooltipOpts: {
                    content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                    shifts: {
                        x: 20,
                        y: 0
                    },
                    defaultTheme: false
                }
            });

        });
    </script>
</body>

</html>

