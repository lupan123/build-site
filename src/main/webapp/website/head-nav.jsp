<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header">
  <div class="container">
    <div class="logo">
      <a href="index.jsp"><img src="${ctxWeb}/framework/images/shengyu_logo.jpg" alt="声娱"><span style="color:#a60000;">声</span><span style="color: #105b63;">娱传媒</span></a>
    </div>
    <div class="menu">
      <a class="toggleMenu" href="#"><img src="${ctxWeb}/framework/images/menu.png" alt=""/> </a>
      <ul class="nav" id="nav">
        <li><a href="index.jsp">主 页</a></li>
        <li><a href="about.jsp">人 物</a></li>
        <li><a href="news.jsp">动 态</a></li>
        <li><a href="omnibus.jsp">精选 专辑</a></li>
        <li><a href="samples.jsp">样音 试听</a></li>
        <li><a href="contact.jsp">联系 我们</a></li>
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
