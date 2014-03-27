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
           <!-- /.row 显示标题-->
            <div class="row ">            
                <div class="col-lg-12">                   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 题目列表
                        </div>
                        <!-- /.panel-heading -->
                        <!-- /.panel-heading -->
                   		<div id="AnsCont"class="panel-body">
                        	<table class="table table-striped table-hover table-bordered datatable" id="article">
                        	<thead>
                        	<tr>
                        	<th>题目编号</th>
                        	<th>题目标题</th>
                        	<th>题目难度</th>
                        	<th>题目分类</th>
                        	<th>题目描述</th>
                        	<th>题目答案</th>
                        	<th></th>
                        	</tr>
                        	</thead>
                        	<tbody>
                        	</tbody>
                        	</table>
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
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/DT_bootstrap.js"></script>
    <script>
    $(document).ready(function(){
    	$('#article').dataTable({
			"oLanguage": {//语言国际化
			},
			"bServerSide":false,//服务端处理分页
			"sAjaxSource": '/CXLearningCenter/user/problems.html',
			'bPaginate': true,  //是否分页。
			"bProcessing": true, //当datatable获取数据时候是否显示正在处理提示信息。
			'bFilter': false,  //是否使用内置的过滤功能
			'bLengthChange': true, //是否允许自定义每页显示条数.
			//'iDisplayLength':1, //每页显示10条记录
			"sPaginationType": "bootstrap", //分页样式   full_numbers
			"aoColumns": [
			{ "sClass": "center", "sName": "id" },
			{ "sClass": "center", "sName": "title" },
			{ "sClass": "center", "sName": "hardness" },			
			{ "sClass": "center", "sName": "category" },
			{ "sClass": "center", "sName": "description" },
			{ "sClass": "center", "sName": "answer" },
			{
				"sName": "id",
				"sClass": "center",
				"bSearchable": false,
				"bStorable": false,
				"sWidth":100,				
				"fnRender": function (obj) {
				return '<a class="ajaxify" href="#">编辑</a> ' + ' <a href="#">删除</a>';
			    }
			}
			]
		});
    });
    
    </script>

    
</body>
</html>
