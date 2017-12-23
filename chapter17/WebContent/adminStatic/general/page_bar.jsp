<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="taglibs.jsp"%>

<div id="xnypager">
    <div class="total">
      <!-- 共 --><spring:message code="table.page.totalCount"/><span style="color:#f45046">${pageObj.totalCount}</span><!-- 条数据 --><spring:message code="table.page.totalRecords"/>
    </div>
    <form:hidden path="pageNo" id="pageNo" />
    <input type="hidden" id="totalPages" value="${pageObj.totalPages}"/>
    <c:choose>
        <c:when test="${pageObj.hasPre}"><a href="javascript:toPage('${pageObj.prePage}');"><!-- 上一页 --><spring:message code="table.page.privous"/></a></c:when>
        <c:otherwise><a class="disabled"><!-- 上一页 --><spring:message code="table.page.privous"/></a></c:otherwise>
    </c:choose>
    
    <c:choose>
        <c:when test="${pageObj.totalPages<=5}">
            <c:forEach begin="1" end="${pageObj.totalPages}" var="nowCount">
                <c:choose>
                    <c:when test="${nowCount == pageObj.pageNo}">
                        <a href="javascript:void(0)" class="active">${nowCount}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:toPage('${nowCount}')">${nowCount}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${pageObj.pageNo <= 5}">
                    <c:forEach begin="1" end="5" var="nowCount">
                        <c:choose>
                            <c:when test="${nowCount == pageObj.pageNo}">
                                <a href="javascript:void(0)" class="active">${nowCount}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:toPage('${nowCount}')">${nowCount}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <span>...</span>
                    <a href="javascript:toPage('${pageObj.totalPages}')">${pageObj.totalPages}</a>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${pageObj.pageNo > (pageObj.totalPages-5)}">
                            <a href="javascript:toPage(1)">1</a>
                            <span>...</span>
                            <c:forEach begin="${pageObj.totalPages - 4}" end="${pageObj.totalPages}" var="nowCount">
                                <c:choose>
                                    <c:when test="${nowCount == pageObj.pageNo}">
                                        <a href="javascript:void(0)" class="active">${nowCount}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:toPage('${nowCount}')">${nowCount}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:toPage(1)">1</a>
                            <span>...</span>
                            <c:forEach begin="${pageObj.pageNo - 1}" end="${pageObj.pageNo+1}" var="nowCount">
                                <c:choose>
                                    <c:when test="${nowCount == pageObj.pageNo}">
                                        <a href="javascript:void(0)" class="active">${nowCount}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:toPage('${nowCount}')">${nowCount}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <span>...</span>
                            <a href="javascript:toPage('${pageObj.totalPages}')">${pageObj.totalPages}</a>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${pageObj.hasNext}"><a href="javascript:toPage('${pageObj.nextPage}');"><!-- 下一页 --><spring:message code="table.page.next"/></a></c:when>
        <c:otherwise><a class="disabled"><!-- 下一页 --><spring:message code="table.page.next"/></a></c:otherwise>
    </c:choose>
    
    <%--<span class="pageNum">共${pageObj.totalPages}页</span>到第
    <input class="isTxtBig" type="text" id="toPageNo" value="">页--%>
    <%--<input type="text" id="xnypager_btn_go_input" id="toPageNo"  onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)return false;" value="2">--%>
    
   <%--  <span class="normalsize"><!-- 总页数 --><spring:message code="table.page.totalPage"/>:&nbsp;${pageObj.totalPages}&nbsp;&nbsp;&nbsp;&nbsp;</span> --%>
    
    
       <span><!-- 跳转到 --><spring:message code="table.page.trun_to"/></span>
        <input type="text" id="xnypager_btn_go_input" value="">
        <span style="font-size:14px">页</span>
 
   
    <div class="pageBtn">
       <a href="javascript:toCertainPage()" ><!-- 跳转按钮 --><spring:message code="table.page.trun_button"/></a>
    </div>
</div>

<script type="text/javascript">
    function toCertainPage(){
        var pageNum = $("#xnypager_btn_go_input").val();
        var totalPages = $("#totalPages").val();
        //匹配数字
        if(/^[1-9]\d*$/.test(pageNum)&&parseInt(pageNum)<=parseInt(totalPages)){
            $("#pageNo").attr("value",pageNum);
            $("#pageForm").submit();
        }else{
            $("#xnypager_btn_go_input").val("");
            showTipMsg("提示", "输入页数错误");
        }
    }
    function toPage(pageNo) {
        $("#pageNo").attr("value",pageNo);
        $("#pageForm").submit();
    }

</script>