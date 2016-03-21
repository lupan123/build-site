<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <%@include file="header.jsp" %>

    <title>声娱传媒.人物</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
</head>
<body>

<%--头部导航页面--%>
<%@include file="head-nav.jsp" %>


<div id="about_intro" class="about">
    <div class="container">
        <ul class="about_head">
                <li class="about_head-left"><h1>关于 我们</h1></li>
            <c:forEach items="${about_intro}" var="content">
                <li class="about_head-right"><p>${content.intro}</p></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div id="about_detail" class="container ">
    <div class="about_top">
        <c:forEach items="${about_detail}" var="content">
            <div class="col-md-6 box_6">
                <img src="${content.image}" class="img-responsive" alt="${content.h1}"/>
            </div>
            <div class="col-md-6 about_top-right">
                <h2>公司简介</h2>
                    ${content.content}
            </div>
        </c:forEach>
        <div class="clearfix"></div>
    </div>
</div>

<div id="about_team_intro" class="team text-center bg_white">
    <div class="container">
        <c:forEach items="${about_team_intro}" var="content">
            <h3 id="about_team_intro">我们的团队</h3>

            <p>${content.intro}</p>
        </c:forEach>

        <c:forEach items="${about_team}" var="content">
            <div id="about_team" class="col-md-3 grid_3">
                <img src="${content.image}" class="img-responsive" alt="${content.h1}"/>
                <ul class="team_social">
                    <li><a href=""><i class="fb"> </i> </a></li>
                    <li><a href=""><i class="tw"> </i> </a></li>
                    <li><a href=""><i class="linkedin"> </i> </a></li>
                </ul>
                <h4><a href="${content.href}">${content.h1}</a></h4>
                <h5>${content.h2}</h5>
            </div>
        </c:forEach>

        <div class="clearfix"></div>
    </div>
</div>


<div  class="team text-center">
    <div class="container">

        <c:forEach items="${about_partner_intro}" var="content">
            <h3 id="about_partner_intro">合作伙伴</h3>
            <p>${content.intro}</p>
        </c:forEach>

        <c:forEach items="${about_partner}" var="content">
            <div id="about_partner" class="col-md-3 grid_3">
                <img src="${content.image}" class="img-responsive" alt=""/>
                <ul class="team_social">
                    <li><a href=""> <i class="fb"> </i> </a></li>
                    <li><a href=""><i class="tw"> </i> </a></li>
                    <li><a href=""><i class="linkedin"> </i> </a></li>
                </ul>
                <h4><a href="${content.href}">${content.h1}</a></h4>
                <h5>${content.h2}</h5>
            </div>
        </c:forEach>

        <div class="clearfix"></div>
    </div>
</div>

<%--底部说明--%>
<%@ include file="footer.jsp" %>
</body>
</html>