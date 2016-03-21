<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<link href="${ctxWeb}/framework/css/bootstrap.css" rel='stylesheet' type='text/css'/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctxWeb}/framework/js/jquery.min.js"></script>
<%--<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>--%>
<%--<script src="${ctxWeb}/framework/plugins/jquery-1.9.1/jquery-1.9.1.min.js"></script>--%>
<!-- Custom Theme files -->
<link href="${ctxWeb}/framework/css/style.css" rel='stylesheet' type='text/css'/>
<!--bootstrap.js-->
<%--<script src="${ctxWeb}/framework/plugins/bootStrap3.3/dist/js/bootstrap.min.js"></script>--%>
<!--bootstrap-pagination-->
<script src="${ctxWeb}/framework/plugins/bootstrap-pagination/jquery.twbsPagination.min.js"></script>
<!-- 弹窗插件jbox -->
<link href="${ctxWeb}/framework/plugins/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxWeb}/framework/plugins/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>

<script>
    var baseJS = '${ctxWeb}';
</script>

<script>
    /**
     * 定位到相关栏目
     */
    <c:if test="${navPath !=''}">
    window.onload = function(){
        $("html,body").animate({scrollTop:$("#${navPath}").offset().top-100},500);
    };
    </c:if>
</script>

