<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign Up</h3>
                    </div>
                    <div class="panel-body">
                        <form name='f' action = "signup/adduser.html" method='POST'>
                            <fieldset>
                                <div class="form-group">
                                    <label> username </label>
                                    <input class="form-control" placeholder="username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <label> password </label>
                                    <input class="form-control" placeholder="******" name="password" type="password" value="">
                                </div>
                                 <div class="form-group">
                                    <label> confirm password </label>
                                    <input class="form-control" placeholder="******" name="password" type="password" value="">
                                </div>                               
                                <!-- Change this to a button or input when using this as a form -->
                                <input name="submit" type="submit" value="Sign Up" class="btn btn-lg btn-success btn-block"></input>
                               <a href="index.html"  class="btn btn-lg btn-success btn-block">Cancel</a> 
                                
                                                          
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	
	<script src="Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="Resourse/bootstrap/js/bootstrap.min.js"></script>
    <script src="Resourse/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	
	</body>
	
</html>

