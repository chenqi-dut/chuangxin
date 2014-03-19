<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script type="text/javascript">   
    window.onload = function (){    
        var bigImg = document.createElement("img");     //创建一个img元素  
        bigImg.src="http://www.baidu.com/img/baidu_sylogo1.gif";   //给img元素的src属性赋值  
        //bigImg.width="320";  //320个像素 不用加px  
        var myDiv = document.getElementById('CurPic'); //获得dom对象  
        myDiv.appendChild(bigImg);      //为dom添加子元素img  
    };  
	</script>  

 	<script type="text/javascript">   
function GetXmlHttpObject() {
  var xmlHttp=null;
  try {
    // Firefox, Opera 8.0+, Safari
    xmlHttp=new XMLHttpRequest();
   }
  catch (e) {
    // Internet Explorer
    try {
      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
    catch (e) {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    }
  return xmlHttp;
}

var xmlHttp=GetXmlHttpObject();
xmlHttp.onreadystatechange=function() {
  if (xmlHttp.readyState==4 && xmlHttp.status==200){
        var data = xmlHttp.responseText;       
        document.getElementById("myDiv").innerHTML=data; 
    }
  }
xmlHttp.open("GET","test.json?data=test",true); 
xmlHttp.send();


	</script> 

    <title>Test Primary</title>

    <!-- Core CSS - Include with every page -->
    <link href="Resourse/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="Resourse/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="Resourse/bootstrap/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="Resourse/bootstrap/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="Resourse/bootstrap/css/sb-admin.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">在线题库</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="login.html"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

        </nav>
        <!-- /.navbar-static-top -->

        <nav class="navbar-default navbar-static-side" >
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> 欢迎访问</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 学习中心<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                             <li>
                                <a href="primary.html">初级</a>
                            </li>
                            <li>
                                <a href="intermediate.html">中级</a>
                            </li>
                             <li>
                                <a href="senior.html">高级</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-table fa-fw"></i> 得分统计</a>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> 答题记录<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="panels-wells.html">Panels and Wells</a>
                            </li>
                            <li>
                                <a href="buttons.html">Buttons</a>
                            </li>                    
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-edit fa-fw"></i> 意见反馈</a>
                    </li>
                 </ul>
                <!-- /#side-menu -->
            </div>
            <!-- /.sidebar-collapse -->
        </nav>
        <!-- /.navbar-static-side -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">欢迎访问在线答题网站</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row 显示标题-->
            <div class="row">
                <div class="col-lg-12">                   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 题目<b id="CurQuesNum">几</b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div id="CurQuesCont" class="panel-body">
                                            <p>正文内容  Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Proin vel justo eu mi scelerisque vulputate. 
                                            Aliquam in metus eu lectus aliquet egestas.</p>
                                    </div>                                    
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-8 (nested) 读取的题目的文字部分 -->
                                <div class="col-lg-4">
                        
                                  <i class="fa" id="CurPic"></i>
                                   
                                </div>
                                <!-- /.col-lg-4 (nested) 如果读取的题目中，会有图形，放在此处 -->
                            </div>
                            <!-- /.row -->
                                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">                       
                        <div class="panel-body">
                         <div class="col-lg-12">
                           <p>
                           		<button id="LastQuestion" type="button" class=" btn btn-link" onclick=" ">上一题</button>
                           		<button id="CheckAnswer" type="button" class=" btn btn-default">查看答案</button>                                      
                                            <select class="form-control-select" id="GoNumber">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>                                                
                                            </select>                                            
                                           <!-- select option 应该实现动态绑定 -->                                  	
                                <button id="GoTo" type="button" class=" btn btn-default" onclick=" ">Go</button>
                                <button id="NextQuestion" type="button" class="btn btn-link" onclick=" ">下一题</button>
                            </p>
                            </div>
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
    <script src="Resourse/bootstrap/js/jquery-1.10.2.js"></script>
    <script src="Resourse/bootstrap/js/bootstrap.min.js"></script>
    <script src="Resourse/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="Resourse/bootstrap/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="Resourse/bootstrap/js/plugins/morris/morris.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="Resourse/bootstrap/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
    <script src="Resourse/bootstrap/js/demo/dashboard-demo.js"></script>

</body>
</html>
