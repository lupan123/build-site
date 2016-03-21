<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
    <jsp:param name="title" value="index.jsp"/>
</jsp:include>

<%--轮播图片--%>
<div class="banner">
    <div class="banner_container">
        <div class="slider-wrapper theme-light">
            <div id="slider" class="nivoSlider">
                <img src="${ctxWeb}/framework/images/slice1.jpg" data-thumb="images/slice1.jpg" alt=""/> <a href="#"><img
                    src="${ctxWeb}/framework/images/slice2.jpg" data-thumb="images/slice1.jpg" alt="" title=""/></a> <img
                    src="${ctxWeb}/framework/images/slice3.jpg" data-thumb="images/slice3.jpg" alt=""
                    data-transition="slideInLeft"/>
                <img src="${ctxWeb}/framework/images/slice4.jpg" data-thumb="images/slice4.jpg" alt="" title="#htmlcaption"/>
                <!-- 				<img src="view/public/resource/img/1.png" alt="" title="好漂亮的狗狗..." /> <a href="http://www.helloweba.com"><img src="view/public/resource/img/2.png" alt="" title="图片标题" /></a> <img src="view/public/resource/img/3.png" alt="" title="#htmlcaption" /> -->
            </div>
            <div id="htmlcaption" class="nivo-html-caption">轮播图片说明</div>
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
<div class="portfolio_main">
    <div class="container">
        <!-- 	<h4>活动 照片</h4> -->
        <h3 class="subhead">活动照片</h3>
        <ul id="filters" class="clearfix">
            <li><span class="filter active" data-filter="app card icon web">所有活动照片</span></li>
            <li><span class="filter" data-filter="app  icon">分类1</span></li>
            <li><span class="filter" data-filter="card ">分类2</span></li>
            <li><span class="filter" data-filter="icon app card ">分类3</span></li>
            <li><span class="filter" data-filter="web card icon">分类4</span></li>
        </ul>
        <div id="portfoliolist">
            <div class="portfolio logo1" data-cat="logo">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p1.jpg"><img src="${ctxWeb}/framework/images/p1.jpg" alt=""
                                                                                    class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">图片1</span>
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
                            <span class="text-category">图片2</span>
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
                            <span class="text-category">图片3</span>
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
                            <span class="text-category">图片4</span>
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
                            <span class="text-category">图片5</span>
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
                            <span class="text-category">图片6</span>
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
                            <span class="text-category">图片7</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio logo1" data-cat="web">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p8.jpg"><img src="${ctxWeb}/framework/images/p8.jpg" alt=""
                                                                                    class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">图片8</span>
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
                            <span class="text-category">图片9</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="portfolio card" data-cat="card">
                <div class="portfolio-wrapper">
                    <div class="fancyDemo">
                        <a rel="group" title="" href="${ctxWeb}/framework/images/p10.jpg"><img src="${ctxWeb}/framework/images/p10.jpg"
                                                                                     alt=""
                                                                                     class="img-responsive"/></a>
                    </div>
                    <div class="label">
                        <div class="label-text">
                            <span class="text-category">图片10</span>
                        </div>
                        <div class="label-bg"></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>


<div class="features-grids text-center">
    <div class="container">
        <!-- 		<h4>推荐 作品</h4> -->
        <h3 class="subhead" id="omnibusHead">推荐作品</h3>
        <div class="col-xs-6 col-sm-4 col-md-3  features-grid">
            <div class="works">
                <div class="pos-rlt">
                    <div class="item-overlay opacity r r-2x bg-black">
                        <div class="text-info padder m-t-sm text-sm">
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                class="fa fa-star"></i> <i class="fa fa-star-o text-muted"></i>
                        </div>
                        <div class="center text-center m-t-n">
                            <a href="#"><i class="icon-control-play i-2x"></i></a>
                        </div>
                        <div class="bottom padder m-b-sm">
                            <a href="#" class="pull-right"> <i class="fa fa-heart-o"></i>
                            </a> <a href="#"> <i class="fa fa-plus-circle"></i>
                        </a>
                        </div>
                    </div>
                    <a href="#"><img src="${ctxWeb}/framework/images/music1.jpg" alt="" class="r r-2x img-full"></a>
                </div>
                <div class="mark">
                    <a href="#" class="name">精选1</a>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3  features-grid">
            <div class="works">
                <div class="works-cover">
                    <div class="works-overlay">
                        <div class="center text-center">
                            <a href="#"><i class="icon-control-play"></i></a>
                        </div>
                    </div>
                    <a href="#"><img src="${ctxWeb}/framework/images/music2.jpg" alt="" class="r r-2x img-full"></a>
                </div>
                <div class="mark">
                    <a href="#" class="name">精选2</a>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3  features-grid">
            <div class="works">
                <div class="pos-rlt">
                    <div class="item-overlay opacity r r-2x bg-black">
                        <div class="text-info padder m-t-sm text-sm">
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                class="fa fa-star"></i> <i class="fa fa-star-o text-muted"></i>
                        </div>
                        <div class="center text-center m-t-n">
                            <a href="#"><i class="icon-control-play i-2x"></i></a>
                        </div>
                        <div class="bottom padder m-b-sm">
                            <a href="#" class="pull-right"> <i class="fa fa-heart-o"></i>
                            </a> <a href="#"> <i class="fa fa-plus-circle"></i>
                        </a>
                        </div>
                    </div>
                    <a href="#"><img src="${ctxWeb}/framework/images/music3.jpg" alt="" class="r r-2x img-full"></a>
                </div>
                <div class="mark">
                    <a href="#" class="name">精选3</a>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3  features-grid">
            <div class="works">
                <div class="pos-rlt">
                    <div class="item-overlay opacity r r-2x bg-black">
                        <div class="text-info padder m-t-sm text-sm">
                            <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                class="fa fa-star"></i> <i class="fa fa-star-o text-muted"></i>
                        </div>
                        <div class="center text-center m-t-n">
                            <a href="#"><i class="icon-control-play i-2x"></i></a>
                        </div>
                        <div class="bottom padder m-b-sm">
                            <a href="#" class="pull-right"> <i class="fa fa-heart-o"></i>
                            </a> <a href="#"> <i class="fa fa-plus-circle"></i>
                        </a>
                        </div>
                    </div>
                    <a href="#"><img src="${ctxWeb}/framework/images/music4.jpg" alt="" class="r r-2x img-full"></a>
                </div>
                <div class="mark">
                    <a href="#" class="name">精选4</a>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="business-grids text-center">
    <div class="container">
        <div class="col-xs-6 col-sm-4 col-md-3  business-grid">
            <span> </span>

            <h3>公司业务1</h3>

            <p>业务描述</p>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3  business-grid">
            <span class="f-icon1"> </span>

            <h3>公司业务2</h3>

            <p>业务描述</p>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3  business-grid">
            <span class="f-icon2"> </span>

            <h3>公司业务3</h3>

            <p>业务描述</p>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3  business-grid">
            <span class="f-icon3"> </span>

            <h3>公司业务4</h3>

            <p>业务描述</p>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<%--底部说明--%>
<jsp:include page="footer.jsp"/>

</body>
</html>
