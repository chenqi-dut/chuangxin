<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/Resourse/bootstrap/js/bootstrap.min.js"></script>


<title>
	学习中心
</title>
 
<body>
	<div id="wapper">
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
	  			url : '/CXLearningCenter/user/categories/'+$.cookie('levelID')+'.html',
	            dataType: 'json',
	            success : function(data) {
	            	var table=$('#category');
	            	for(var i=0;i<data.length;++i)
	            	{
	            		var tr=$("<tr></tr>");
	            		tr.appendTo(table);
	            		$("<td><a style='cursor:pointer'>"+data[i].categoryName+"</a> <span class='pull-right text-muted small'><em>共"+data[i].problemCounter+"题</em></span></td>").appendTo(tr);
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