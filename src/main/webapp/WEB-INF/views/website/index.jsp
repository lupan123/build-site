<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="header.jsp" %>

    <title>声娱传媒.主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Uibrush Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>


    <script type="application/x-javascript">

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!-- slider css -->
    <link rel="stylesheet" href="${ctxWeb}/framework/plugins/Nivo-Slider-master/themes/light/light.css" type="text/css"
          media="screen"/>
    <link rel="stylesheet" href="${ctxWeb}/framework/plugins/Nivo-Slider-master/nivo-slider.css" type="text/css"
          media="screen"/>
    <!-- start flipLightBox -->
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
                    $('#portfoliolist-photo').mixitup({
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
                    $('#portfoliolist-photo .portfolio').hover(function () {
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
    <link rel="stylesheet" type="text/css" href="${ctxWeb}/framework/css/jquery.fancybox.css" media="screen"/>
    <script type="text/javascript" src="${ctxWeb}/framework/js/jquery.fancybox-1.2.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("div.fancyDemo a").fancybox();
        });
    </script>
</head>
<body>

<%--头部导航页面--%>
<%@include file="head-nav.jsp"%>
<%--<jsp:include page="head-nav.jsp">--%>
    <%--<jsp:param name="title" value="index.jsp"/>--%>
<%--</jsp:include>--%>

<%--轮播图片--%>
<div id="index_slider" class="banner">
    <div class="banner_container">
        <div class="slider-wrapper theme-light">
            <div id="slider" class="nivoSlider">
                <c:forEach items="${index_slider}" var="content">
                    <img src="${content.image}" data-thumb="" alt="${content.h1}" title="${content.intro}"/>
                </c:forEach>
            </div>

        </div>
        <script type="text/javascript" src="${ctxWeb}/framework/plugins/Nivo-Slider-master/jquery.nivo.slider.pack.js"></script>
        <script>
            $(function () {
                $('#slider').nivoSlider({
                    boxRows: 1
                });
            });
        </script>
    </div>
</div>

<!-- 照片展示 -->
<div id="index_activity_photo" class="portfolio_main">
    <div class="container">
        <h3 class="subhead">活动照片</h3>
        <c:set var="dictList" value="${fns:getDictList('site_activity_photo_type')}"/>
        <ul id="filters" class="clearfix">
            <li><span class="filter active" data-filter="
            <c:forEach items="${dictList}" var="dict">
            <c:out value="${dict.value} " default=""/>
            </c:forEach>
            ">所有照片</span></li>
            <c:forEach items="${dictList}" var="dict">
                <li><span class="filter" data-filter="${dict.value}">${dict.label}</span></li>
            </c:forEach>
        </ul>

        <div id="portfoliolist-photo">
            <c:forEach items="${index_activity_photo}" var="content">
                <div class="portfolio img-thumbnail ${content.dict.value}" data-cat="${content.dict.value}">
                    <div class="portfolio-wrapper ">
                        <div class="fancyDemo">
                            <a rel="group" title="" href="${content.image}">
                                <img src="${content.image}" alt="" class="img-responsive " />
                            </a>
                        </div>
                        <div class="label">
                            <div class="label-text">
                                <span class="text-category">${content.h1}</span>
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


<div id="index_recommend_work" class="features-grids text-center">
    <div class="container">
        <h3 class="subhead" id="omnibusHead">推荐作品</h3>

        <c:forEach items="${index_recommend_work}" var="content">
        <div class="col-xs-6 col-sm-4 col-md-3  features-grid">
            <div class="works">
                <div class="works-cover">
                    <a href="${content.href}"><img src="${content.image}" alt="${content.h1}" class="r r-2x img-full"></a>
                </div>
                <div class="mark">
                    <a href="${content.href}" class="name"><span class="glyphicon glyphicon-music"></span> ${content.h1}</a>
                </div>
            </div>
        </div>
        </c:forEach>

        <div class="clearfix"></div>
    </div>
</div>

<div id="index_profession" class="business-grids text-center">
    <div class="container">

        <c:forEach items="${index_profession}" var="content">
        <div class="col-xs-6 col-sm-4 col-md-3  business-grid">
            <span class="img-circle" style="background: rgba(0, 0, 0, 0) url('${content.image}') no-repeat scroll 0px 0px;"> </span>
            <h3>${content.h1}</h3>
            <p>${content.intro}</p>
        </div>
        </c:forEach>

        <div class="clearfix"></div>
    </div>
</div>

<%--底部说明--%>
<%@ include file="footer.jsp"%>
<%--<jsp:include page="footer.jsp"/>--%>

</body>
</html>
