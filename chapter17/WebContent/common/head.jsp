<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>

<!--header start-->
<div class="header" style="border-bottom: 3px solid #f45046;">
	<div class="pull-left">
		<div class="cms_logo">
			<a href="<c:url value="/"/>"><img
				src="${ctx}/adminStatic/images/photos/login_logo.png" alt=""
				style="width: 200px"></a>
		</div>
	</div>
	
	<!--     <div class=""> -->
	<%--         <div class="cms-admin"><font color="#fff">欢迎  ${currentUser.username}</font></div> --%>
	<!--         <div class="cms-user-oper"> -->
	<%--          <a href="${ctx}/logout" class="log-out">安全退出</a> --%>
	<%--             | <a href="${ctx}/privilegeManage/servant/pwd/manage" class="log-out">修改密码</a> --%>
	<%--         	<div class="last-on-time">上次登录：2014-03-08</div> --%>
	<!--         </div> -->
	<!--     </div> -->
	
	<div style="float: right;line-height:85px">
		<%-- <div class="div-head">
			<a
				href="${ctx}/privilegeManage/servant/user/setLanguage?language=Chinese"
				class="log-out">中文</a> | <a
				href="${ctx}/privilegeManage/servant/user/setLanguage?language=English"
				class="log-out">English</a>
		</div> --%>
		<div class="div-head">
			<!-- 用户名 -->
			&nbsp;${currentUser.username}(${currentUser.realName})</a>
		</div>
		<div class="div-head">
			<!-- 修改密码 -->
			<img src="${ctx}/adminStatic/images/photos/modify-pwd.png" alt="" /><a
				href="${ctx}/privilegeManage/servant/pwd/manage" class="log-out">
				<spring:message code="home.page.alter.password" />
			</a>
		</div>
		<div class="div-head">
			<!--安全退出 -->
			<img src="${ctx}/adminStatic/images/photos/log-out.png" alt="" style="margin-right: 3px;"/><a
				href="${ctx}/logout" class="log-out"><spring:message
					code="home.page.logout" /></a>
		</div>
	</div>
</div>

<script type="text/javascript">
function setLanguage(language){
	urlStr = window.location.href;
	alert(urlStr);
}
</script>
<!--header end-->