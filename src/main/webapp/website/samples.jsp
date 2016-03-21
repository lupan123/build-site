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
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Uibrush Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>

<%--头部导航页面--%>
<jsp:include page="head-nav.jsp">
  <jsp:param name="title" value="samples.jsp"/>
</jsp:include>

<div class="about">
  <div class="container">
    <ul class="about_head">
      <li class="about_head-left"><h1>样音 试听</h1></li>
      <li class="about_head-right"><p>样音试听简介</p></li>
    </ul>
  </div>
</div>
<div class="container">
  <div class="about_top">
    <div class="col-md-6 box_6">
      <img src="${ctxWeb}/framework/images/services.jpg" class="img-responsive" alt=""/>
    </div>
    <div class="col-md-6 about_top-right">
      <h2>Our Services</h2>
      <p>
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

      <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.</p>
    </div>
    <div class="clearfix"> </div>
  </div>
  <div class="service_grid1">
    <div class="service_top">
      <div class="col-md-4">
        <ul class="service_grid">
          <i class="s1"> </i>
          <li class="service_grid-right">
            <h3>Photo Shop</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
          </li>
          <div class="clearfix"> </div>
        </ul>
      </div>
      <div class="col-md-4">
        <ul class="service_grid">
          <i class="s2"> </i>
          <li class="service_grid-right">
            <h3>Html 5</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
          </li>
          <div class="clearfix"> </div>
        </ul>
      </div>
      <div class="col-md-4">
        <ul class="service_grid">
          <i class="s3"> </i>
          <li class="service_grid-right">
            <h3>Css 3</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
          </li>
          <div class="clearfix"> </div>
        </ul>
      </div>
      <div class="clearfix"> </div>
    </div>
    <div class="service_bottom">
      <div class="col-md-4">
        <ul class="service_grid">
          <i class="s4"> </i>
          <li class="service_grid-right">
            <h3>Wordpress</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
          </li>
          <div class="clearfix"> </div>
        </ul>
      </div>
      <div class="col-md-4">
        <ul class="service_grid">
          <i class="s5"> </i>
          <li class="service_grid-right">
            <h3>Joomla</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
          </li>
          <div class="clearfix"> </div>
        </ul>
      </div>
      <div class="col-md-4">
        <ul class="service_grid">
          <i class="s6"> </i>
          <li class="service_grid-right">
            <h3>Seo</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
          </li>
          <div class="clearfix"> </div>
        </ul>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>

<%--底部说明--%>
<jsp:include page="footer.jsp"/>

</body>
</html>
