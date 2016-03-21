<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/2 0002
  Time: 下午 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="header.jsp" %>

    <title>声娱传媒.精选专辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

    <script type="text/javascript" src="${ctxWeb}/framework/js/fliplightbox.min.js"></script>
    <script type="text/javascript">
        $('body').flipLightBox()
    </script>
    <script type="text/javascript" src="${ctxWeb}/framework/js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="${ctxWeb}/framework/js/jquery.mixitup.min.js"></script>
    <script type="text/javascript">
        $(function () {

            var filterList = {

                init: function () {

                    // MixItUp plugin
                    // http://mixitup.io
                    $('#portfoliolist').mixitup({
                        targetSelector: '.portfolio',
                        filterSelector: '.filter',
                        effects: ['fade'],
                        easing: 'snap',
                        // call the hover effect
                        onMixEnd: filterList.hoverEffect()
                    });

                },

                hoverEffect: function () {

                    // Simple parallax effect
                    $('#portfoliolist .portfolio').hover(function () {
                        $(this).find('.label').stop().animate({
                            bottom: 0
                        }, 200, 'easeOutQuad');
                        $(this).find('img').stop().animate({
                            top: -30
                        }, 500, 'easeOutQuad');
                    }, function () {
                        $(this).find('.label').stop().animate({
                            bottom: -40
                        }, 200, 'easeInQuad');
                        $(this).find('img').stop().animate({
                            top: 0
                        }, 300, 'easeOutQuad');
                    });

                }
            };

            // Run the show!
            filterList.init();

        });
    </script>
    <!-- start light_box -->
    <%--<link rel="stylesheet" type="text/css" href="${ctxWeb}/framework/css/jquery.fancybox.css" media="screen"/>--%>
    <%--<script type="text/javascript" src="${ctxWeb}/framework/js/jquery.fancybox-1.2.1.js"></script>--%>
    <%--<script type="text/javascript">--%>
        <%--$(document).ready(function () {--%>
            <%--$("div.fancyDemo a").fancybox();--%>
        <%--});--%>
    <%--</script>--%>
</head>
<body>

<%--头部导航页面--%>
<%@include file="head-nav.jsp" %>

<div id="omnibus_intro" class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>精选 专辑</h1></li>
            <c:forEach items="${omnibus_intro}" var="content">
                <li class="about_head-right"><p>${content.intro}</p></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div id="omnibus_list"  class="container">
    <div class="portfolio_main">
        <h2>精选 专辑</h2>
        <c:set var="dictList" value="${fns:getDictList('omnibus_list_type')}"/>
        <ul id="filters" class="clearfix">
            <li>
                <span class="filter active" data-filter="
            <c:forEach items="${dictList}" var="dict">
            <c:out value="${dict.value} " default=""/>
            </c:forEach>">所有分类</span>
            </li>

            <c:forEach items="${dictList}" var="dict">
                <li>
                    <span class="filter" data-filter="${dict.value}">${dict.label}</span>
                </li>
            </c:forEach>
        </ul>
        <div id="portfoliolist">
            <c:forEach items="${omnibus_list}" var="content">
                <div class="portfolio  ${content.dict.value}" data-cat="${content.dict.value}">
                    <div class="portfolio-wrapper ">
                        <div class="fancyDemo">
                            <a rel="group" title="" href="${content.image}">
                                <img src="${content.image}" alt="" class="img-responsive " />
                            </a>
                        </div>
                        <div class="label">
                            <div class="label-text">
                                <span class="text-category"> <span class="glyphicon glyphicon-music"></span> ${content.h1}</span>
                            </div>
                            <div class="label-bg">${content.h2}</div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<%--底部说明--%>
<%@ include file="footer.jsp" %>
</body>
</html>
