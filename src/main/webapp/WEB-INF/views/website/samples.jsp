<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/2 0002
  Time: 下午 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>

    <%@ include file="header.jsp" %>

    <title>声娱传媒.样音试听</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

    <script type="application/javascript">
        $(function(){
            $(".audio-play").click(function(){
                var h1 = $(this).attr("data-h1");
                var file = $(this).attr("data-file");
//                var href = "1";
                // 播放器弹窗
                $.jBox.open("iframe:${ctx}/site/audioPlay?h1="+h1+"&file="+file,"样音播放",600,'auto', {
                    persistent: true,
                    iframeScrolling: 'auto',
                    buttons: { }
                });
            });
        });
    </script>

    <style>
        #jbox *{
            box-sizing:content-box ;
        }
    </style>
</head>
<body>

<%--头部导航页面--%>
<%@include file="head-nav.jsp" %>

<div id="samples_intro" class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>样音 试听</h1></li>
            <c:forEach items="${samples_intro}" var="content">
                <li class="about_head-right"><p>${content.intro}</p></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="container">
    <div id="samples_detail" class="about_top">
        <c:forEach items="${samples_detail}" var="content">
            <div class="col-md-6 box_6">
                <img src="${content.image}" class="img-responsive" alt="${content.h1}"/>
            </div>
            <div class="col-md-6 about_top-right">
                <h2>样音作品</h2>
                    ${content.content}
            </div>
        </c:forEach>
        <div class="clearfix"></div>
    </div>
    <div id="samples_list" class="service_grid1">
        <div  class="service_top">

            <c:forEach items="${samples_list}" var="content">
                <div class="col-md-3">
                    <ul class="service_grid">
                        <%--<i class="s1" style="background: rgba(0, 0, 0, 0) url('${content.image}') no-repeat scroll 0px 0px;"> </i>--%>
                            <i class="s1" > <span class="glyphicon glyphicon-headphones"></span> </i>
                        <li class="service_grid-right">
                            <h3>
                                <a href="javascript:void(0);" class="audio-play" data-h1="${content.h1}" data-file="${content.file}">
                                <span class="glyphicon glyphicon-play"></span> ${content.h1}
                            </a>
                            </h3>
                            <p>${content.intro}</p>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </div>
            </c:forEach>

            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<%--底部说明--%>
<%@ include file="footer.jsp" %>

</body>
</html>
