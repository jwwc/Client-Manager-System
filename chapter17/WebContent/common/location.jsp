<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<script type="text/javascript">
	function getCurrentLocation() {
		var outter = $(".header-section");
		<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
				<c:if test="${menu.parentCode == null || menu.parentCode eq '' }">
					if($("#${menu.code}").hasClass("nav-active")){
						outter.append("<span class='span-location'><spring:message code='current.location' />：</span><span class='location'><span class='span-inner'>${menu.name}</span></span>");
					}
				</c:if>
				
		</c:forEach>
		<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
	       <c:if test="${menu.parentCode != null && menu.parentCode != '' && (menu.href == null || menu.href eq '')}">
				if($("#${menu.code}").hasClass("active")){
					outter.append("<span class='span-inner'><i class='fa fa-angle-right'></i><span class='span-inner'>${menu.name}</span></span>");
				}
			</c:if>
		</c:forEach>
		<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
			<c:if test="${menu.parentCode != null && menu.parentCode != '' && menu.href != null && menu.href != '' }">
				if($("#${menu.code}").hasClass("active")){
					outter.append("<span class='span-inner'><i class='fa fa-angle-right'></i><span class='span-inner'>${menu.name}</span></span>");
				}
			</c:if>
		</c:forEach>
	};
</script>