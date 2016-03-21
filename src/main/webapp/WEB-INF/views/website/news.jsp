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
    <meta name="keywords" content=""/>

    <script type="application/x-javascript">
        addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
    <script type="text/javascript">
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<%--头部导航页面--%>
<%@include file="head-nav.jsp" %>

<div id="news_intro" class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>公司 动态</h1></li>
            <c:forEach items="${news_intro}" var="content">
            <li class="about_head-right"><p>${content.intro}</p></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div id="news_article_page" class="container">
    <div class="blog">
        <div class="col-md-9">
            <c:forEach items="${news_article_page.list}" var="content" varStatus="status">
                <div id="article-${status.index}" class="blog_left">
                    <h3>${content.h1}</h3>
                    <ul class="blog_links">
                        <li><i class="blog_icon1"> </i>
                            <span><fmt:formatDate pattern="yyyy年MM月dd日 HH:mm:ss" value="${content.createDate}"/></span>
                        </li>
                        /
                        <li><a href="#"><i class="blog_icon2"> </i><span>内容关键字</span></a></li>
                        /
                        <li><a href="#"><i class="blog_icon3"> </i><span>作者</span></a></li>
                        /
                        <li><a href="#"><i class="blog_icon4"> </i><span>评论数</span></a></li>
                    </ul>
                    <a href="single.html"><img src="${content.image}" class="img-responsive" alt=""/></a>

                    <p>${contetn.intro}</p>
                    <a href="#" title="Read More" class="btn3" target="_self">更多...</a>
                </div>
            </c:forEach>
            <div id="pagination-div" class="pagination"></div>
            <script type="application/javascript">
                var pageNo = ${news_article_page.pageNo};
                var pageSize = ${news_article_page.last};
                $('#pagination-div').twbsPagination({
                    totalPages: pageSize,
                    startPage:pageNo,
                    visiblePages: 10,
                    first: "第一页",
                    prev: "上一页",
                    next: "下一页",
                    last: "最后一页",
                    onPageClick: function (event, page) {
                        window.page(page,10);
                    }
                });
            </script>
        </div>
        <%--<div class="col-md-3 sidebar" style="position: fixed; top: 283px;left:70%;min-bottom:300px;">--%>
        <div class="col-md-3 sidebar">
            <div class="sidebar_top">
                <h3>动态 搜索</h3>

                <div class="search">
                    <%--<form>--%>
                    <form:form id="searchForm" modelAttribute="content" action="${ctx}/site/page/news" method="post">
                        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                        <input type="text" name="h1" placeholder="请输入动态标题...">
                        <input id="btnSubmit" type="submit" value="">
                    </form:form>
                    <%--</form>--%>
                </div>
            </div>
            <div class="sidebar_top">
                <h3>动态 档案</h3>
                <ul class="list_3">
                    <c:forEach items="${news_article_page.list}" var="content" varStatus="status">
                        <li><a href="#article-${status.index}">
                            <div class="product_no">
                                <p>${content.h1} &nbsp;&nbsp; <span class="pull-right"><fmt:formatDate pattern="MM月dd日"
                                                                                                       value="${content.createDate}"/></span>
                                </p>
                            </div>
                            <div class="product_no-right">
                            </div>
                            <div class="clearfix"></div>
                        </a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="sidebar_top">
                <h3>图片 画廊</h3>
                <ul class="gallery">
                    <c:forEach items="${news_article_page.list}" var="content">
                        <li><img src="${content.image}" class="img-responsive" alt=""/></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
