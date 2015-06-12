<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${plugin}/bootstrap/css/bootstrap.css" type="text/css"></link>
		<link rel="stylesheet" href="${style}/common.css" type="text/css"></link>
		
		<script type="text/javascript" src="${script}/jquery.js"></script>
		<title>error</title>
	</head>
	<body>
		<div class="pl-1p">
			<h1 >服务器出现错误！</h1>
			<h3>${s}--${sr}</h3>
			${ex}&nbsp;:&nbsp;
			${exMsg}<br/>
		</div>
		<div class="bar"></div>
		<div class="clear"></div>
		<ul class="nav nav-tabs pl-1p" >
			<li role="presentation" class="active"><a href="javascript:;" class="p">展开</a></li>
			<li role="presentation" ><a href="javascript:;" class="p">以下信息提供给技术人员</a></li>
		</ul>
		<div id="exception" class="exception h">
			<c:forEach items="${e}" var="item">
				${item}<br/>
			</c:forEach>
		</div>
<script type="text/javascript">
$(document).ready(
	function(){
		$(".nav").on("click",function(){$('#exception').toggle(1000,function(){$(".active > a").html($(".active > a").html()=="收起"?"展开":"收起");})});
	}
)
</script>
	</body>
</html>