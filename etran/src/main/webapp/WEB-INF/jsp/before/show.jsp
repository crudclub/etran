﻿<!DOCTYPE html>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 图片浏览插件css -->
		<link rel="stylesheet" type="text/css" href="css/show.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<!-- 图片浏览插件js开始 -->
		<script type="text/javascript" src="js/base.js"></script>
		<script type="text/javascript" src="js/scrollImg.js"></script>
		<!-- 图片浏览插件js结束 -->
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
			//图片浏览器插件
			myAddEvent(window,'load',scrollImg);
			function scrollImg(){
				var aPicList=getByClass(document,'pic-list');
				var i=0;
				function next(){
					if(i<aPicList.length){
						new ScrollImg(aPicList[i]);
						timer=setTimeout(next, 1000);
					}
					i++;
				}
				next();
			}
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
					<li><a class="clicked" href="show.html">图片墙</a></li>
					<li><a href="map.html">详细地址</a></li>
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
					<img src="images/bar3.jpg" />
				</div>
				<div class="int">
					<div class="scrollbox">
						<div class="pic-list">
							<ul class="wrap">
								<li class="picture"><a href="#"><img alt="97站长网" src="img/T1z_LkXfdpXXaGP9rV-164-164.jpg" width="164" height="164" /><em>97站长网</em></a></li>
								<li class="picture"><a href="#"><img alt="请叫我羊驼先生" src="img/T1NTfkXmdoXXaGP9rV-164-164.jpg" width="164" height="164" /><em>请叫我羊驼先生</em></a></li>
								<li class="picture"><a href="#"><img alt="又到一年粽叶香" src="img/T18UnkXn4mXXaGP9rV-164-164.jpg" width="164" height="164" /><em>又到一年粽叶香</em></a></li>
								<li class="picture"><a href="#"><img alt="一毕业就结婚" src="img/T1sUrlXkXhXXaGP9rV-164-164.jpg" width="164" height="164" /><em>一毕业就结婚</em></a></li>
								<li class="picture"><a href="#"><img alt="小资最爱mini窝" src="img/T1jCLgXaBuXXaGP9rV-164-164.jpg" width="164" height="164" /><em>小资最爱mini窝</em></a></li>
								<li class="picture"><a href="#"><img alt="人尽可帽相！" src="img/T1VQjmXjBcXXaGP9rV-164-164.jpg" width="164" height="164" /><em>人尽可帽相！</em></a></li>
								<li class="picture"><a href="#"><img alt="除了二还有爱" src="img/T1HhjmXmJjXXaGP9rV-164-164.jpg" width="164" height="164" /><em>除了二还有爱</em></a></li>
								<li class="picture"><a href="#"><img alt="锋芝恋被曝复合" src="img/T1Sh_mXi0eXXaGP9rV-164-164.jpg" width="164" height="164" /><em>锋芝恋被曝复合</em></a></li>
								<li class="picture"><a href="#"><img alt="夏天别穿背背佳" src="img/T1MdLmXfFfXXaGP9rV-164-164.jpg" width="164" height="164" /><em>夏天别穿背背佳</em></a></li>
								<li class="picture"><a href="#"><img alt="如果真有海角天涯" src="img/T1siLmXkJgXXaGP9rV-164-164.jpg" width="164" height="164" /><em>如果真有海角天涯</em></a></li>        
							</ul>
						</div>
						<div class="pic-list">
							<ul class="wrap">
								<li class="picture"><a href="#"><img alt="当时我就震惊了" src="img/T1BgYlXhFnXXaGP9rV-164-164.jpg" width="164" height="164" /><em>当时我就震惊了</em></a></li>
								<li class="picture"><a href="#"><img alt="糖果色夏日美甲" src="img/T1XrDnXbVaXXaGP9rV-164-164.jpg" width="164" height="164" /><em>糖果色夏日美甲</em></a></li>
								<li class="picture"><a href="#"><img alt="欧美夏日潮搭" src="img/T1sSPmXeJbXXaGP9rV-164-164.jpg" width="164" height="164" /><em>欧美夏日潮搭</em></a></li>
								<li class="picture"><a href="#"><img alt="开心时记得笑" src="img/T1CN2lXcRnXXaGP9rV-164-164.jpg" width="164" height="164" /><em>开心时记得笑</em></a></li>
								<li class="picture"><a href="#"><img alt="夏天最爱睡地毯" src="img/T1nffmXfBhXXaGP9rV-164-164.jpg" width="164" height="164" /><em>夏天最爱睡地毯</em></a></li>
								<li class="picture"><a href="#"><img alt="007裸体冰激凌" src="img/T1t2jlXfVkXXaGP9rV-164-164.jpg" width="164" height="164" /><em>007裸体冰激凌</em></a></li>
								<li class="picture"><a href="#"><img alt="世上最帅100张脸" src="img/T1UWHhXopuXXaGP9rV-164-164.jpg" width="164" height="164" /><em>世上最帅100张脸</em></a></li>
								<li class="picture"><a href="#"><img alt="做没心没肺的一对" src="img/T1Dk2lXfXkXXaGP9rV-164-164.jpg" width="164" height="164" /><em>做没心没肺的一对</em></a></li>
								<li class="picture"><a href="#"><img alt="我的宠物叫笑笑" src="img/T1UyrmXhxbXXaGP9rV-164-164.jpg" width="164" height="164" /><em>我的宠物叫笑笑</em></a></li>
								<li class="picture"><a href="#"><img alt="烟雨江南几时休" src="img/T1DfzmXj4hXXaGP9rV-164-164.jpg" width="164" height="164" /><em>烟雨江南几时休</em></a></li>    
							</ul>
						</div>
						<div class="pic-list">
							<ul class="wrap">
								<li class="picture"><a href="#"><img alt="有处仙境叫希腊" src="img/T1vWLlXlRqXXaGP9rV-164-164.jpg" width="164" height="164" /><em>有处仙境叫希腊</em></a></li>
								<li class="picture"><a href="#"><img alt="甜蜜情侣街头装" src="img/T1nyYlXflnXXaGP9rV-164-164.jpg" width="164" height="164" /><em>甜蜜情侣街头装</em></a></li>
								<li class="picture"><a href="#"><img alt="晃晃悠悠梦一场" src="img/T1UOrlXg0nXXaGP9rV-164-164.jpg" width="164" height="164" /><em>晃晃悠悠梦一场</em></a></li>
								<li class="picture"><a href="#"><img alt="我是水果店捡来的" src="img/T1x4TmXcxfXXaGP9rV-164-164.jpg" width="164" height="164" /><em>我是水果店捡来的</em></a></li>
								<li class="picture"><a href="#"><img alt="贾斯汀携子走红毯" src="img/T1VFPlXXVrXXaGP9rV-164-164.jpg" width="164" height="164" /><em>贾斯汀携子走红毯</em></a></li>
								<li class="picture"><a href="#"><img alt="花朵草编休闲包" src="img/T1Z0zmXnFeXXaGP9rV-164-164.jpg" width="164" height="164" /><em>花朵草编休闲包</em></a></li>
								<li class="picture"><a href="#"><img alt="你是我的眼！" src="img/T1upLmXadiXXaGP9rV-164-164.jpg" width="164" height="164" /><em>你是我的眼！</em></a></li>
								<li class="picture"><a href="#"><img alt="百变发型DIY" src="img/T1j2HlXkRkXXaGP9rV-164-164.jpg" width="164" height="164" /><em>百变发型DIY</em></a></li>
								<li class="picture"><a href="#"><img alt="褪了色的一个梦" src="img/T1SmYgXeRwXXaGP9rV-164-164.jpg" width="164" height="164" /><em>褪了色的一个梦</em></a></li>
								<li class="picture"><a href="#"><img alt="俏丽流行爆美鞋" src="img/T120_mXgdfXXaGP9rV-164-164.jpg" width="164" height="164" /><em>俏丽流行爆美鞋</em></a></li>       
							</ul>
						</div>
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
	</body>
</html>	