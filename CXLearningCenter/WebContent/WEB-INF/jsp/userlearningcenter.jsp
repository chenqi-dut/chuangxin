<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">
    <title>学习中心</title>

    
</head>

<body>

    <div id="wrapper" >

      
        <jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
        <!-- /.navbar-static-side -->

        <div id="page-wrapper"  style="padding-bottom: 60px;">
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
                        <div class="panel-body" id="ProCont">
                          
                            <!-- /.row -->
                                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                     <div class="panel panel-default" id="AnsPanel">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 参考答案
                        </div>
                        <div id="AnsCont"class="panel-body">
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
					              <span id = 'sp' class="alert-danger" style ="display: none;"></span >
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
 
        function setfooter()
        {
        	var footertop=$("#page-wrapper").offset().top+$("#page-wrapper").height();
        	$("#footer").css("top",footertop+50);
        }
 		function changeByAjax(id,num)
        {
			$.ajax({
	            url : '/CXLearningCenter/user/problem/'+id+'.html',
	            dataType: 'json',
	            success : function(data) {
	            	$("div#CurQuesCont").children("p").html(data.description.replace(/\\n/g,"<br>"));
	  	 		 	$("b#CurQuesNum").text(num);
	  	 		 	$("#Pro-title").text(data.title);
	  	 		    $("#CurPic").html("");
	  	 		    $("#CheckAnswer").text("查看答案");
	  	 		 	if(data.imageNum_d>0)
	  	 		 	{
	  	 		 		var problemhtml='<div class="col-lg-4"><p>'+data.description.replace(/\\n/g,"<br>")+
	  	 		 						'</p></div><div class="col-lg-4"><i class="fa"><i>';
	  	 		 		for(var i=1;i<=data.imageNum_d;++i)
	  	 		 		{
	  	 		 			problemhtml+="<img src="+"${pageContext.request.contextPath}/Resourse/image/"+id+"/"+i+".png>";
	  	 		 		}
	  	 		 	    problemhtml+='</i></div>';
	  	 		 		$("#ProCont").html(problemhtml);
	  	 		 	}
	  	 		 	else
	  	 		 	{
	  	 		 		$("#ProCont").html("<p>"+data.description.replace(/\\n/g,"<br>")+"</p>");
	  	 		 	}
	  	 		    if(data.imageNum_a==0)
	  	 		 	{
	  	 		 		$("#AnsCont").html("<p>"+data.answer.replace(/\\n/g,"<br>")+"</p>");
	  	 		 	}
	  	 		 	else if(!(data.answer===null))
	  	 		 	{
	  	 		 		var anshtml='<div class="col-lg-4"><div class="panel-body"><p>'+
	  	 		 					data.answer.replace(/\\n/g,"<br>")+'</p></div></div> <div class="col-lg-4"><i class="fa">';
	  	 		 					
 		 				for(var i=1;i<=data.imageNum_a;++i)
	  	 		 		{
 		 					anshtml+="<img src="+"${pageContext.request.contextPath}/Resourse/image/"+id+"/a"+i+".png>";
	  	 		 		}
 		 				anshtml+='</i> </div>';
	  	 		 		$("#AnsCont").html(anshtml);
                        
	  	 		 	}
	  	 		 	else
	                {
		  	 		 	var anshtml='<div class="panel-body"><div class="col-lg-4"><i class="fa">';
		 					
						for(var i=1;i<=data.imageNum_a;++i)
				 		{
							anshtml+="<img src="+"${pageContext.request.contextPath}/Resourse/image/"+id+"/a"+i+".png>";
				 		}
						anshtml+='</i> </div></div>';
				 		$("#AnsCont").html(anshtml);
	                }
	  	 		 	setfooter();
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
         				    	  $('#sp').css("display","");
         				    	  $('#sp').html( "请输入"+data.length+"以下数字");
             				      $('#Go-value').val("");
         				    }
         				    else
         				    {
         				    	$('#sp').css("display","none");
         				    	num=value;
         				    	checkProblem(num,data.length);
         				    	changeByAjax(data[num-1],value);
         				    }
         				}
         				else{
         					$('#sp').css("display","");
   				    	    $('#sp').html( "请输入数字");
       				        $('#Go-value').val("");
         				}
         			});
         			$("#return").click(function(){
         				location.href="menupage.html";
         			});
         			
            		
            	 }
            });
 			
 			
            $("#page-wrapper").resize(function(){
     			alert( window.screen.availHeight);
     		});
		
 			$("#CheckAnswer").click(function(){
 				
 				if($(this).text()=="查看答案")
 				{
 					$("#AnsPanel").show(500,function(){
 						setfooter();
 					});
 					$(this).text("收起答案");	
 		
 					
 				}
 				else
                {
 					$("#AnsPanel").hide(500,function(){
 						setfooter();
 					});
 					$(this).text("查看答案");	
                }

 				
 			});
 			
 			
		});
 		
 		
 </script>
</body>
</html>
