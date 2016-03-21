<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/3 0003
  Time: 上午 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>

    <%@ include file="header.jsp" %>

    <title>声娱传媒.联系我们</title>
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
    <jsp:param name="title" value="contact.jsp"/>
</jsp:include>


<div class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>联系 我们</h1></li>
            <li class="about_head-right"><p>联系我们简介</p></li>
        </ul>
    </div>
</div>
<div class="container">
    <div class="blog">
        <div class="col-md-6 contact_left">
            <h2>Contact Details</h2>
            <img src="${ctxWeb}/framework/images/contact.jpg" class="img-responsive" alt=""/>

            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
            <ul class="address">
                <i class="location"> </i>
                <li class="address_desc">
                    <h5>standard dummy text ever since</h5>
                </li>
                <div class="clearfix"></div>
            </ul>
            <ul class="address">
                <i class="phone"> </i>
                <li class="address_desc">
                    <h5>+215-5487-5487</h5>
                </li>
                <div class="clearfix"></div>
            </ul>
            <ul class="address">
                <i class="msg"> </i>
                <li class="address_desc">
                    <h5><a href="malito:mail@demolink.org">mail(at)uibrush.com</a></h5>
                </li>
                <div class="clearfix"></div>
            </ul>
        </div>
        <div class="col-md-6 contact_right">
            <h2>Write to us</h2>

            <form>
                <div class="column_2">
                    <input type="text" class="text" value="Name" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Name';}">
                    <input type="text" class="text" value="Email" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Email';}" style="margin-left:2.7%">
                </div>
                <div class="column_1">
                    <input type="text" class="text" value="Subject" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = 'Subject';}">
                </div>
                <div class="column_3">
                    <textarea value="Message" onfocus="this.value = '';"
                              onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
                </div>
                <div class="form-submit1">
                    <label class="btn btn-primary btn-normal btn-inline " target="_self"><input type="submit"
                                                                                                value="Submit"></label>
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<%--底部说明--%>
<jsp:include page="footer.jsp"/>

</body>
</html>
