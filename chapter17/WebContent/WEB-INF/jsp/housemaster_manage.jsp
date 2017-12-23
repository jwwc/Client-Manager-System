<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>户主信息管理</title>
<!-- 引入css和js -->
<script src="${pageContext.request.contextPath}/adminStatic/js/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/adminStatic/css/select2.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/js/select2.min.js?v=${nowDate}"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/My97DatePicker/WdatePicker.js"></script>
</head>

<style>
 body{
     background-color:rgb(239, 240, 244);
 }
    header{
    text-aligen:center;
    }
    input{width:40%}
	div{
	padding-bottom:25px;
	}
	body{
	   	    margin:8%   35%;
	}
label{  
    display:inline-block;  
    width:100px;
    font-size:18px;
    }  
h2{
margin-left: 120px;
margin-top: -30px;
padding-bottom:20px;
}
input{
width:135px;
height:25px;
font-size:16px;
}
.hidden{
display:none;
}
.radio{
width:20px;
height:15px;
}
  .mybtn{
   display:inline-block;
   -webkit-box-sizing:content-box;
   -moz-box-sizing:content-box;
   box-sizing:content-box;padding:0 12px;
   height:40px;
   width:60px;
   line-height:26px;
   border:1px solid #2d88bf;
   border-radius:5px;
   font-size:16px;
   font-weight:bold;
   letter-spacing:1px;
   text-align:center;
   vertical-align:middle;
   cursor:pointer;
   word-wrap:normal;
   white-space:nowrap;
   margin-left:65px;
   margin-top:10px;
   border-color:#d0d0d0;
   text-shadow:0 1px rgba(255,255,255,0.8);
   background:-webkit-gradient(linear,0% 0%,0% 100%,from(#fefefe),to(#e7e7e7));
   background:-webkit-linear-gradient(#fefefe,#e7e7e7);
   background:-moz-linear-gradient(#fefefe,#e7e7e7);
   background:-ms-linear-gradient(#fefefe,#e7e7e7);
   background:linear-gradient(#fefefe,#e7e7e7);
   filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefefe', endColorstr='#fcfcfc',GradientType=0 );
}
.form-control{
   display: inline-block;
    height: 24px;
    padding: 6px 12px;
    font-size: 16px;
    width:200px;
    line-height:20px;
    color: #555555;
    background-image: none;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
};
}

</style>


<form:form id="pageForm" action="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/save" modelAttribute="houseMaster"  method="post" autocomplete="off">
                <header>
                    <c:choose>
                        <c:when test="${empty houseMaster.id}">
                            <h2>新增户主信息</h2>
                        </c:when>
                        <c:otherwise>
                           <h2>修改户主信息</h2>
                        </c:otherwise>
                    </c:choose>
                </header>
                <body>
                         <div class="hidden">
                		 	<label for="id" ><span style="color:red;margin-right:7px;">*</span>户主id:</label>
                            <form:input path="id" maxlength="50" cssClass="form-control" id="id"  placeholder="户主id"
                                                validata-options="validType:'Require',msg:'不能为空'" />
                		</div>
                		<div>
                		 	<label for="name" ><span style="color:red;margin-right:7px;">*</span>户主名称:</label>
                            <form:input path="name" maxlength="50" cssClass="form-control" id="name"  placeholder="户主名称"
                                                validata-options="validType:'Require',msg:'不能为空'" />
                		</div>
                		<div>
                		      <label for="type" ><span style="color:red;margin-right:7px;">*</span>性别:</label>
                	           <form:radiobutton path="sex" value="男" class="radio" checked="checked"/>男
                               <form:radiobutton path="sex" value="女" class="radio" />女
                		</div>
                		<div>
                              <label for="birthday" ><span style="color:red;margin-right:7px;">*</span>生日:</label>
                               <input name="birthday" id="birthday" value="${houseMaster.birthday }"  class="Wdate" style="height:35px;width:226px;" type="text"  onClick="WdatePicker()" placeholder="生日"/>                                	 		
                		</div>
                		<div  class="div">
                               <label for="address" ><span style="color:red;margin-right:7px;">*</span>家庭住址:</label>
                               <form:input path="address" maxlength="50" cssClass="form-control" id="address"  placeholder="家庭住址"  
                                                 validata-options="validType:'Require',msg:'不能为空'" />               		
                		</div>
                		<div>
                              <label for="telephone"><span style="color:red;margin-right:7px;">*</span>联系电话:</label>
                              <form:input path="telephone" maxlength="50" cssClass="form-control" id="address"  placeholder="联系电话"  
                                	            validata-options="validType:'Require',msg:'不能为空'" />              		
                		</div>
                		<div>
                                <label for="memo"><span style="color:red;margin-right:7px;">*</span>备注:</label>
                                 <form:input path="memo" maxlength="50" cssClass="form-control" id="memo"  placeholder="备注"  
                                	                  validata-options="validType:'Require',msg:'不能为空'" />            		
                		</div>
                		<div>
                                <input type="button" class="mybtn" id="save"  value="保存" style="text-decoration:none; color:red"/>
                                <input type="button" class="mybtn" onclick="location.href='http://localhost:8080/chapter17/houseMasterManage/houseMasterController/list'" style="text-decoration:none; color:red" value="返回列表"/>                		
                		</div>                
                </body>
</form:form>
<script type="text/javascript">
window.alert = function(str)  
{  
 var shield = document.createElement("DIV");  
 shield.id = "shield";  
 shield.style.position = "absolute";  
 shield.style.left = "0px";  
 shield.style.top = "0px";  
 shield.style.width = "100%";  
 shield.style.height = document.body.scrollHeight+"px";  
 //弹出对话框时的背景颜色  
 shield.style.background = "#fff";  
 shield.style.textAlign = "center";  
 shield.style.zIndex = "25";  
 //背景透明 IE有效  
 //shield.style.filter = "alpha(opacity=0)";  
 var alertFram = document.createElement("DIV");  
 alertFram.id="alertFram";  
 alertFram.style.position = "absolute";  
 alertFram.style.left = "50%";  
 alertFram.style.top = "50%";  
 alertFram.style.marginLeft = "-225px";  
 alertFram.style.marginTop = "-75px";  
 alertFram.style.width = "450px";  
 alertFram.style.height = "150px";  
 alertFram.style.background = "#ff0000";  
 alertFram.style.textAlign = "center";  
 alertFram.style.lineHeight = "150px";  
 alertFram.style.zIndex = "300";  
 strHtml = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";  
 strHtml += " <li style=\"background:#DD828D;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #F9CADE;\">[自定义提示]</li>\n";  
 strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\">"+str+"</li>\n";  
 strHtml += " <li style=\"background:#FDEEF4;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #F9CADE;\"><input type=\"button\" value=\"确 定\" onclick=\"doOk()\" /></li>\n";  
 strHtml += "</ul>\n";  
 alertFram.innerHTML = strHtml;  
 document.body.appendChild(alertFram);  
 document.body.appendChild(shield);  
 var ad = setInterval("doAlpha()",5000);  
 this.doOk = function(){  
     alertFram.style.display = "none";  
     shield.style.display = "none";  
 }  
 alertFram.focus();  
 document.body.onselectstart = function(){return false;};  
};

$(document).ready(function(){
	$("#belongHouseId").select2();
});

    $("#save").click(function() {
    	alert("成功保存户主信息!");
        $("#pageForm").submit();
    }) ; 
   $("#pageForm").checkForm();  
   
   
</script>

</html>

