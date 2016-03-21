<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel : 3});
		});
    	function updateSort() {
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/site/nav/updateSort");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/site/nav/">栏目列表</a></li>
		<shiro:hasPermission name="site:nav:edit"><li><a href="${ctx}/site/nav/form">栏目添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<table id="treeTable" class="table table-striped table-bordered table-condensed">
			<tr><th>栏目名称</th><th>备注</th><th style="text-align:center;">排序</th><th>操作</th></tr>
			<c:forEach items="${list}" var="tpl">
				<tr id="${tpl.id}" pId="${tpl.parent.id ne '1'?tpl.parent.id:'0'}">
					<td><a href="${ctx}/site/nav/form?id=${tpl.id}">${tpl.name}</a></td>
					<td>${tpl.remarks}</td>
					<td style="text-align:center;">
						<shiro:hasPermission name="site:nav:edit">
							<input type="hidden" name="ids" value="${tpl.id}"/>
							<input name="sorts" type="text" value="${tpl.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
						</shiro:hasPermission><shiro:lacksPermission name="site:nav:edit">
							${tpl.sort}
						</shiro:lacksPermission>
					</td>
					<td>
						<a href="${ctx}/site/navVisit?id=${nav.id}" target="_blank">访问</a>
						<shiro:hasPermission name="site:nav:edit">
							<a href="${ctx}/site/nav/form?id=${tpl.id}">修改</a>
							<a href="${ctx}/site/nav/delete?id=${tpl.id}" onclick="return confirmx('要删除该栏目及所有子栏目项吗？', this.href)">删除</a>
							<a href="${ctx}/site/nav/form?parent.id=${tpl.id}">添加下级栏目</a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
		</table>
		<shiro:hasPermission name="site:nav:edit"><div class="form-actions pagination-left">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
		</div></shiro:hasPermission>
	</form>
</body>
</html>