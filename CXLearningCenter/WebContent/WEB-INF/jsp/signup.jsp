<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Signup Page</title>

    <!-- Core CSS - Include with every page -->
    <link href="Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- SB Admin CSS - Include with every page -->
    <link href="Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">

</head>
	<body>
	
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
                        <h3 class="panel-title">请注册</h3>
                    </div>
                    <div class="panel-body">
                        <form name='f' action = "signup/adduser.html" method='POST'>
                            <fieldset>
                                <div class="form-group">
                                    <label> 学号 </label>
                                    <input class="form-control" placeholder="username" name="username" id="username" type="text" autofocus>
                                    <span id = 'spuser' class="alert-danger" style ="display: none;">${message}</span >
                                </div>
                                <div class="form-group">
                                    <label> 密码 </label>
                                    <input class="form-control" placeholder="******" name="password" id="password1" type="password" value="">
                                    <span id = 'sppass1' class="alert-danger" style ="display: none;"></span >
                                </div> 
                                 <div class="form-group">
                                    <label> 确认密码 </label>
                                    <input class="form-control" placeholder="******" id="password2" type="password" value="">
                                    <span id = 'sppass2' class="alert-danger" style ="display: none;"></span >
                                </div>                                                              
                                <!-- Change this to a button or input when using this as a form -->                                                                
                                <button type="button" class="btn btn-lg btn-success btn-block" onclick="return check()">注册</button> 
                                <a href="index.html"  class="btn btn-lg btn-success btn-block">取消</a>   
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>	
	<script src="Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="Resourse/bootstrap/js/bootstrap.min.js"></script>   
	<script>
	    $(document).ready(function(){
	    	$('#spuser').css("display","");
	    });
        function check(){
	        var user=$("#username");
	        var pass1=$("#password1");
	        var pass2=$("#password2");
	        var userpattern = /^[0-9]{1,}$/; 
	          if(!user.val().match(userpattern)){
	             
	        	  $('#spuser').css("display","");
	         	  $('#spuser').html("请输入学号作为用户名");
	         	  user.val('');
	              user.focus();
	              return false ;
	          } 
	        
	          if (pass1.val() == "") {
	              $('#spuser').html();
	              $('#sppass1').css("display","");
	         	  $('#sppass1').html("请填写密码！");
	         	  pass1.val('');
	              pass1.focus();
	              return false ;
	          }
	          if (pass2.val()== '') {
	        	  $('#sppass1').html("");      
	              $('#sppass2').css("display","");
	         	  $('#sppass2').html("请填写确认密码！");
	              pass2.focus();
	              return false ;
	          }
	          if (pass1.val().length > 20 || pass1.val().length < 6) {
	        	  $('#spuser').html("");     
	              $('#sppass1').css("display","");
	         	  $('#sppass1').html("密码请填写6-20个字符!");
	              pass1.focus();
	              return false ;
	
	          }
	          if (pass1.val() != pass2.val()) {
	        	  $('#sppass1').html("");          
	              $('#sppass2').css("display","");
	         	  $('#sppass2').html("输入的两次密码不相同！");
	         	  pass2.val('');
	              pass2.focus(); 
	              return false ;
	          }        
	          document.forms[0].submit() ;
          }
        </script>
	  
	</body>
	
</html>

