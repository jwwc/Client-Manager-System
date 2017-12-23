<%-- Operation Tips Messages --%>

<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"id="Tips">Tips</div>
			<div class="modal-body"  id="Messages">Messages</div>
			<div class="modal-footer">
			<a class="btn btn-success btn-ok" id="OK">OK</a>
				<button type="button" class="btn btn-success" data-dismiss="modal" id="Cancel">Cancel</button>
			</div>
		</div>
	</div>
</div>

<script>
function showConfirmMsg(){
	$('#Tips').html("<spring:message code="operation.tips.Tips"/>");
	$('#Messages').html("<spring:message code="operation.tips.Messages"/>");
	$('#OK').html("<spring:message code="operation.tips.OK"/>");
	$('#Cancel').html("<spring:message code="operation.tips.Cancel"/>");
}
</script>