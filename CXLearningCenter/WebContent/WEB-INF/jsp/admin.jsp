<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Test Primary</title>

	<link href="${pageContext.request.contextPath}/Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/DT_bootstrap.css" rel="stylesheet">
	
	    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
		    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
	
</head>

<body>
    <div id="wrapper">
       <jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
        <!-- /.navbar-static-side -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">欢迎访问在线答题网站</h1>
                </div>
            </div>
           <!-- /.row 显示标题-->
            <div class="row ">            
                <div class="col-lg-12">                   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 题目列表
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body"> 
                        <!-- /.panel-heading -->
                   							<div class="table-responsive">
        										<table class="display" id="dataTable">
													<thead>
														<tr>
															<th >题号</th>
															<th >题目名称</th>	
														</tr>
													</thead>
													<tbody>		
													</tbody>					
												</table>        
   											</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->                
            </div>
            <!-- /.row 题目列表-->
		</div>
       <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->


    
</body>
</html>
