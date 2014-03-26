<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
     <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      
       <script type="text/javascript">   
       window.onload = function (){    
    	   location.href="testproblem.html";  
          
       };  
    
  
	</script>  
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
		 <div id="page-wrapper">
			<div class="jumbotron">
		  		<p>上次学习到第几章第几题，是否继续？</p>
		  		<p>
		  			<button  type="button" class=" btn btn-primary btn-lg">是</button>
		  			<button  type="button" class=" btn btn-primary btn-lg">否</button>
		  		</p>
			</div>
		</div>
	</div>
</body>
</html>