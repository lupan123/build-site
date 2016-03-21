<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/1 0001
  Time: 下午 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="header.jsp" %>

    <title>声娱传媒.动态</title>
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
</head>
<body>
<%--头部导航页面--%>
<jsp:include page="head-nav.jsp">
    <jsp:param name="title" value="news.jsp"/>
</jsp:include>

<div class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>公司 动态</h1></li>
            <li class="about_head-right"><p>公司动态，合作伙伴动态，员工心情随笔等。</p></li>
        </ul>
    </div>
</div>
<div class="container">
    <div class="blog">
        <div class="col-md-9">
            <div class="blog_left">
                <h3>动态标题1</h3>
                <ul class="blog_links">
                    <li><i class="blog_icon1"> </i><span>创建时间</span></li>
                    /
                    <li><a href="#"><i class="blog_icon2"> </i><span>内容关键字</span></a></li>
                    /
                    <li><a href="#"><i class="blog_icon3"> </i><span>作者</span></a></li>
                    /
                    <li><a href="#"><i class="blog_icon4"> </i><span>评论数</span></a></li>
                </ul>
                <a href="single.html"><img src="${ctxWeb}/framework/images/b1.jpg" class="img-responsive" alt=""/></a>

                <p>动态内容</p>
                <a href="#" title="Read More" class="btn3" target="_self">更多...</a>
            </div>
            <div class="blog_left">
                <h3>Lorem ipsum dolor sit amet consectetuer adipiscing elit</h3>
                <ul class="blog_links">
                    <li><i class="blog_icon1"> </i><span>13 th March 2015</span></li>
                    /
                    <li><a href="#"><i class="blog_icon2"> </i><span>Html, Seo</span></a></li>
                    /
                    <li><a href="#"><i class="blog_icon3"> </i><span>UIBrush</span></a></li>
                    /
                    <li><a href="#"><i class="blog_icon4"> </i><span>7 Comments</span></a></li>
                </ul>
                <a href="single.html"><img src="${ctxWeb}/framework/images/b2.jpg" class="img-responsive" alt=""/></a>

                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                    laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                    ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure
                    dolor in hendrerit.</p>
                <a href="#" title="Read More" class="btn3" target="_self">Read More...</a>
            </div>
            <div class="blog_left blog_last">
                <h3>Lorem ipsum dolor sit amet consectetuer adipiscing elit</h3>
                <ul class="blog_links">
                    <li><i class="blog_icon1"> </i><span>13 th March 2015</span></li>
                    /
                    <li><a href="#"><i class="blog_icon2"> </i><span>Html, Seo</span></a></li>
                    /
                    <li><a href="#"><i class="blog_icon3"> </i><span>UIBrush</span></a></li>
                    /
                    <li><a href="#"><i class="blog_icon4"> </i><span>7 Comments</span></a></li>
                </ul>
                <a href="single.html"><img src="${ctxWeb}/framework/images/b3.jpg" class="img-responsive" alt=""/></a>

                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                    laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                    ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure
                    dolor in hendrerit.</p>
                <a href="#" title="Read More" class="btn3" target="_self">Read More...</a>
            </div>
        </div>
        <div class="col-md-3 sidebar">
            <div class="sidebar_top">
                <h3>动态 搜索</h3>

                <div class="search">
                    <form>
                        <input type="text" value="输入收缩内容..." onfocus="this.value='';"
                               onblur="if (this.value == '') {this.value ='';}">
                        <input type="submit" value="">
                    </form>
                </div>
            </div>
            <div class="sidebar_top">
                <h3>动态 档案</h3>
                <ul class="list_3">
                    <li><a href="#">
                        <div class="product_no"><p>二月 2015</p></div>
                        <div class="product_no-right"></div>
                        <div class="clearfix"></div>
                    </a></li>
                    <li><a href="#">
                        <div class="product_no"><p>六月 2015</p></div>
                        <div class="product_no-right"></div>
                        <div class="clearfix"></div>
                    </a></li>
                    <li><a href="#">
                        <div class="product_no"><p>十月 2014</p></div>
                        <div class="product_no-right"></div>
                        <div class="clearfix"></div>
                    </a></li>
                    <li><a href="#">
                        <div class="product_no"><p>十一月 2014</p></div>
                        <div class="product_no-right"></div>
                        <div class="clearfix"></div>
                    </a></li>
                    <li><a href="#">
                        <div class="product_no"><p>十月 2015</p></div>
                        <div class="product_no-right"></div>
                        <div class="clearfix"></div>
                    </a></li>
                </ul>
            </div>
            <div class="sidebar_top">
                <h3>图片 画廊</h3>
                <ul class="gallery">
                    <li><img src="${ctxWeb}/framework/images/g1.jpg" class="img-responsive" alt=""/></li>
                    <li><img src="${ctxWeb}/framework/images/g2.jpg" class="img-responsive" alt=""/></li>
                    <li class="last"><img src="${ctxWeb}/framework/images/g3.jpg" class="img-responsive" alt=""/></li>
                </ul>
                <ul class="gallery">
                    <li><img src="${ctxWeb}/framework/images/g4.jpg" class="img-responsive" alt=""/></li>
                    <li><img src="${ctxWeb}/framework/images/g5.jpg" class="img-responsive" alt=""/></li>
                    <li class="last"><img src="${ctxWeb}/framework/images/g6.jpg" class="img-responsive" alt=""/></li>
                </ul>
                <ul class="gallery">
                    <li><img src="${ctxWeb}/framework/images/g7.jpg" class="img-responsive" alt=""/></li>
                    <li><img src="${ctxWeb}/framework/images/g8.jpg" class="img-responsive" alt=""/></li>
                    <li class="last"><img src="${ctxWeb}/framework/images/g9.jpg" class="img-responsive" alt=""/></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
