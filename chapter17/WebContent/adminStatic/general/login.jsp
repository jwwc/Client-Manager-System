<!DOCTYPE html>
<html>
<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<head>
<meta charset="utf-8">
<title>营帐管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="营帐管理系统" />
<meta name="description" content="营帐管理系统">
<meta name="author" content="nathan">

<link rel="stylesheet" href="${ctx}/adminStatic/css/login-style.css?v=${nowDate}">
<script src="${ctx}/adminStatic/js/jquery-1.10.2.min.js?v=${nowDate}"></script>
<script src="${ctx}/adminStatic/js/bootstrap.min.js?v=${nowDate}"></script>
<link rel="shortcut icon" href="${ctx}/adminStatic/ico/favicon.ico">
</head>
<!---->
<body class="login-container" style="padding: 0px 0px; margin: 0px 0px;">
	<div class="div-left">
		<div class="grad">
			<img alt="" src="${ctx}/adminStatic/images/login.png"
				class="picture-location">
		</div>
	</div>
	<div class="div-right" style="background-color:#ffffff">
		<div class="vertical-left">
			<div class="login-top">
				<img  src="${ctx}/adminStatic/images/photos/login_logo.png"  style="width: 50%; height: 50%;">
			</div>
			<div class="login-middle">
				<form action="${ctx}/login" autocomplete="off" method="post"
					name="formLogin" id="formLogin">
					<div class="alert alert-error" style="display: none">
						<span class="iconsm iconsm-warning"></span><span id="errorMsg"
							style="color: red"></span>
					</div>
					<div class="input-margin">
						<input class="input-user" type="text" maxlength="30"
							placeholder="登录名" class="name" tabindex="1" name="username"
							value="${username}" id="username">
					</div>
					<div class="input-margin">
						<input class="input-pwd" type="password" maxlength="20"
							placeholder="密码" class="pass" tabindex="2" name="password"
							value="${password}">
					</div>
					<!-- <div class="input-margin">
						<input class="input-pwd" type="text" maxlength="20"
							placeholder="验证码" class="pass" tabindex="2" name="verification">
					</div> -->
					<!-- <div class="input-margin">
							<input id="verify" class="input-btn" type="submit" tabindex="0"
							value="发送验证码">
							<button id="verify" class="input-btn">发送验证码</button>
					</div> -->
					<div>
						<input id="btn-login" class="input-btn" type="submit" tabindex="3"
							value="登 录">
					</div>
					<div style="padding-top:20px">
					<a id="forgetpwd">忘记账号或密码？</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
		$(document).ready(function() {
			if ("${loginError}" != null && "${loginError}" != "") {
				$(".alert-error").show();
				$("#errorMsg").html("${loginError}");
			}
		});
		$("#forgetpwd").click(function(){
			//showTipMsg("提示", "忘记密码,请联系管理员，电话：010-88888888");
			alert("忘记密码,请联系管理员，电话：010-88888888");
		});
		$("#verify").click(function() {
			var username = $("#username").val();
			console.log(username);
			$.ajax({
	    		type:"post",
	    		url:"${ctx}/verify",
	    		data:{"username":username},
	    		cache:false,
	    		async:false,//是否同步
	    		dataType:"json",
	    		success:function(data){
	    			if(data.success){
	    				alert(data.info);
	    			}
	    			else{
	    				alert(data.info);
	    			}
	    		},
	    		error:function(){
	    		}
	    	})
		});
</script>