﻿<!DOCTYPE html>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 下面滚动图插件开始 -->
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<!-- 下面滚动图插件结束 -->
		<!-- 焦点图插件开始 -->
		<link type="text/css" href="css/style.css" rel="stylesheet"/>
		<!-- 焦点图插件结束 -->
		<script type="text/javascript" src="js/jquery.js"></script>
		<!-- 焦点图插件开始 -->
		<script type="text/javascript" src="js/jquery.event.drag-1.5.min.js"></script>
		<script type="text/javascript" src="js/jquery.touchSlider.js"></script>
		<!-- 焦点图插件结束 -->
		<script type="text/javascript">
			$(function() {
				//焦点图插件代码开始
				$(".main_visual").hover(
					function(){
						$("#btn_prev,#btn_next").fadeIn()
					},
					function(){
						$("#btn_prev,#btn_next").fadeOut()
					}
				);
				$dragBln = false;
				$(".main_image").touchSlider({
					flexible : true,
					speed : 200,
					btn_prev : $("#btn_prev"),
					btn_next : $("#btn_next"),
					paging : $(".flicking_con a"),
					counter : function (e){
						$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
					}
				});
				$(".main_image").bind("mousedown", function() {
					$dragBln = false;
				});
				
				$(".main_image").bind("dragstart", function() {
					$dragBln = true;
				});
				
				$(".main_image a").click(function(){
					if($dragBln) {
						return false;
					}
				});
				timer = setInterval(function(){
					$("#btn_next").click();
				}, 5000);
				$(".main_visual").hover(
					function(){
						clearInterval(timer);
					},
					function(){
						timer = setInterval(
							function(){
								$("#btn_next").click();
							},5000
						);
					}
				);
				
				$(".main_image").bind("touchstart",function(){
					clearInterval(timer);
				}).bind("touchend", function(){
					timer = setInterval(function(){
						$("#btn_next").click();
					}, 5000);
				});
				//焦点图插件代码结束
				
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
				
				<!-- 下面滚动图插件开始 -->
				$li1 = $(".apply_nav .apply_array");
				$window1 = $(".apply .apply_w");
				$left1 = $(".apply .img_l");
				$right1 = $(".apply .img_r");
				$window1.css("width", $li1.length*176);
				var lc1 = 0;
				var rc1 = $li1.length-5;
				$left1.click(function(){
					if (lc1 < 1) {
						
						return;
					}
					lc1--;
					rc1++;
					$window1.animate({left:'+=176px'}, 1000);
				});
				$right1.click(function(){
					if (rc1 < 1){
						
						return;
					}
					lc1++;
					rc1--;
					$window1.animate({left:'-=176px'}, 1000);
				});
				<!-- 下面滚动图插件结束 -->
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
					<li><a class="clicked" href="about.html">公园简介</a></li>
					<li><a href="news.html">新闻动态</a></li>
					<li><a href="show.html">图片墙</a></li>
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
					<img src="images/bar1.jpg" />
				</div>
				<div class="int">
					<div class="int_con">
						<p>
							<span style="color: #0550a3; font-weight: bold;">千湖国家湿地公园位于陕西省宝鸡市千阳县千河谷地中游，是以河流湿地特征为主，集河流湿地、库塘湿地、沼泽湿地特征于一体，是我国西北地区典型的黄土高原湿地。</span>公园有陆生脊椎动物5纲27目47科174种，其中湿地鸟类14目24科81种，水禽41种，国家Ⅱ级重点保护鸟类如大天鹅、灰鹤等，有省重点保护并列入《中日候鸟保护协定》名录中的白鹭、豆雁、针尾鸭、绿翅鸭、花脸鸭、赤膀鸭、赤麻鸭等，雁鸭类种类数量约30万只左右，数量较大。哺乳类5目8科24种，两栖爬行类3目8科21种。其次还有丰富的鱼类资源如有秦岭细鳞鲑、马口鱼、宽鳍鱲、拉氏鱼岁、中华鰟鮍、鲤、鲫等共5目7科48种。湿地植物（苔藓、蕨类、裸子、被子植物）34科61属101种。生物资源丰富，良好的自然资源为水禽栖息提供了丰富的食物资源，每年冬季有雁、鸭、鹭等多种鸟类在此栖息。同时湿地公园具有显著或特殊生态、文化、美学和生物多样性价值的湿地景观，生态特征显著。以湿地景观为主体，融合湿地景观和人文景观并具有生态、科学、教育、休闲、其它自然景观和历史文化价值。
						</p>
						<div class="t_c">
							<img src="images/1.jpg" />
						</div>
						<p>
							建设内容包括新建湿地公园管理处1个，保护管理站（生态旅游服务部）2处，珍稀动物救护繁育中心1处，湿地公园展览中心1处，湿地科普观鸟小区1处，湿地文化及资源展示小区1处，恢复和重建挺水植物 50公顷，恢复和重建湿生植物70公顷，购置保护、宣教、防火、旅游等交通车辆8辆，购置宣传、科研监测、医疗救护、办公设施设备各1套；设立固定样地60个；项目固定样线80条，建设城市湿地休闲小区、段坊湿地人家小区和新兴商务湿地休闲小区共3处。
						</p>
						<div class="t_c">
							<img src="images/2.jpg" />
						</div>
						<p>
							千湖国家湿地公园位于渭河一级支流千河流域千阳县境内，南北宽 7.7公里，东西长 6.3公里，总面积 573.2公顷，区内有陆生脊椎动物 174种，占我省脊椎动物总种数的 23.2%。各项工程规划建设总投资 8854万元，工期 7年。湿地公园分期实施，到 2015年建成。建成后，湿地公园将依托湿地景观、水禽景观、林海景观、文化景观和人文景观于一体，开发湿地旅游产业，在湿地保育、科研、避暑度假和生活休闲等多方面发挥重要功能，具有良好的生态、社会和经济效益。 据悉，千阳县已投资 3000万元，启动了湿地公园子项目千湖橡胶坝、世景园项目，在湿地内栽植芦苇 650亩，景区绿化面积达万余亩。
						</p>
						<div class="t_c">
							<img src="images/3.jpg" />
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