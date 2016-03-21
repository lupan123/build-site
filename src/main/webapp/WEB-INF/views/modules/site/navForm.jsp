<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			if($("#dictType").val()){
				$('#dictTypeDiv').show();
				$('#dictTypeToggle').attr("checked", true);
			}
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/site/nav/">栏目列表</a></li>
		<li class="active"><a href="${ctx}/site/nav/form?id=${nav.id}&parent.id=${nav.parent.id}">栏目<shiro:hasPermission name="site:nav:edit">${not empty nav.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="site:nav:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="nav" action="${ctx}/site/nav/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

		<div class="control-group">
			<label class="control-label">上级栏目:</label>
			<div class="controls">
                <sys:treeselect id="nav" name="parent.id" value="${nav.parent.id}" labelName="parent.name" labelValue="${nav.parent.name}"
					title="栏目" url="/site/nav/treeData" extId="${nav.id}" cssClass="required"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">栏目名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
				<span>
            <input id="dictTypeToggle" type="checkbox"
				   onclick="if(this.checked){$('#dictTypeDiv').show()}else{$('#dictTypeDiv').hide()}$('#dictType').val()"><label for="dictTypeToggle">包含分类</label>
            </span>
			</div>

		</div>
		<div class="control-group">
			<label class="control-label">栏目关键值:</label>
			<div class="controls">
				<form:input path="value" htmlEscape="false" maxlength="100" class="required"/>
				<span class="help-inline">用于网站获取数据</span>
			</div>
		</div>

		<div id="dictTypeDiv" class="control-group" style="display:none">
			<label class="control-label">字典类型:</label>
			<div class="controls">
				<form:select path="dictType" class="input-xlarge">
					<form:option value="" label="无"/>
					<form:options items="${fns:getDictTypeList()}"  htmlEscape="false" />
				</form:select>
				<span class="help-inline">字典自定义的类型字段</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">描述:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">内容元素:</label>
			<div class="controls">
				<site:columnsSelect id="includeContentColumns" name="includeContentColumns" value="${nav.includeContentColumns}"
								title="元素"  cssClass="required"/>&nbsp;
				<span class="help-inline">栏目所包含的内容元素，用,隔开多个元素</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="11" class="required digits"/>
				<span class="help-inline">栏目的排列次序</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">是否需要审核:</label>
			<div class="controls">
				<form:radiobuttons path="isAudit" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="site:nav:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>