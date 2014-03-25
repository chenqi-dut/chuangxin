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


    <title>学习中心</title>

    <!-- Core CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/DT_bootstrap.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/plugins/morris/morris.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>
    
</head>

<body>

    <div id="wrapper">

      
        <jsp:include page="/WEB-INF/jsp/home.jsp"/> 
        <!-- /.navbar-static-side -->

        <div id="page-wrapper">
       		 <ol class="breadcrumb">
       			 <li class="active" id="level">Data</li>
 				 <li class="active" id="category">Data</li>
            </ol>
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
                        	<p></p>
                        </div>                   
                        
                      </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">                       
                        <div class="panel-body">
                         <nav class="navbar navbar-default" role="navigation">
                           
                           		<button id="LastQuestion" type="button" class=" btn btn-link" onclick=" ">上一题</button>                                   
                                <input type="text" style="width:30px;" class="form-control" id="GoNumber">                                	
                                <button id="GoTo" type="button" class=" btn btn-default">Go</button>
                                <button id="NextQuestion" type="button" class="btn btn-link">下一题</button>

                                <button id="CheckAnswer" style="float:right;" type="button" class=" btn btn-info" >查看答案</button> 
                            
                            </nav>
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
 			
 			$("#level").text($.cookie('level'));
 			$("#category").text($.cookie('category'));
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
