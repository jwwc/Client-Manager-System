<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>家庭成员信息</title>
 <style>
 body{
   margin-left:8%;
   background-color:rgb(239, 240, 244);
   margin-top:50px;
    width: 80%;
 }
  tr{
  height:50px;
  }
  .mybtn{
   display:inline-block;
   -webkit-box-sizing:content-box;
   -moz-box-sizing:content-box;
   box-sizing:content-box;padding:0 12px;
   height:40px;
   width:65px;
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
   position:relative;
	left:890;
	top:0px;
   *margin-top:-8px;
   border-color:#d0d0d0;
   text-shadow:0 1px rgba(255,255,255,0.8);
   background:-webkit-gradient(linear,0% 0%,0% 100%,from(#fefefe),to(#e7e7e7));
   background:-webkit-linear-gradient(#fefefe,#e7e7e7);
   background:-moz-linear-gradient(#fefefe,#e7e7e7);
   background:-ms-linear-gradient(#fefefe,#e7e7e7);
   background:linear-gradient(#fefefe,#e7e7e7);
   filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefefe', endColorstr='#fcfcfc',GradientType=0 );
}
 .text-center{
  text-align:center;
  }
.table-td{
    word-break:break-all;
    word-wrap: break-word;
    text-align:center;
    width:140px;
}
h2{
margin-left: 450px;
}
.pageBar{
	position: relative;
	left:460px;
	top:-26px;
	color:rgb(153, 153, 153);
	font-size:17px;
}
.pageButton{
	width:70px;
	height:35px;
	font-size:16px;
    background: transparent;
    background-image: initial;
    background-position-x: initial;
    background-position-y: initial;
    background-size: initial;
    background-repeat-x: initial;
    background-repeat-y: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
}
.totalCounts{
	margin-top:20px;
	font-size:17px;
	color:rgb(153, 153, 153)
}
.counts{
	color:red;
	padding-left:10px;
	padding-right:10px;
}
</style>
</head>

<body class="body">
   <h2>家庭成员信息</h2>   
	<form:form  id="pageForm">
	                       <div class="total">
	                            <table class="table" width="100%" height="10%">
	                                <thead class="tableheader">
	                                <tr bgcolor="#4F81BD" style="color:#fff">
	                                        <th class="text-center">姓名</th>
	                                        <th class="text-center">性别</th>
	                               		    <th class="text-center">家庭住址</th>
	                                	    <th class="text-center">所属户主</th>
	                                		<th class="text-center">与户主关系</th>
	                                        <th class="text-center">生日</th>
	                                    	<th class="text-center">电话</th>
	                                    	<th class="text-center">是否生日</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach items="${resultList}" var="houseMember">
	                                    <tr bgcolor="${status.index%2 == 0?'#D0D8E8':'#E9EDF4'}">
	                                    	<td class="table-td"  >${houseMember.name }</td>
	                                    	<td class="table-td">${houseMember.sex }</td> 
	                                        <td class="table-td"  >${houseMember.houseAddress }</td>
	                                        <td class="table-td"  >${houseMember.masterName }</td>
	                                        <td class="table-td">${houseMember.relationship }</td>
	                                        <td width="100px" >${houseMember.birthday }</td> 
	                                        <td class="table-td">${houseMember.telephone }</td> 
	                                        <td class="table-td" width="40px">
	                                        	<c:choose>
	                                        		<c:when test="${houseMember.birthdayFlag==1 }">
	                                        			<input type="radio" id="radio1" checked="checked" disabled="disabled" style="color:red;width:20px;height:15px;">
	                                      				<%-- <img src="${pageContext.request.contextPath}/images/birthday.jpg" style="width:80px;height:50px;"></img> --%>    	
	                                      				<label style="color:red;font-size:18px">生日</label>		
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<input type="radio" id="radio2"  disabled="disabled" style="color:red;width:20px;height:15px;">
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </td> 
	                                    </tr>
	                                </c:forEach>
	                                </tbody>
	                            </table>
	                          </div>
 						  <div class="totalCounts">共<label class="counts">${page.totalRecord }</label>条数据</div>
	                      <div class="pageBar">
						       页次：${page.currentPage}/${page.totalPage}&nbsp
						       <button class="pageButton">
						       <a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/listMembers?p=1"  style="text-decoration:none;">首页</a>
						       </button>
						    <c:choose>  
						           <c:when test="${page.currentPage>1}">
						            <button class="pageButton">
						           		<a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/listMembers?p=${page.currentPage-1}" style="text-decoration:none;">上一页</a>
						           	</button>
						           </c:when>  
						           <c:otherwise>
						            <button class="pageButton">
						                   <a href="#" style="text-decoration:none;">上一页</a>
						            </button>
						           </c:otherwise>  
						    </c:choose>
						    <c:choose>  
						           <c:when test="${page.currentPage<page.totalPage}">
						           <button class="pageButton">
						               <a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/listMembers?p=${page.currentPage+1}" style="text-decoration:none;">下一页</a>
						          </button> 
						           </c:when>  
						           <c:otherwise>
						            <button class="pageButton">
						               <a href="#" style="text-decoration:none;">下一页</a>
						            </button>     
						           </c:otherwise>  
						    </c:choose>
					        跳转至<input type="text" style="width:50px;height:30px;text-align:center;" id="pageInput"></input>页 
					       <button class="pageButton">
					       <a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/listMembers"  style="text-decoration:none;">确定</a>
					       </button>						    	                      
	                      </div>
						<input type="button" class="mybtn" onclick="location.href='${pageContext.request.contextPath}/houseMasterManage/houseMasterController/list'" style="color:red" value="返回"/>	                          	                          	                          
	</form:form>
</body>
<script src="${pageContext.request.contextPath}/adminStatic/js/jquery-1.11.3.min.js"></script>
	
<script type="text/javascript">
</script>