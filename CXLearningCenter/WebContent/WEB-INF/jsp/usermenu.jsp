<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.cookie.js"></script>
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/DT_bootstrap.js"></script>
    <link href="${pageContext.request.contextPath}/Resourse/bootstrap/css/DT_bootstrap.css" rel="stylesheet">
<title>
	学习中心
</title>
 
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
		 <div id="page-wrapper">
			<ol class="breadcrumb">
 				 <li class="active" id="level">Data</li>
            </ol>
            
            <div class="panel-body">
                 <table class="table table-striped table-hover table-bordered datatable" id="category">
                 </table>
            </div>
		</div>
	</div>
	
	 <script>
	    $(document).ready(function(){
	    	$("#level").text($.cookie('level'));
	    	$.ajax({
	  			url : '/CXLearningCenter/user/categories.html',
	            dataType: 'json',
	            success : function(data) {
	            	var table=$('#category');
	            	for(var i=0;i<data.length;++i)
	            	{
	            		var tr=$("<tr></tr>");
	            		tr.appendTo(table);
	            		$("<td>"+data[i].categoryName+"</td>").appendTo(tr);
	            		$("<td><a style='cursor:pointer'>练习</a></td>").appendTo(tr);
	            		
	            	}
	            	$("#category a").each(function(index){
			    		$(this).bind("click",function(){
			    			$.cookie('category',data[index].categoryName);
			    			$.cookie('categoryID',data[index].id);
			    			$.cookie('problem',1);
			    			location.href="learningcenterpage.html";
			    		});
			    	});
	            	
	            }
	    	
		    	
	    	});
	    	
	        
	    });
	    
	    
    </script>
</body>
</html>