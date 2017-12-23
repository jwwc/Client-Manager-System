<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>家庭成员信息管理</title>
    <script src="${pageContext.request.contextPath}/adminStatic/js/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminStatic/css/select2.min.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminStatic/js/select2.min.js?v=${nowDate}"></script>	
 <style>
 body{
   margin-left:10%;
   background-color:rgb(239, 240, 244);
    width:100%;
    margin-top:50px;
 }
  tr{
  height:50px;
  }
 .text-center{
  text-align:center;
  }
  .text-left{
   text-align:left;
  }
.table-td{
    word-break:break-all;
    word-wrap: break-word;
    text-align:center;
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
	right:152px;
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
h2{
margin-left: 415px;
margin-bottom:20px;
}
.form-control{
   display: inline-block;
    height: 24px;
    padding: 4px 12px;
    font-size: 15px;
    line-height: 1.42857;
    color: #555555;
    background-image: none;
    border-radius: 2px;
    box-shadow: inset 0 1px 0px rgba(0, 0, 0, 0.075);
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}
.query{
   display:inline-block;
   -webkit-box-sizing:content-box;
   -moz-box-sizing:content-box;
   box-sizing:content-box;padding:0 12px;
   width:40px;
   margin-left:30px;
   padding-top:2px;
   padding-bottom:2px;
   line-height:28px;
   position:relative;
   bottom:1px;
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
				  		<h2>成员信息管理</h2>
				     	<input type="button" class="mybtn" onclick="location.href='${pageContext.request.contextPath}/houseMemberManage/houseMemberController/manage'" style="text-decoration:none; color:red" value="新增成员"/>     
						<form:form id="pageForm" modelAttribute="houseMemberSearcher">
									<div>
									    <label style="font-size:18px;">成员姓名:</label>
									    <form:input  path="name"  ia="name" placeholder="成员姓名" class="form-control" style="height:30px;width:150px;font-size:16px"/>
                                        <label style="font-size:18px;margin-left:20px;">所属户主:</label>
			                           	<form:select path="belongHouseId"  id="belongHouseId"  class="form-control"  style = "width:140px;height:30px;color: #555555;" >
			                           	    <form:option value="">（全部）</form:option>
			                               	<c:forEach items="${houseMasterList}" var="houseMaster">
			                               		<form:option value="${houseMaster.id }">${houseMaster.name }</form:option>
			                               	</c:forEach>
			                             </form:select>                                        
									    <input type="button" class="query" id="query" value="查询" style="text-decoration:none; color:red"/>  
									    <input type="button" class="query" id="clear" value="清空" style="text-decoration:none; color:red;margin-left:20px;"/>  
								   </div>
							</form:form>
	                       <div class="total">
	                            <table class="table"  width="80%" height="10%">
	                                <thead class="tableheader">
	                                <tr bgcolor="#4F81BD" style="color:#fff">
	                                        <th class="text-center">姓名</th>
	                                        <th class="text-center">性别</th>
	                               		    <th class="text-center">家庭住址</th>
	                                	    <th class="text-center">所属户主</th>
	                                		<th class="text-center">与户主关系</th>
	                                        <th class="text-center">生日</th>
	                                    	<th class="text-center">电话</th>
	                                    	<th class="text-center">操作</th>
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
	                                        <td width="100px"  class="table-td">${houseMember.birthday }</td> 
	                                        <td class="table-td">${houseMember.telephone }</td> 
	                                        <td class="table-td">
	                                        	<a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/manage?houseMemberId=${houseMember.id}">修改</a>
	                                        	<a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/delete?houseMemberId=${houseMember.id }" onclick="return confirm('确定将此条记录删除?')">删除</a>
	                                        </td> 	                                        
	                                    </tr>
	                                </c:forEach>
	                                </tbody>
	                            </table>
	                          </div>
	                      <div class="totalCounts">共<label class="counts">${page.totalRecord }</label>条数据</div>
	                      <div class="pageBar">
						       页次：${page.currentPage}/<label id="totalPages" >${page.totalPage}</label>&nbsp
						       <button class="pageButton">
						       <a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/list?p=1"  style="text-decoration:none;">首页</a>
						       </button>
						    <c:choose>  
						           <c:when test="${page.currentPage>1}">
						            <button class="pageButton">
						           		<a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/list?p=${page.currentPage-1}" style="text-decoration:none;">上一页</a>
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
						               <a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/list?p=${page.currentPage+1}" style="text-decoration:none;">下一页</a>
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
					       <a href="${pageContext.request.contextPath}/houseMemberManage/houseMemberController/list"  style="text-decoration:none;" id="enter">确定</a>
					       </button>						    	                      
	                      </div>    
                </body>
<script type="text/javascript">
$(function() {
	
	$(document).ready(function(){
		$("#belongHouseId").select2();
	});
	$("#query").click(function() {
		$("#pageForm").submit();
	});
	$("#clear").click(function() {
		$("#name").val("");
        $(".select2-selection__rendered").html('（全部）');
        $("select").val("");
	});
	
	$("#enter").click(function () {
		var pageNum=$("#pageInput").val();
		var totalPages = $("#totalPages").html().trim();
		if(/^[1-9]\d*$/.test(pageNum)&&parseInt(pageNum)<=parseInt(totalPages)){
			$("#enter").attr("href","${pageContext.request.contextPath}/houseMemberManage/houseMemberController/list?p="+pageNum);
		}else{
			    $("#pageInput").val("");
	            alert("输入页码错误!")
		}
	});
	 
})

</script>