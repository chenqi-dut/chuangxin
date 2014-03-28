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
		<link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
	<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>
<body>

 		<nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
            <div class="navbar-header" style="background-image:url('${pageContext.request.contextPath}/Resourse/bootstrap/images/bg2.png');width:100%;height:50px;">
            
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html" ><font face="微软雅黑" color=" #FFFFFF" >在线题库</font></a>
                
                <ul class="nav navbar-top-links navbar-right" >
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="login.html"><i class="fa fa-user fa-fw"></i><sec:authentication property="principal.username" /> </a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>设置</a>
                        </li>
                        <li class="divider"></li>
                       <li><a href="<c:url value="/j_spring_security_logout" />" > 注销</a><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
                
            </div>
            <!-- /.navbar-header -->
            
           
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
                        <a href="userinfopage.html"><i class="fa fa-table fa-fw"></i>用户信息</a>
                    </li>
                    <sec:authorize ifAllGranted="ROLE_ADMIN">
                    <li>
                      <a href="adminpage.html"><i class="fa fa-edit fa-fw"></i> 题库设置</a>
                    </li>
                    </sec:authorize>
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