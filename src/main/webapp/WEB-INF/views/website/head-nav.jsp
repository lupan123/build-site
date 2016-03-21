<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/1 0001
  Time: 下午 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<% String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();%>--%>

<div class="header">
  <div class="container">
    <div class="logo">
      <a href="index.jsp"><img src="${ctxWeb}/framework/images/shengyu_logo.jpg" alt="声娱"><span style="color:#a60000;">声</span><span style="color: #105b63;">娱传媒</span></a>
    </div>
    <div class="menu">
      <a class="toggleMenu" href="#"><img src="${ctxWeb}/framework/images/menu.png" alt=""/> </a>
      <ul class="nav" id="nav">
        <li><a href="${ctxWebSite}/site/goTo/index">主 页</a></li>
        <li><a href="${ctxWebSite}/site/goTo/about">人 物</a></li>
        <li><a href="${ctxWebSite}/site/page/news">动 态</a></li>
        <li><a href="${ctxWebSite}/site/page/omnibus">精选 专辑</a></li>
        <li><a href="${ctxWebSite}/site/page/samples">样音 试听</a></li>
        <li><a href="${ctxWebSite}/site/goTo/contact">联系 我们</a></li>
      </ul>
    </div>
    <script>
      <%--alert($("#nav li a[href='${param.title}']").attr("href"));--%>
      /**
       *添加选中样式
       */
      $("#nav li a[href='${param.title}']").parent().addClass("current");

    </script>
    <div class="clearfix"></div>
    <!----//End-top-nav---->
  </div>
</div>
