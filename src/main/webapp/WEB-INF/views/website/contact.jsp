
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>

    <%@ include file="header.jsp" %>

    <title>声娱传媒.联系我们</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

</head>
<body>
<%--头部导航页面--%>
<%@include file="head-nav.jsp" %>


<div id="contact_intro" class="about">
    <div class="container">
        <ul class="about_head">
            <li class="about_head-left"><h1>联系 我们</h1></li>
            <c:forEach items="${contact_intro}" var="content">
                <li class="about_head-right"><p>联系我们简介</p></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="container">
    <div  class="blog">
        <div id="contact_detail" class="col-md-6 contact_left">
            <h2>联系 详细</h2>
            <c:forEach items="${contact_detail}" var="content">
                <img src="${content.image}" class="img-responsive" alt=""/>

                <p>${content.intro}</p>
            </c:forEach>

            <c:forEach items="${contact_address}" var="content">
                <ul id="contact_address" class="address">
                    <i class="location"> </i>
                    <li class="address_desc">
                        <h5>${content.intro}</h5>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </c:forEach>

            <c:forEach items="${contact_phone}" var="content">
                <ul id="contact_phone" class="address">
                    <i class="phone"> </i>

                    <li class="address_desc">
                        <h5>${content.intro}</h5>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </c:forEach>
            <c:forEach items="${contact_email}" var="content">
                <ul id="contact_email" class="address">
                    <i class="msg"> </i>
                    <li class="address_desc">
                        <h5><a href="#">${content.intro}</a></h5>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </c:forEach>
        </div>

        <div class="col-md-6 contact_right">
            <h2>向我们来信</h2>

            <form>
                <div class="column_2">
                    <input type="text" class="text" value="姓名" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = '姓名';}">
                    <input type="text" class="text" value="邮箱" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = '邮箱';}" style="margin-left:2.7%">
                </div>
                <div class="column_1">
                    <input type="text" class="text" value="职业" onfocus="this.value = '';"
                           onblur="if (this.value == '') {this.value = '职业';}">
                </div>
                <div class="column_3">
        <textarea value="内容" onfocus="this.value = '';"
                  onblur="if (this.value == '') {this.value = '内容';}">内容</textarea>
                </div>
                <div class="form-submit1">
                    <label class="btn btn-primary btn-normal btn-inline " target="_self">
                        <input type="submit" value="提交">
                    </label>
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<%--底部说明--%>
<%@ include file="footer.jsp" %>

</body>
</html>
