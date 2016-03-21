<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <c:set var="ctxWeb" value="${pageContext.request.contextPath}"/>
  <title>样音播放</title>
  <link rel="stylesheet" href="${ctxWeb}/framework/plugins/audio-player/css/_reset.css" />
  <link rel="stylesheet" href="${ctxWeb}/framework/plugins/audio-player/css/main.css" />
  <link rel="stylesheet" href="${ctxWeb}/framework/plugins/audio-player/css/lanrenzhijia.css" />
</head>
<body>
<div id="wrapper">
  <h1>${content.h1}</h1>
  <audio preload="auto"  preload="auto" controls autoplay >
    <source src="${content.file}" />
    <%--<source src="audio.ogg" />--%>
    <%--<source src="audio.wav" />--%>
  </audio>
</div>
<script src="${ctxWeb}/framework/plugins/audio-player/js/main.js"></script>
<script src="${ctxWeb}/framework/plugins/audio-player/js/audioplayer.js"></script>
<script>
  $( function(){
    $( 'audio' ).audioPlayer(
            {classPrefix: 'audioplayer',
              strPlay: '播放',
              strPause: '暂停',
              strVolume: '音量'}
    );
  });
</script>
</body>
</html>
