<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login Page</title>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>   

    <!-- Core CSS - Include with every page -->
    <link href="Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- SB Admin CSS - Include with every page -->
    <link href="Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">

</head>
<body onload='document.f.j_username.focus();'>	
	<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
		
	    <div class="container">
	    
	    <div class="row">
	        <div class="col-md-12 ">
	     		<div class="jumbotron thumbnail"> <!--  -->
					<div>
						<h1 style="text-align:center"><font face="微软雅黑">创意思维在线学习系统</font></h1>						
					</div>				
				</div>	     
	     	</div>
	     </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">请登录</h3>
                    </div>
                    <div class="panel-body">
                        <form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="学号" name="j_username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="j_password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">记住密码
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input name="submit" type="submit" value="登录" class="btn btn-lg btn-success btn-block"></input>
                                <a href="testprimary.html"  class="btn btn-lg btn-success btn-block">取消</a> 
                                <a href="signup.html"  class="btn btn-lg btn-block btn-link">注册</a> 
                                                          
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Core Scripts - Include with every page -->
    <script src="Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="Resourse/bootstrap/js/bootstrap.min.js"></script>
    <!-- <script src="Resourse/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>    -->
	
</body>
</html>