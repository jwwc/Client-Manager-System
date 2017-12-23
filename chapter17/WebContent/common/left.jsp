<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="left-side sticky-left-side">
	<%--logo and iconic logo start--%>
	<div class="logo-icon text-center">
		<a href="<c:url value="/"/>"> <%--         <img src="${ctx}/adminStatic/images/photos/logo_icon.png" alt=""> --%>
		</a>
	</div>
	<!--logo and iconic logo end-->
	<!--sidebar nav start-->
	<ul class="nav nav-pills nav-stacked custom-nav" id="cs">
		<c:choose>
			<c:when
				test="${fn:contains(pageContext.request.requestURI, '/index')}">
				<li id="index"><a href="${ctx}/index?index=index"><i
						class="fa fa-home"></i><span class="gray-color"><spring:message
								code="home.page" /></span></a></li>
			</c:when>
			<c:otherwise>
				<li id="index"><a href="${ctx}/index?index=index"><i class="fa fa-home"></i><span
						class="gray-color"><spring:message code="home.page" /></span></a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
			<c:if test="${empty menu.parentCode}">
				<%-- 1 级菜单 --%>
				<shiro:hasPermission name="${menu.code}">
					<li id="${menu.code}" class="menu-list"><a href="#"><i
							class="${menu.icon }"></i> ${menu.name}</a>
						<c:forEach items="${menuList}" var="menuChild"
							varStatus="idxStatus1">
							<%-- 2 级菜单 --%>
							<c:if test="${menuChild.parentCode == menu.code}">
								<shiro:hasPermission name="${menuChild.code}">
									<ul class="sub-menu-list">
										<c:choose>
											<c:when
												test="${menuChild.href == null || menuChild.href eq '' }">
												<li id="${menuChild.code}" class="menu-list"><a
													href="#"><i class="${menuChild.icon}"></i>${menuChild.name}</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when
														test="${fn:contains(activeSubMenu, menuChild.href)}">
														<li id="${menuChild.code}" class="active"><a
															href="${ctx}${menuChild.href}">
															<span class="red-color"><i class="fa fa-circle"></i>
															${menuChild.name}</span></a></li>
														<c:set var="menuActive" value="${menu.code}"></c:set>
														<c:set var="menuChildActive" value="${menuChild.code}"></c:set>
													</c:when>
													<c:otherwise>
														<li id="${menuChild.code}"><a
															href="${ctx}${menuChild.href}">
															<span class="gray-color">
																<i class="fa fa-circle"></i>
																${menuChild.name}</span></a></li>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>

										<c:forEach items="${menuList}" var="menuGrandson">
											<c:if test="${menuGrandson.parentCode == menuChild.code}">
												<shiro:hasPermission name="${menuGrandson.code}">
													<%-- 菜单3级 --%>
													<ul class="sub-menu-list" style="margin-left:10px;" >
														<c:choose>
															<c:when
																test="${fn:contains(activeSubMenu,menuGrandson.href)}">
																<li id="${menuGrandson.code}" class="active"><a
																	href="${ctx}${menuGrandson.href}">
																	<span class="red-color">
																	<i class="fa fa-circle"></i>
																			${menuGrandson.name}</span></a></li>
																<c:set var="menuActive" value="${menu.code}"></c:set>
																<c:set var="menuChildActive" value="${menuChild.code}"></c:set>
																<c:set var="menuGrandsonActive" value="${menuGrandson.code}"></c:set>
															</c:when>
															<c:otherwise>
																<li id="${menuGrandson.code}"><a
																	id="${menuGrandson.code}"
																	href="${ctx}${menuGrandson.href}">
																	<span class="gray-color">
																		<i class="fa fa-circle"></i>
																		${menuGrandson.name}</span></a></li>
															</c:otherwise>
														</c:choose>
													</ul>
												</shiro:hasPermission>
											</c:if>
										</c:forEach>
									</ul>
								</shiro:hasPermission>
							</c:if>
						</c:forEach>
					</li>
				</shiro:hasPermission>
			</c:if>
		</c:forEach>
	</ul>
	<!--sidebar nav end-->
</div>
<script type="text/javascript">
	$(function() {
		if ("${menuActive}" != null && "${menuActive}" != "") {
			$("#${menuActive}").addClass('nav-active');
		}
		if ("${menuChildActive}" != null && "${menuChildActive}" != "") {
			$("#${menuChildActive}").addClass('nav-active');
			$("#${menuChildActive}").addClass('active');
		}
		if ("${menuGrandsonActive}" != null && "${menuGrandsonActive}" != "") {
			$("#${menuGrandsonActive}").addClass('nav-active');
			$("#${menuGrandsonActive}").parent().show();
			$("#${menuGrandsonActive}").parent().siblings().show();
		}	
		getCurrentLocation();
	});
</script>