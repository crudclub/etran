﻿<!DOCTYPE html>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
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
					<li><a href="news.html" class="clicked">新闻动态</a></li>
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
					<img src="images/bar.jpg" />
				</div>
				<div class="details">
					<div class="d_left">
						<div class="d_left_top">
								<div class="one_left">
									<img src="images/two.jpg" style="_float: left" />
									<div class="clear"></div>
								</div>
								<div class="login">
									<table>
										<tr>
											<td>
												<p class="user">用户名：</p>
											</td>
											<td>
												<input type="text" name="username" class="username" style="width: 150px" />
											</td>
											<td>
												
											</td>
										</tr>
										<tr>
											<td>
												<p class="pass">密<span style="margin: 0px 6px 0px 7px"></span>码：</p>
											</td>
											<td>
												<input type="text" name="password" class="password" style="width: 150px" />
											</td>
											<td>	
												
											</td>
										</tr>
										<tr>
											<td>
												<input type="submit" value="登录" class="sub" />
											</td>
											<td>
												<input type="reset" value="取消" class="res" />
											</td>
											<td></td>
										</tr>									
									</table>
								</div>
								<div class="clear: both"></div>
						</div>
						<div class="d_left_bottom">
							<img src="images/j_left.jpg" />
						</div>
					</div>
					<div class="d_right">
						<div class="d_right_top">
							<ul class="left_ul">
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
							</ul>
						</div>
						<div class="d_right_bottom">
							<img src="images/j_right.jpg" />
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="footer">
			<p class="address">地址：陕西省宝鸡市千阳县南寨镇闫家村五组27号</p>
			<p>张旭超个人版权所有</p>
		</div>
	</body>
</html>	