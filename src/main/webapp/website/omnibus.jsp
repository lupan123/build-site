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
    <meta name="keywords" content="Uibrush Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
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
<jsp:include page="head-nav.jsp">
    <jsp:param name="title" value="omnibus.jsp"/>
</jsp:include>

<div class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>精选 专辑</h1></li>
            <li class="about_head-right"><p>精选专辑介绍</p></li>
        </ul>
    </div>
</div>
<div class="container">
    <div class="portfolio_main">
        <h2>精选 专辑</h2>
        <ul id="filters" class="clearfix">
            <li>
                <span class="filter active" data-filter="app card web ">All</span>
            </li>
            <li>
                <span class="filter" data-filter="app">app</span>
            </li>
            <li>
                <span class="filter" data-filter="card ">card</span>
            </li>
            <li>
                <span class="filter" data-filter="app card ">app card</span>
            </li>
            <li>
                <span class="filter" data-filter="web">web</span>
            </li>
        </ul>
        <div id="portfoliolist">
            <div class="portfolio app" data-cat="app">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p1.jpg"><img src="${ctxWeb}/framework/images/p1.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">app1</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio app" data-cat="app">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p2.jpg"><img src="${ctxWeb}/framework/images/p2.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">app2</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio web" data-cat="web">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p3.jpg"><img src="${ctxWeb}/framework/images/p3.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">web3</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio card" data-cat="card">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p4.jpg"><img src="${ctxWeb}/framework/images/p4.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">card4</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio app" data-cat="app">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p5.jpg"><img src="${ctxWeb}/framework/images/p5.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">app5</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio card" data-cat="card">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p6.jpg"><img src="${ctxWeb}/framework/images/p6.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">card6</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio card" data-cat="card">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p7.jpg"><img src="${ctxWeb}/framework/images/p7.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">card7</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio web" data-cat="web">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p8.jpg"><img src="${ctxWeb}/framework/images/p8.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">web8</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio app" data-cat="app">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p9.jpg"><img src="${ctxWeb}/framework/images/p9.jpg" alt=""
                                                                                class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">app9软件</span>
                        </div>
                        <div class="label-bg">app9软件</div>
                    </div>
                </div>
            </div>
            <div class="portfolio card" data-cat="card">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p10.jpg"><img src="${ctxWeb}/framework/images/p10.jpg" alt=""
                                                                                 class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">card10</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<%--底部说明--%>
<jsp:include page="footer.jsp"/>
</body>
</html>
