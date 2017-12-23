<%-- 提示错误信息 --%>
<c:if test="${not empty errorMsg}">
	<!-- 主要内容 -->
	<div class="container summary">
		<!-- 关于 -->
		<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
			aria-labelledby="modal-label" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<!-- <button type="button" class="primary" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="directPay_listWlaccount.panel.body.close"/></span>
						</button> -->
						<h4 class="modal-title" id="modal-label"><spring:message code="operation.tips.Tips"/></h4>
					</div>
					<div class="modal-body">
						<p>
			                <c:forEach var="msg" items="${errorMsg}">
			                    <c:out value="${error}"/><br />
			                </c:forEach>
						</p>
					</div>
					<div class="modal-footer">
						<%-- <button type="button" class="btn btn-default" onclick="window.location.reload();" data-dismiss="modal">
						<spring:message code="operation.tips.OK"/></button> --%>
						<button type="button" class="btn btn-success btn-ok" data-dismiss="modal">
							<spring:message code="directPay_listWlaccount.panel.body.close"/>
						</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
	$(function() {
	    $('#about-modal').modal({
	    	show:true,
	        backdrop:'static'
	    });
	});
	</script>

    <c:remove var="errorMsg" scope="session"/>
</c:if>

<%-- 提示正确信息 --%>
<c:if test="${not empty successMsg}">
	<!-- 主要内容 -->
	<div class="container summary">
		<!-- 关于 -->
		<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
			aria-labelledby="modal-label" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="modal-label"><spring:message code="operation.tips.Tips"/></h4>
					</div>
					<div class="modal-body">
						<p>
			                <c:forEach var="msg" items="${successMsg}">
			                    <c:out value="${msg}"/><br />
			                </c:forEach>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success btn-ok" data-dismiss="modal">
							<spring:message code="directPay_listWlaccount.panel.body.close"/>
						</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
	$(function() {
	    $('#about-modal').modal({
	        show:true,
	        backdrop:'static'//点击空白处，不关闭模态框
	    });
	});
	</script>
	
    <c:remove var="successMsg" scope="session"/>
</c:if>

<%-- 在表单提交时屏蔽对当页的其它操作，并给出友好的处理提示 Begin --%>
<style>
	.loading {  
	    z-index: 1001;  
	    vertical-align: middle;  
	    text-align:center;  
	    height:300px;  
	    line-height:115px;  
	}  
	.spnContent {  
	    vertical-align: 50%;  
	    margin-left: 10px;  
	    color: yellow;  
	    font-size: 18px;  
	    font-weight: bold;  
	}  
	.white_content {  
	    display: none;  
	    position: absolute;  
	    border: 3px solid lightblue;  
	    background-color: #000;  
	    z-index: 9999;  
	    -moz-opacity: 0.5;  
	    opacity: .50;  
	    filter: alpha(opacity=50);  
	    vertical-align: middle;  
	    top:0px;  
	    text-align:center;  
	}  

</style>
<div id="divMask" class="white_content"> <!--弹出层时背景层DIV-->    
    <div class="loading">  
    	<br/>
        <span ><img src="${ctx}/adminStatic/images/Loading.gif" alt="Processing..."></span>
        <br/>
        <span class='spnContent'>Processing......</span>  
    </div>  
</div>  
<script>
/*-----------------------------加载div-----------------------------------*/  
	//弹出隐藏层  
	function showMask() {  
	    var showdiv = document.getElementById("divMask");  //遮罩div的id  
	    if (showdiv == undefined) {  
	        return;  
	    }  
	    showdiv.style.top = "0px";
	    showdiv.style.left = "0px";  
	    showdiv.style.width = $(document).width()+"px";  
	    showdiv.style.height = $(document).height() + "px";   
	    showdiv.style.display = 'block';
	    
	    return true;
	};  
	//关闭弹出层  
	function CloseDiv() {  
	    document.getElementById(show_div).style.display = 'none';  
	};  
 /*----------------------------------------------------------------*/  
</script>
<%-- 在表单提交时屏蔽对当页的其它操作，并给出友好的处理提示 End --%>


<%-- Delete Confirm MsgBox��--%>
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"id="Tips">Tips</div>
			<div class="modal-body"  id="Messages">Msg</div>
			<div class="modal-footer">
			<a class="btn btn-success btn-ok" id="OK">OK</a>
			<button type="button" class="btn btn-success" data-dismiss="modal" id="Cancel">Cancel</button>
			</div>
		</div>
	</div>
</div>

<!-- Show tips -->
<div class="modal fade" id="tip-msg" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"id="title">Title</div>
			<div class="modal-body"  id="msg">Msg</div>
			<div class="modal-footer">
			<a class="btn btn-success btn-ok" id="ok">OK</a>
			<button type="button" class="btn btn-success" data-dismiss="modal" id="cancel">Cancel</button>
			</div>
		</div>
	</div>
</div>

<!-- customize tips -->
<div class="modal fade" id="customize-box" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"id="customize-title">Title</div>
			<div class="modal-body"  id="customize-msg">Msg</div>
			<div class="modal-footer">
			<a class="btn btn-success btn-ok" id="customize-ok">OK</a>
			<button type="button" class="btn btn-success" data-dismiss="modal" id="customize-cancel">Cancel</button>
			</div>
		</div>
	</div>
</div>
<script>
// show confirm message
function showConfirmMsg(){
	$('#Tips').html("<spring:message code="operation.tips.Tips"/>");
	$('#Messages').html("<spring:message code="operation.tips.Messages"/>");
	$('#OK').html("<spring:message code="operation.tips.OK"/>");
	$('#Cancel').html("<spring:message code="operation.tips.Cancel"/>");
}

// show confirm message with parameter
function showConfirmMsgWithParam(message){
	$('#Tips').html("<spring:message code="operation.tips.Tips"/>");
	$('#Messages').html(message);
	$('#OK').html("<spring:message code="operation.tips.OK"/>");
	$('#Cancel').html("<spring:message code="operation.tips.Cancel"/>");
}

// just show messages
function showTipMsg(title, message){
	$('#title').html(title);
	$('#msg').html(message);
	$('#ok').remove();
	$('#cancel').html("<spring:message code="operation.tips.OK"/>");
	$('#tip-msg').modal('show');
}

// show customize message box
function showCustomizeMsg(message){
	$('#customize-title').html("<spring:message code="operation.tips.Tips"/>");
	$('#customize-msg').html(message);
	$('#customize-ok').html("<spring:message code="operation.tips.OK"/>");	
	$('#customize-cancel').html("<spring:message code="operation.tips.Cancel"/>");
	$('#customize-box').modal('show');
}
</script>
