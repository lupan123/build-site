<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>内容管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
//            if($("#link").val()){
//                $('#linkBody').show();
//                $('#url').attr("checked", true);
//            }
            $("#h1").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    if ($("#categoryId").val()==""){
                        $("#categoryName").focus();
                        top.$.jBox.tip('请选择归属栏目','warning');
                    }else if (CKEDITOR.instances.content.getData()=="" && $("#link").val().trim()==""){
                        top.$.jBox.tip('请填写正文','warning');
                    }else{
                        loading('正在提交，请稍等...');
                        form.submit();
                    }
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
<%--功能标签--%>
<ul class="nav nav-tabs">
    <li>
        <a href="${ctx}/site/content/list?nav.id=${content.nav.id}">内容列表</a>
    </li>
    <li class="active"><a
            href="<c:url value='${fns:getAdminPath()}/site/content/form?id=${content.id}&nav.id=${content.nav.id}'>
            <c:param name='nav.name' value='${content.nav.name}'/>
            <c:param name='nav.dictType' value='${content.nav.dictType}'/>
            <c:param name='nav.includeContentColumns' value='${content.nav.includeContentColumns}'/>
            </c:url>">文章<shiro:hasPermission
            name="site:content:edit">${not empty content.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="site:content:edit">查看</shiro:lacksPermission></a></li>
</ul>

<form:form id="inputForm" modelAttribute="content" action="${ctx}/site/content/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">归属栏目:</label>

        <div class="controls">
            <sys:treeselect id="nav" name="nav.id" value="${content.nav.id}" labelName="nav.name"
                            labelValue="${content.nav.name}"
                            title="栏目" url="/site/nav/treeData" module="content" selectScopeModule="true"
                            notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="required"/>&nbsp;
  <span>
  <input id="url" type="checkbox"
         onclick="if(this.checked){$('#linkBody').show()}else{$('#linkBody').hide()}$('#link').val()"><label for="url">外部链接</label>
  </span>
        </div>
    </div>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'h1' )}">
    <div class="control-group">
        <label class="control-label">标题:</label>

        <div class="controls">
            <form:input path="h1" htmlEscape="false" maxlength="200" class="input-xxlarge measure-input required"/>
            <%--<span>--%>
            <%--<input id="dictToggle" type="checkbox"--%>
                   <%--onclick="if(this.checked){$('#dictDiv').show()}else{$('#dictDiv').hide()}$('#dict.id').val()"><label for="dictToggle">包含分类</label>--%>
            <%--</span>--%>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'dict.id' )}">
    <div id="dictDiv" class="control-group">
        <label class="control-label">字典类型值:</label>
        <%--<div class="controls">--%>
            <%--<form:input path="dict.id" htmlEscape="false" maxlength="200" class="input-xlarge"/>--%>
            <%--<span class="help-inline">字典自定义的类型字段的值列表。</span>--%>
        <%--</div>--%>
            <div class="controls">
            <form:select path="dict.id" class="input-medium">
                <form:option value="" label="未分类"/>
                <form:options items="${fns:getDictList(content.nav.dictType)}" itemLabel="label" itemValue="id" htmlEscape="false" />
            </form:select>
            <span class="help-inline">字典自定义的类型字段的值列表。</span>
            </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'h2' )}">
    <div class="control-group">
        <label class="control-label">副标题:</label>

        <div class="controls">
            <form:input path="h2" htmlEscape="false" maxlength="200" class="input-xxlarge measure-input"/>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'h3' )}">
    <div class="control-group">
        <label class="control-label">三级标题:</label>

        <div class="controls">
            <form:input path="h3" htmlEscape="false" maxlength="200" class="input-xxlarge measure-input required"/>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'href' )}">
    <div id="linkBody" class="control-group" style="display:none">
        <label class="control-label">外部链接:</label>

        <div class="controls">
            <form:input path="href" htmlEscape="false" maxlength="200" class="input-xlarge"/>
            <span class="help-inline">绝对或相对地址。</span>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'intro' )}">
    <div class="control-group">
        <label class="control-label">简介（短内容）:</label>

        <div class="controls">
            <form:textarea path="intro" htmlEscape="false" rows="4" maxlength="400" class="input-xxlarge"/>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'image' )}">
    <div class="control-group">
        <label class="control-label">图片:</label>

        <div class="controls">
            <input type="hidden" id="image" name="image" value="${content.image}"/>
            <sys:ckfinder input="image" type="images" uploadPath="/site/content" selectMultiple="false"/>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'file' )}">
        <div class="control-group">
            <label class="control-label">文件:</label>

            <div class="controls">
                <input type="hidden" id="file" name="file" value="${content.file}"/>
                <sys:ckfinder input="file" type="files" uploadPath="/site/content" selectMultiple="false"/>
            </div>
        </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'content' )}">
    <div class="control-group">
        <label class="control-label">正文:</label>

        <div class="controls">
            <form:textarea id="content" htmlEscape="true" path="content" rows="4" maxlength="200" class="input-xxlarge"/>
            <sys:ckeditor replace="content" uploadPath="/site/content"/>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:contains(content.nav.includeContentColumns,'createDate' )}">
    <div class="control-group">
        <label class="control-label">发布时间:</label>

        <div class="controls">
            <input id="createDate" name="createDate" type="text" readonly="readonly" maxlength="20"
                   class="input-medium Wdate"
                   value="<fmt:formatDate value="${content.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    </c:if>

    <shiro:hasPermission name="site:content:audit">
        <div class="control-group">
            <label class="control-label">发布状态:</label>

            <div class="controls">
                <form:radiobuttons path="delFlag" items="${fns:getDictList('site_del_flag')}" itemLabel="label"
                                   itemValue="value" htmlEscape="false" class="required"/>
                <span class="help-inline"></span>
            </div>
        </div>
    </shiro:hasPermission>
    <div class="form-actions">
        <shiro:hasPermission name="site:content:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                             value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
