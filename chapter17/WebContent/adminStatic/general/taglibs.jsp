<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="datePattern">yyyy-MM-dd</c:set>
<c:set var="timePattern">HH:mm:ss</c:set>
<c:set var="datetimePattern">yyyy-MM-dd HH:mm:ss</c:set>
<c:set var="datetimePattern2">yyyy-MM-dd HH:mm</c:set>
<c:set var="moneyPattern">#,#00.00#</c:set>
<c:set var="moneyPattern2">####.##</c:set>
<c:set var="moneyPattern4">￥#,##0.00</c:set>
<c:set var="moneyPattern5">#,##0.00</c:set>
<fmt:formatDate var="nowDate" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/>