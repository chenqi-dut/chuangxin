<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>

<title>
	学习中心
</title>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/userhome.jsp"/> 
		 <div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
				<div class="panel panel-default">
				        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 用户信息
                        </div>                       
                    <div class="panel-body">
                        <form >
                        	<fieldset>
	                        	
								<div class="form-group">
								
								<label for="exampleInputEmail1">用户名</label>
								
								<input type="text" class="form-control" id="exampleInputEmail1" placeholder="输入用户名" style="width:300;">
								
								</div>
								
								<div class="form-group">
								
								<label for="exampleInputPassword1">院系</label>
								
								<input type="text" class="form-control" id="exampleInputPassword1" placeholder="输入院系" style="width:300;">
								
								</div>
								
								<div class="form-group">
								
								<label for="exampleInputFile">姓名</label>
								
								<input type="text"  class="form-control" id="exampleInputFile"  placeholder="输入姓名" style="width:300;">
								
								</div>
								
								<div class="form-group">
								
								<label for="exampleInputFile">姓名</label>
								
								<input type="email"  class="form-control" id="exampleInputFile"  placeholder="输入邮箱" style="width:300;">
								
								</div>
								
								<button type="submit" class="btn btn-default">提交</button>
					       </fieldset>
						</form>
				    </div>
				</div>
             </div>
             </div>
		</div>
	</div>
</body>
</html>