<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>网站内容管理</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">
//        function viewComment(href){
//            top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-120,{
//                buttons:{"关闭":true},
//                loaded:function(h){
//                    $(".jbox-content", top.document).css("overflow-y","hidden");
//                    $(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
//                    $("body", h.find("iframe").contents()).css("margin","10px");
//                }
//            });
//            return false;
//        }
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

    </script>
    <style>
        .table-img{
            max-width: 50px;
            max-height: 50px;
        }
    </style>
</head>
<body>
<%--功能标签--%>
<ul class="nav nav-tabs">
    <li class="active">
        <a href="${ctx}/site/content/list?nav.id=${content.nav.id}">内容列表</a>
    </li>
    <shiro:hasPermission name="site:content:edit">
        <li>
            <a href="<c:url value='${fns:getAdminPath()}/site/content/form?id=${content.id}&nav.id=${content.nav.id}'>
            <c:param name='nav.name' value='${content.nav.name}'/>
            <c:param name='nav.dictType' value='${content.nav.dictType}'/>
            <c:param name='nav.includeContentColumns' value='${content.nav.includeContentColumns}'/>
            </c:url>">内容添加</a>
        </li>
    </shiro:hasPermission>
</ul>

<%--搜索form--%>
<form:form id="searchForm" modelAttribute="content" action="${ctx}/site/content/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>栏目：</label><sys:treeselect id="nav" name="nav.id" value="${content.nav.id}" labelName="nav.name"
                                      labelValue="${content.nav.name}"
                                      title="栏目" url="/site/nav/treeData" module="content" notAllowSelectRoot="false"
                                      cssClass="input-small"/>
    <label>标题：</label><form:input path="h1" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
    <label>状态：</label><form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag"
                                         items="${fns:getDictList('site_del_flag')}" itemLabel="label" itemValue="value"
                                         htmlEscape="false"/>
</form:form>

<%--操作提示信息--%>
<sys:message content="${message}"/>

<%--内容表格--%>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>栏目</th>
        <th>标题</th>
        <c:if test="${fn:contains(content.nav.includeContentColumns,'image' )}"><th>图片</th></c:if>
        <c:if test="${fn:contains(content.nav.includeContentColumns,'file' )}"><th>文件</th></c:if>
        <th>发布者</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="content">
        <tr>
            <td><a href="javascript:" onclick="$('#navId').val('${content.nav.id}');$('#navName').val('${content.nav.name}');$('#searchForm').submit();return false;">${content.nav.name}</a></td>
            <td><a href="${ctx}/site/content/form?id=${content.id}" title="${content.h1}">${fns:abbr(content.h1,40)}</a></td>
            <c:if test="${fn:contains(content.nav.includeContentColumns,'image' )}"><td><img src="${content.image}" alt="无" class="table-img"/></td></c:if>
            <c:if test="${fn:contains(content.nav.includeContentColumns,'file' )}">
                <td><a href="javascript:void(0)">
                    <script type="application/javascript">
                        //文档地址url转换为文件名
                        var url = "${content.file}";
                        if(url!=null&&url!=""){
                            document.write(decodeURIComponent(url.substring(url.lastIndexOf("/")+1)));
                        }
                    </script>
                    </a></td></c:if>
            <td>${content.createBy.name}</td>
            <td><fmt:formatDate value="${content.updateDate}" type="both"/></td>
            <td>
                <a href="${ctx}/site/visit?id=${content.nav.id}" target="_blank">访问</a>
                <shiro:hasPermission name="site:content:edit">
                    <a href="${ctx}/site/content/form?id=${content.id}">修改</a>
                    <shiro:hasPermission name="site:content:audit">
                        <a href="${ctx}/site/content/delete?id=${content.id}${content.delFlag ne 0?'&isRe=true':''}&navId=${content.nav.id}" onclick="return confirmx('确认要${content.delFlag ne 0?'发布':'删除'}该文章吗？', this.href)" >${content.delFlag ne 0?'发布':'删除'}</a>
                    </shiro:hasPermission>
                </shiro:hasPermission>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>
