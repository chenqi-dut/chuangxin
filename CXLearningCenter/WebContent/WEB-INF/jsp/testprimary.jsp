<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script type="text/javascript">   
    window.onload = function (){    
    	$.ajax({
    		url:'/CXLearningCenter/user/progress.html',
            dataType: 'json',
            success : function(data) {
            
            }
    	});
       
    };  
    
  
	</script>  


    <title>Test Primary</title>

    <!-- Core CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/DT_bootstrap.css" rel="stylesheet">
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
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row 显示标题-->
            <div class="row">
                <div class="col-lg-12">                   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 题目<b id="CurQuesNum"></b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div id="CurQuesCont" class="panel-body">
                                            <p></p>
                                    </div>                                    
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-8 (nested) 读取的题目的文字部分 -->
                                <div class="col-lg-4">
                        
                                  <i class="fa" id="CurPic"></i>
                                   
                                </div>
                                <!-- /.col-lg-4 (nested) 如果读取的题目中，会有图形，放在此处 -->
                            </div>
                            <!-- /.row -->
                                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                     <div class="panel panel-default" id="AnsPanel">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 参考答案
                        </div>
                        <div id="AnsCont"class="panel-body">
                        	<table class="table table-striped table-hover table-bordered datatable" id="article">
                        	<thead>
                        	<tr>
                        	<th>id</th>
                        	<th>title</th>
                        	<th>description</th>
                        	<th>answer</th>
                        	<th>hardness</th>
                        	<th>category</th>
                        	<th>imageNum_d</th>
                        	<th>imageNum_a</th>
                        	</tr>
                        	</thead>
                        	<tbody>
                        	</tbody>
                        	</table>
                        </div>                   
                        
                      </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">                       
                        <div class="panel-body">
                         <div class="col-lg-12">
                           
                           		<button id="LastQuestion" type="button" class=" btn btn-link" onclick=" ">上一题</button>
                           		                                     
                                            <select class="form-control-select" id="GoNumber">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>                                                
                                            </select>                                            
                                           <!-- select option 应该实现动态绑定 -->                                  	
                                <button id="GoTo" type="button" class=" btn btn-default">Go</button>
                                <button id="NextQuestion" type="button" class="btn btn-link">下一题</button>

                                <button id="CheckAnswer" style="float:right;" type="button" class=" btn btn-info" >查看答案</button> 
                            
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
                
            </div>
            <!-- /.row 题目内容-->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->

    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/plugins/morris/morris.js"></script>
    
<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/DT_bootstrap.js"></script>
     <script >

 		function changeByAjax(num)
        {
			$.ajax({
	            url : '/CXLearningCenter/user/problem/'+num+'.html',
	            dataType: 'json',
	            success : function(data) {
	            	$("div#CurQuesCont").children("p").text(data.description);
	  	 		 	$("b#CurQuesNum").text(num);
	  	 		    $("#AnsCont").children("p").text(data.answer);
	  	 		 	if(data.imageNum_d>0)
	  	 		 	{
	  	 		 		var ImgSrc="${pageContext.request.contextPath}/Resourse/image/"+num+"/"+1+".jpg";
	  	 		 	    $("#CurPic").html("");
	  	 		 		$("#CurPic").append("<img src="+ImgSrc+">");
	  	 		 	}
	            
	            }
	        });
			$("#AnsPanel").hide();
		}
 		$(document).ready(function(){
 			changeByAjax(2);
 			$("#LastQuestion").click(function(){
 				var num=parseInt($("#CurQuesNum").text())-1;
 				if(num==1)$(this).attr("disabled",true);
 				else $(this).attr("disabled",false);
 				changeByAjax(num);
 				
 			});
 			$("#NextQuestion").click(function(){
 				changeByAjax(parseInt($("#CurQuesNum").text())+1);
 			});
 			
 			$('#article').dataTable({
					"oLanguage": {//语言国际化
					},
					"bServerSide":false,//服务端处理分页
					"sAjaxSource": '/CXLearningCenter/user/problems.html',
					'bPaginate': false,  //是否分页。
					"bProcessing": true, //当datatable获取数据时候是否显示正在处理提示信息。
					'bFilter': false,  //是否使用内置的过滤功能
					'bLengthChange': true, //是否允许自定义每页显示条数.
					//'iDisplayLength':1, //每页显示10条记录
					"sPaginationType": "bootstrap", //分页样式   full_numbers
					"aoColumns": [
					{ "sClass": "center", "sName": "id" },
					{ "sClass": "center", "sName": "title" },
					{ "sClass": "center", "sName": "description" },
					{ "sClass": "center", "sName": "answer" },
					{ "sClass": "center", "sName": "hardness" },
					{ "sClass": "center", "sName": "category" },
					{ "sClass": "center", "sName": "imageNum_d" },
					{ "sClass": "center", "sName": "imageNum_a" }
					]
					});
		
 			$("#CheckAnswer").click(function(){
 				
 				if($(this).text()=="查看答案")
 				{
 					$("#AnsPanel").show(500);
 					$(this).text("收起答案");	
 					
 				}
 				else
                {
 					$("#AnsPanel").hide(500);
 					$(this).text("查看答案");	
                }

 				
 			});
 			
		});
 		
 		
 </script>
</body>
</html>
