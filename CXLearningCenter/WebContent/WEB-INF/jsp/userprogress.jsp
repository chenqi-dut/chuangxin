<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
		 <div id="page-wrapper">
			<div class="jumbotron">
		  		<p id="pro-warning"></p>
		  		<p>
		  			<button  type="button" id="bt_yes" class=" btn btn-primary btn-lg">是</button>
		  			<button  type="button" id="bt_no" class=" btn btn-primary btn-lg">否</button>
		  		</p>
			</div>
		</div>
	</div>
	<script>
		 $(document).ready(function(){  
			
	    	$.ajax({
	    		url:'/CXLearningCenter/user/progress.html',
	            dataType: 'json',
	            success : function(data) {
	            	if($.isEmptyObject(data))
	            	{
	            		
	            		 $.cookie('level','初级'); 
	            		 $.cookie('levelID',1); 
	            		 location.href="menupage.html"; 
	            		 
	            	}
	            	else
	            	{
	            		
	                	$.ajax({
	                   	 url : '/CXLearningCenter/user/problemids/'+data.hardness.id+'/'+data.category.id+'.html',
	                   	 dataType: 'json',
	                   	 success : function(arr) {
	                   		var num;
	                   	 	for(var i=0;i<arr.length;++i)
	                   	 	{
	                   	 		if(arr[i]==data.progressRecord.problem.id)
	                   	 		{
	                   	 			num=i+1;
	                   	 			break;
	                   	 		}
	                   	 	}
	                   	 $("#pro-warning").html('亲爱的<sec:authentication property="principal.username" />,你上次做到'+data.hardness.level+
	                   			 				 '难度'+data.category.categoryName+'的第'+num+'题"'+data.progressRecord.problem.title+
	                   			 				 '",是否继续？');
		                   	$("#bt_yes").click(function(){
		            			$.cookie('level',"hehe");
		            			$.cookie('levelID',data.progressRecord.problem.hardness); 
		            			$.cookie('category',"nimei");
		            			$.cookie('categoryID',data.progressRecord.problem.category); 
		            			$.cookie('problem',num);
		            	    	location.href="learningcenterpage.html";
		            	    });
	                   	 }
	                   });
	          
	            		
	            	}
	            }
	    	});
		      
		}); 
		$("#bt_no").click(function(){
			$.cookie('level',"初级");
			$.cookie('levelID',1); 
	    	location.href="menupage.html";
	    });
		
	</script>
</body>
</html>