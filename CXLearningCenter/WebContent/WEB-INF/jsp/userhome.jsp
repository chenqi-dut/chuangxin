<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
	<link href="${pageContext.request.contextPath}/Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/DT_bootstrap.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
	<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>
<body>

  <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">在线题库</a>
            </div>
            <!-- /.navbar-header -->
            
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="login.html"><i class="fa fa-user fa-fw"></i><sec:authentication property="principal.username" /> </a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/j_spring_security_logout" />" > Logout</a><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
        </nav>
 <nav class="navbar-default navbar-static-side" >
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> 欢迎访问</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 学习中心<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level" id="hardness">
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-table fa-fw"></i> 得分统计</a>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> 答题记录<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="panels-wells.html">Panels and Wells</a>
                            </li>
                            <li>
                                <a href="buttons.html">Buttons</a>
                            </li>                    
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-edit fa-fw"></i> 意见反馈</a>
                    </li>
                 </ul>
                <!-- /#side-menu -->
            </div>
            <!-- /.sidebar-collapse -->
        </nav>
 	
 	<script>
 	$(document).ready(function(){
 		$.ajax({
  			url : '/CXLearningCenter/user/hardnesses.html',
            dataType: 'json',
            success : function(data) {
            	var levelID={};
            	var ul=$("#hardness");
            	for(var i in data)
            	{
            		var item=data[i];
            			ul.append("<li><a href='#'>"+item.level+"</a></li>");
            			levelID[item.level]=item.id;
            	}
            	$("#hardness a").each(function(index){
         			$(this).bind("click",function(){
         				$.cookie('level',$(this).text());
         				$.cookie('levelID',levelID[$(this).text()])
         			    location.href="menupage.html"; 
         			});
         			
         		});
            }
 			
 		});
 	});
 		
 	</script>
</body>
</html>