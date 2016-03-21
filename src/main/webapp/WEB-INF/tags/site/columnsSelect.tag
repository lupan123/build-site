<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="allowClear" type="java.lang.Boolean" required="false" description="是否允许清除"%>
<%@ attribute name="allowInput" type="java.lang.Boolean" required="false" description="文本框可填写"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="smallBtn" type="java.lang.Boolean" required="false" description="缩小按钮显示"%>
<%@ attribute name="hideBtn" type="java.lang.Boolean" required="false" description="是否显示按钮"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled"%>
<%@ attribute name="dataMsgRequired" type="java.lang.String" required="false" description=""%>

<%--栏目内容所包含的元素选择框的封装--%>
<div class="input-append">
    <%--画html--%>
    <c:set var="columns" value="${fns:getDictList('site_content_columns')}"/>
    <div id="${id}Content" class="controls" style="display: none">
        <table style="margin: 5px;">
            <c:forEach var="column" items="${columns}" varStatus="status">
                <c:if test="${status.index % 2 == 1} "><tr></c:if>
                <td>
                 <span>
                 <c:choose>
                     <c:when test="${fn:contains(value, column.value)}">
                         <input id="column${status.index}" type="checkbox" checked value="${column.value}" name="columnList">
                     </c:when>
                     <c:otherwise>
                         <input id="column${status.index}" type="checkbox" value="${column.value}" name="columnList">
                     </c:otherwise>
                 </c:choose>
                 <label for="column${status.index}">${column.label}</label>
                 </span>
                </td>
                <c:if test="${status.index % 2 == 1}"></tr></c:if>
            </c:forEach>
        </table>
    </div>

	<input id="${id}" name="${name}" ${allowInput?'':'readonly="readonly"'} type="text" value="${value}" data-msg-required="${dataMsgRequired}"
		class="${cssClass}" style="${cssStyle}"/><a id="${id}Button" href="javascript:" class="btn ${disabled} ${hideBtn ? 'hide' : ''}" style="${smallBtn?'padding:4px 2px;':''}">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp;
</div>

<script type="text/javascript">
	$("#${id}Button, #${id}Name").click(function(){
		// 是否限制选择，如果限制，设置为disabled
		if ($("#${id}Button").hasClass("disabled")){
			return true;
		}
		// 正常打开
		top.$.jBox.open($("#${id}Content").html(), "选择${title}", 200, 'auto', {
			buttons:{"确定":"ok", ${allowClear?"\"清除\":\"clear\", ":""}"关闭":true}, submit:function(v, h, f){
                if(v == 'ok'){
                    var array = [];
                    $("input[name='columnList']").attr("checked",false);
                    top.$("#jbox-content input[name='columnList']:checked").each(function(){
                        //将隐藏的checkbox也选中
                        $("#"+$(this).attr("id")).attr("checked","checked");
                        array.push($(this).val());
                    });
                    $("#${id}").val(array.join(','));
                }

                return true;
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
			}
		});
	});
</script>