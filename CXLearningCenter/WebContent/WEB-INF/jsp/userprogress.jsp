<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>
   <script>
    window.onload = function (){    
    	$.ajax({
    		url:'/CXLearningCenter/user/progress.html',
            dataType: 'json',
            success : function(data) {
            	if($.isEmptyObject(data))
            	{
            		 $.cookie('level','junior'); 
            		 location.href="menupage.html"; 
            		
            		 
            	}
            	else
            	{
            		
            	}
            }
    	});
       
    };  
 
    </script>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/home.jsp"/> 
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
		$("#bt_no").click(function(){
			 
			$.cookie('level','初级'); 
	    	location.href="menupage.html";
	    });
	</script>
</body>
</html>