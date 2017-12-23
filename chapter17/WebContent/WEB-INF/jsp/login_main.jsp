<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head id="Head1" runat="server">
    <title></title>
    <script src="${pageContext.request.contextPath}/adminStatic/js/jquery-1.11.3.min.js"></script>
    <style>
    .bar{
        padding:30px 20px 10px 20px;
    	font-size:16px;
    	color:#ffffff;
    	background-color:rgb(69, 72, 74);
    	cursor:pointer;
    }
    .barBottom{
    	background-color:rgb(69, 72, 74);
         height:100%;
         display: block;
    }
    
    html,body,iframe{
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden;
}
.top{
	position: relative;
	top:2px;
	left:10px;
};
.quit{
	padding:20px;
	background-color: rgb(238, 238, 238);
    cursor:pointer;
	border-style:dashed 2px;
}

 </style>
</head>

<body  background="${pageContext.request.contextPath}/adminStatic/images/login_main.jpg" id="body">
  <div style="width:10%;height:100%;float: left" id="bars" /> 
  <div id="system" class="bar" onmouseover="this.style.backgroundColor='red';" onmouseout="this.style.backgroundColor='';" >系统运行管理</div>   
  <div id="master" class="bar" onmouseover="this.style.backgroundColor='red';" onmouseout="this.style.backgroundColor='';" >户主信息管理</div> 
  <div id="member" class="bar" onmouseover="this.style.backgroundColor='red';" onmouseout="this.style.backgroundColor='';">成员信息管理</div> 
  <div id="member" class="barBottom"> </div>  
</div>
 <div class="top">
 <label id="top-left" style="color:rgb(69, 72, 74);">欢迎使用<label style="font-weight:bold">Cake-Customer</label>客户管理系统</label>
 <label  style="font-size:16px;margin-left:580px;color:rgb(174, 174, 174)">欢迎，</label> <label style="font-size:15px;margin-right:20px;color:red">test(管理员) </label> 
  <label ><a  href='${pageContext.request.contextPath}' style="font-size:15px;text-decoration:none;color:rgb(174, 174, 174)">安全退出</a></label>
 </div>  
<div id="page" style="width:90%;float:right;height:100%"> 
<iframe src=''  id="iframe" frameborder='0' style='border: 0; width:100%;background-color:transparent;'> 
</iframe>    
</div> 
<script type="text/javascript"> 
$(function () { 
	
$("#master").click(function () { 
	$("iframe").attr("src", "${pageContext.request.contextPath }/houseMasterManage/houseMasterController/list");
	$("#body").attr("background","");
	$("#body").attr("background-color","rgb(239, 240, 244)");

}); 

$("#member").click(function () { 
	$("iframe").attr("src", "${pageContext.request.contextPath }/houseMemberManage/houseMemberController/list");
	$("#body").attr("background","");
	$("#body").attr("background-color","rgb(239, 240, 244)");
	}); 
	
$("#system").click(function () { 
	$("iframe").attr("src", "");
	$("#body").attr("background", "${pageContext.request.contextPath}/adminStatic/images/login_main.jpg");
	}); 

}); 
</script>
</body>
</html>
