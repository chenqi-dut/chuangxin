<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>

    



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

    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>
    
</head>

<body>

    <div id="wrapper">

      
        <jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
        <!-- /.navbar-static-side -->

        <div id="page-wrapper">
       		 <ol class="breadcrumb">
       			 <li class="active" id="level">Data</li>
 				 <li class="active" id="category">Data</li>
            </ol>
           
            <!-- /.row 显示标题-->
            <div class="row">
                <div class="col-lg-12">                   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 题目<b id="CurQuesNum"></b><b id="Pro-title"></b>
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
                         <nav class="navbar navbar-default" >
					        <div class="navbar-header">

					        </div>
					        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
					          <div class="navbar-form navbar-left" >
					            <button id="LastQuestion" class=" btn btn-link">上一题</button> 
					            <div class="form-group">
					              <input id="Go-value" type="text" style="width:60px;" class="form-control" >
					            </div>
					            <button id="Goto" class="btn btn-default">Go</button>
					            <button id="NextQuestion"  class="btn btn-link">下一题</button>
					          </div>
					          <div class="navbar-form navbar-right" >
					          	<button id="CheckAnswer" class=" btn btn-primary" >查看答案</button> 
					          	<button id="return" class=" btn btn-primary" >返回</button>
					          </div>
					        </div>
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
 
 		function changeByAjax(id,num)
        {
			$.ajax({
	            url : '/CXLearningCenter/user/problem/'+id+'.html',
	            dataType: 'json',
	            success : function(data) {
	            	$("div#CurQuesCont").children("p").text(data.description);
	  	 		 	$("b#CurQuesNum").text(num);
	  	 		 	$("#Pro-title").text(data.title);
	  	 		    $("#AnsCont").children("p").text(data.answer);
	  	 		    $("#CheckAnswer").text("查看答案");
	  	 		 	if(data.imageNum_d>0)
	  	 		 	{
	  	 		 		var ImgSrc="${pageContext.request.contextPath}/Resourse/image/"+id+"/"+1+".jpg";
	  	 		 	    $("#CurPic").html("");
	  	 		 		$("#CurPic").append("<img src="+ImgSrc+">");
	  	 		 	}
	            
	            }
	        });
			$("#AnsPanel").hide();
		}
 		function checkProblem(num,length)
 		{
 			if(num==1)$("#LastQuestion").attr("disabled",true);
			else $("#LastQuestion").attr("disabled",false);
 			
 			if(num==length){
 				$("#NextQuestion").attr("disabled",true);
 				$("#return").show();
 			}
 			else {
 				$("#NextQuestion").attr("disabled",false);
 				$("#return").hide();
 			}
 			
 		}
 		$(document).ready(function(){

 			$("#level").text($.cookie('level'));
 			$("#category").text($.cookie('category'));
            $.ajax({
            	 url : '/CXLearningCenter/user/problemids/'+$.cookie('levelID')+'/'+$.cookie("categoryID")+'.html',
            	 dataType: 'json',
            	 success : function(data) {
            	     var num=parseInt($.cookie('problem'));
            	     var problemID=data[num-1];
            		
            		changeByAjax(problemID,num);
            		checkProblem(num,data.length);
            		$("#LastQuestion").click(function(){
            			num=num-1;
            			checkProblem(num,data.length);
            		    
         				changeByAjax(data[num-1],num);
         				
         			});
         			$("#NextQuestion").click(function(){
         				$.ajax({url:'/CXLearningCenter/user/setprogress/'+data[num-1]+'.html'});
         				num=num+1;
         				checkProblem(num,data.length);
         				
         				changeByAjax(data[num-1],num);
         				
         				
         			});
         			$("#Goto").click(function(){
         				var value=$("#Go-value").val();
         				var reg=/^[1-9]\d*$|^0$/;
         				if(reg.test(value))
         				{
         					value=parseInt(value);
         				    if(value>data.length||value<=0)
         				    {
         				    	alert("超出题库范围");
         				    }
         				    else
         				    {
         				    	num=value;
         				    	checkProblem(num,data.length);
         				    	changeByAjax(data[num-1],value);
         				    }
         				}
         				else{
         					alert("请输入数字");
         				}
         			});
         			$("#return").click(function(){
         				location.href="menupage.html";
         			});
         			
            		
            	 }
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
