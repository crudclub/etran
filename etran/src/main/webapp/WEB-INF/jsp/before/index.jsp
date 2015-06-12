<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>小马物流首页</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="${style}/initi.css" />
		<link rel="stylesheet" type="text/css" href="${style}/index.css" />
		<!-- 下面滚动图插件开始 -->
		<link rel="stylesheet" type="text/css" href="${style}/plus1.css" />
		<!-- 下面滚动图插件结束 -->
		<!-- 焦点图插件开始 -->
		<link type="text/css" href="${style}/style.css" rel="stylesheet"/>
		<!-- 焦点图插件结束 -->
		<script type="text/javascript" src="${script}/jquery.js"></script>
		<!-- 焦点图插件开始 -->
		<script type="text/javascript" src="${script}/jquery.event.drag-1.5.min.js"></script>
		<script type="text/javascript" src="${script}/jquery.touchSlider.js"></script>
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
					<li><a class="clicked" href="index.jsp">首页</a></li>
					<li><a href="about.jsp>公园简介</a></li>
					<li><a href="news.jsp">新闻动态</a></li>
					<li><a href="show.jsp">图片墙</a></li>
					<li><a href="map.jsp">详细地址</a></li>
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
				<!-- 焦点图开始 -->
				<div class="main_visual">
					<div class="flicking_con">
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
					</div>
					<div class="main_image">
						<ul>
							<li><span class="img_1"></span></li>
							<li><span class="img_2"></span></li>
							<li><span class="img_3"></span></li>
							<li><span class="img_1"></span></li>
							<li><span class="img_2"></span></li>
						</ul>
						<a href="javascript:;" id="btn_prev"></a>
						<a href="javascript:;" id="btn_next"></a>
					</div>
				</div>
				<!-- 焦点图结束 -->
				
				<!-- 通知 -->
				<div class="notice">
					<p>通知：<a href="">1. 冬季来临大家注意保暖。 </a><a href="" class="more">更多>></a></p>
				</div>
				
				<!-- 信息展示框 -->
				<div class="message">
					<div class="left">
						<div class="left_m">
							<div class="one_left">
								<img src="${images}/one.jpg" style="*float: left" />
								<img src="${images}/more_y.jpg" class="float_right" />
								<div class="clear"></div>
							</div>
							<ul class="left_ul">
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li class="li_click"><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
							</ul>
							<div class="clear: both"></div>
						</div>
						<div class="shadow">
							<img src="${images}/shadow.jpg" />
						</div>
					</div>
					<div class="right">
						<div class="right_m">
							<div class="one_left">
								<img src="${images}/two.jpg" style="_float: left" />
								<div class="clear"></div>
							</div>
							<div class="login">
								<table>
									<tr>
										<td>
											<p class="user">用户名：</p>
										</td>
										<td>
											<input type="text" name="username" class="username" />
										</td>
										<td>
											
										</td>
									</tr>
									<tr>
										<td>
											<p class="pass">密<span style="margin: 0px 6px 0px 7px"></span>码：</p>
										</td>
										<td>
											<input type="text" name="password" class="password" />
										</td>
										<td>	
											<p class="forget"> 忘记密码！</p>
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
						<div class="shadow">
							<img src="${images}/shadow.jpg" />
						</div>
					</div>
					<div class="clear"></div>
					<div class="left">
						<div class="left_m">
							<div class="one_left">
								<img src="${images}/three.jpg" style="*float: left" />
								<img src="${images}/more_b.jpg" class="float_right" />
								<div class="clear"></div>
							</div>
							<ul class="left_ul">
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li ><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
							</ul>
							<div class="clear: both"></div>
						</div>
						<div class="shadow">
							<img src="${images}/shadow.jpg" />
						</div>
					</div>
					<div class="right">
						<div class="right_m">
							<div class="one_left">
								<img src="${images}/four.jpg" style="*float: left" />
								<img src="${images}/more_b.jpg" class="float_right" />
								<div class="clear"></div>
							</div>
							<ul class="left_ul">
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li ><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
								<li><a href="">今天是阳光明媚，是打球的好日子。</a><span class="right_time">[2014-12-19]</span></li>
							</ul>
							<div class="clear: both"></div>
						</div>
						<div class="shadow">
							<img src="${images}/shadow.jpg" />
						</div>
					</div>
					<div class="clear"></div>
				</div>
				
				
				
				<!-- 下面滚动图片代码 -->
				<div class="apply">
					<div class="img_l"><img src="${images}/left.gif" /></div>
					<div class="apply_nav">
						<div class="apply_w">
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/sinaminiblog.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">新浪微博</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/kaixin001.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">开心001</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/renren.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">人人网</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/sinaminiblog.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">新浪微博</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/kaixin001.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">开心001</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/renren.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">人人网</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/sinaminiblog.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">新浪微博</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/kaixin001.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">开心001</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="${images}/renren.gif" /></div>
								<div class="apply_info"><a href="http://www.17sucai.com/" target="_blank">人人网</a></div>
							</div>
							
						</div>
					</div>
					<div class="img_r"><img src="${images}/right.gif" /></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="footer">
			<p class="address">地址：河南省郑州市</p>
			<p>小马物流版权所有</p>
		</div>
		<p style="text-align: center">
			来源:<a href="http://www.xiaomawuliu.com/" target="_blank">小马物流</a>
		</p>
	</body>
</html>	