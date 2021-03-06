﻿<!DOCTYPE html>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 百度地图api css-->
		<style type="text/css">
			.demo{width:850px;margin:20px auto;}
			#l-map{height:400px;width:600px;float:left;border:1px solid #bcbcbc;}
			#r-result{height:400px;width:230px;float:right;}
		</style>
		<script type="text/javascript" src="js/jquery.js"></script>
		<!-- 百度地图api js-->
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
		<script type="text/javascript">
			$(function() {			
				//topbar 单击样式
				$(".topbar li a").click(function(){
					$(this).css("color", "#0153a5");
					$(this).parent().siblings().find("a").css("color", "#666");
				});
				
				//鼠标经过列表样式
				$(".left_ul li").hover (
					function(){
						$(this).addClass("li_click_b");
					},
					function(){
						$(this).removeClass("li_click_b");
					}
				);
			});
			
		</script>
	</head>
	<body>
		<div class="main">
			<div class="header">
				<div class="help">
					<a href="">联系我们</a> | 
					<a href="">站点帮助</a> | 
					<a href="">问题反馈</a> 
				</div>
			</div>
			<div class="topbar">
				<ul>
					<li><a href="index.html">首页</a></li>
					<li><a href="about.html">公园简介</a></li>
					<li><a href="news.html">新闻动态</a></li>
					<li><a href="show.html">图片墙</a></li>
					<li><a href="map.html" class="clicked" >详细地址</a></li>
					<li><a>图片展示</a></li>
					<li><a>联系我们</a></li>
					<li><a>学习资料</a></li>
					<li><a>搞笑图片</a></li>
				</ul>
			</div>
			<!-- 好像只有添加iframe才能使头部独立成一个文件来处理，而且使用js给导航栏添加单击样式
			<iframe name="contain" width="100%" height="100%"></iframe>
			-->
			<div class="content">
				<div class="bar">
					<img src="images/bar4.jpg" />
				</div>
				<div class="int">
					<div class="demo">
						<p style="height:40px;">
							输入城市：<input id="txtCity" type="text" value="千湖国家湿地公园" />  
							<button  onClick="getPoint()">获取坐标</button> 
							<!-- 坐标：<input id="txtPoint" type="text"/> -->
						</p>
						<div id="l-map"></div>
						<div id="r-result"></div>
						<div style="clear: both"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<p class="address">地址：陕西省宝鸡市千阳县南寨镇闫家村五组27号</p>
			<p>张旭超个人版权所有</p>
		</div>
		<p style="text-align: center">
			来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
		</p>
		<!-- 百度地图api设置 -->
		<script type="text/javascript">
			// 百度地图API功能	
			var map = new BMap.Map("l-map");            // 创建Map实例
			var point = new BMap.Point(107.13, 34.65);
			map.centerAndZoom(point, 15);
			var marker = new BMap.Marker(point);  // 创建标注
			map.addOverlay(marker);               // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			
			map.enableScrollWheelZoom();
			var local = new BMap.LocalSearch("全国", {
				renderOptions: {
					map: map,
					panel : "r-result",
					autoViewport: true,
					selectFirstResult: false
				}
			});
			
			map.addEventListener("click",function(e){
				document.getElementById("txtPoint").value=e.point.lng + "," + e.point.lat;
			});
			function getPoint(){
				var city = document.getElementById("txtCity").value; // 初始化地图,设置城市和地图级别。
				local.search(city);     //启用滚轮放大缩小                                     
			}
		</script>
	</body>
</html>	