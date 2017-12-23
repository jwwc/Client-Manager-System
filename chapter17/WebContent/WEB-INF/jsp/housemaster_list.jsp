<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
    <title>户主信息管理</title>
     <script src="${pageContext.request.contextPath}/adminStatic/js/jquery-1.11.3.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/My97DatePicker/WdatePicker.js"></script>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminStatic/css/paging.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/js/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/js/query.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/js/paging.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminStatic/css/select2.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/js/select2.min.js?v=${nowDate}"></script>	   
   <script type="text/javascript">
   
   </script>
 <style>
 body{
   margin-left:10%;
   background-color:rgb(239, 240, 244); 	
   margin-top:50px;
    width: 80%;
 }
  tr{
  height:50px;
  }
 .text-center{
  text-align:center;
  width:220px;
  }
  .text-left{
   text-align:left;
  }
.table-td{
    word-break:break-all;
    word-wrap: break-word;
    text-align:center;
    width:180px;
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
   position:absolute;
	right:180px;
	top:93px;
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
.query{
   display:inline-block;
   -webkit-box-sizing:content-box;
   -moz-box-sizing:content-box;
   box-sizing:content-box;padding:0 12px;
   width:40px;
   margin-left:30px;
   line-height:30px;
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
   border-color:#d0d0d0;
   text-shadow:0 1px rgba(255,255,255,0.8);
   background:-webkit-gradient(linear,0% 0%,0% 100%,from(#fefefe),to(#e7e7e7));
   background:-webkit-linear-gradient(#fefefe,#e7e7e7);
   background:-moz-linear-gradient(#fefefe,#e7e7e7);
   background:-ms-linear-gradient(#fefefe,#e7e7e7);
   background:linear-gradient(#fefefe,#e7e7e7);
}
h2{
margin-left: 410px;
margin-bottom:20px;
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
   <h2>户主信息查询</h2>    
    <input type="button" class="mybtn" onclick="location.href='${pageContext.request.contextPath}/houseMasterManage/houseMasterController/manage'" style="text-decoration:none; color:red" value="新增户主"/>  
	<form:form id="pageForm" modelAttribute="houseMasterSearcher"  action="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/queryByBirthday">
			<div>
			    <label style="font-size:18px;">生日:</label>
				<input type="text"  class="Wdate"  id="beginDate"  style="height:28px;width:150px;font-size:16px"  
			    name="beginDate"   value="${houseMasterSearcher.beginDate}"  onClick="WdatePicker()" />
                <label style="font-size:18px;margin-left:20px;">户主名称:</label>
    		  	<form:select path="id"  id="id"  class="form-control"  style = "width:140px;height:30px;color: #555555;" >
      	   	   	   <form:option value="">（全部）</form:option>
          			<c:forEach items="${houseMasterList}" var="houseMaster">
          				<form:option value="${houseMaster.id }">${houseMaster.name }</form:option>
          			</c:forEach>
        		</form:select>       			    
			    <input type="button"  class="query" id="query" value="查询" style="text-decoration:none; color:red"/>  
                <input type="button" class="query" id="clear" value="清空" style="text-decoration:none; color:red;margin-left:20px;"/>  			    
		   </div>
	</form:form>
	                       <div class="total">
	                            <table class="table">
	                                <thead class="tableheader">
	                                <tr bgcolor="#4F81BD" style="color:#fff">
	                                		<th class="text-center">户主名称</th>
	                                		<th class="text-center" width="80px;">性别</th>
	                                        <th class="text-center">家庭住址</th>
	                                        <th class="text-center">联系电话</th>
	                                    	<th class="text-center">操作</th>
	                                </tr>
	                                </thead>
	                                <tbody>
									<c:if test="${!empty resultList}">
						            	<c:forEach var="houseMaster" items="${resultList}" varStatus="i">
						            	<dl id="${i.index}">
					 						<tr bgcolor="${status.index%2 == 0?'#D0D8E8':'#E9EDF4'}" >
		                                    	<td class="table-td"  >${houseMaster.name }</td>
		                                    	<td class="table-td"  >${houseMaster.sex }</td>
		                                        <td class="table-td">${houseMaster.address }</td> 
		                                        <td class="table-td">${houseMaster.telephone }</td> 
		                                        <td class="table-td" width="260px">
		                                        	<a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/listMembers?houseMasterId=${houseMaster.id }&beginDate=${houseMasterSearcher.beginDate}">家庭成员信息</a>
													<a href="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/manage?houseMasterId=${houseMaster.id }">修改</a>	                                        	
		                                        	<a href="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/delete?houseMasterId=${houseMaster.id }" onclick="return confirm('您将删除该户主及其所有家庭成员信息,确定删除？')">删除</a>
	                                        	</td> 
						                  </tr>
						               </dl>   									            
						              </c:forEach>
									</c:if>	                                
	                                </tbody>
	                            </table>
	                          </div>
 						 <div class="totalCounts">共<label class="counts">${page.totalRecord }</label>条数据</div>
	                      <div class="pageBar">
						      页次：${page.currentPage}/<label id="totalPages" >${page.totalPage}</label>&nbsp
						       <button class="pageButton">
						       <a href="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/list?p=1"  style="text-decoration:none;">首页</a>
						       </button>
						    <c:choose>  
						           <c:when test="${page.currentPage>1}">
						            <button class="pageButton">
						           		<a href="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/list?p=${page.currentPage-1}" style="text-decoration:none;">上一页</a>
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
						               <a href="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/list?p=${page.currentPage+1}" style="text-decoration:none;">下一页</a>
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
					       <a href="${pageContext.request.contextPath}/houseMasterManage/houseMasterController/list"  style="text-decoration:none;" id="enter">确定</a>
					       </button>						    	                      
	                      </div>    	                          
</body>
<script>
    $(document).ready(function(){
    	
    	$("#id").select2();
    	
    	$("#query").click(function(){
    		$("#pageForm").submit();
    	});
    	
   	$("#clear").click(function() {
   		$("#beginDate").val("");
        $(".select2-selection__rendered").html('（全部）');
        $("select").val("");
   	});
   	
	$("#enter").click(function () {
		var pageNum=$("#pageInput").val();
		var totalPages = $("#totalPages").html().trim();
		if(/^[1-9]\d*$/.test(pageNum)&&parseInt(pageNum)<=parseInt(totalPages)){
			$("#enter").attr("href","${pageContext.request.contextPath}/houseMasterManage/houseMasterController/list?p="+pageNum);
		}else{
			    $("#pageInput").val("");
	            alert("输入页码错误!")
		}
	});
    	
    })
    
    
    
    
</script>