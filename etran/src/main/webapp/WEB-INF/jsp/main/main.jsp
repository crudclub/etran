<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
    <title>小马物流管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<style type="text/css" media="all">
		a:link {color:blue;} 
 		a:visited{color:blue;} 
		a:active{color:blue;} 
		a:hover {color:#fff;text-decoration:none;font-size: 15px;font-weight: 700;background-color: blue} 
	</style>
	<title>Basic Dialog - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="${themes}/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${themes}/icon.css">
	<link rel="stylesheet" type="text/css" href="${style}/demo.css">
	<script type="text/javascript" src="${script}/jquery.min.js"></script>
	<script type="text/javascript" src="${script}/jquery.easyui.min.js"></script>
  </head>
  <body class="easyui-layout" >
   	<div data-options="region:'north',border:false" style="height:70px;padding:10px;background-color:#008EAD">
   		<font style="font-size: 30px;font-weight: 700;color: #fff">小马物流管理系统</font>
   		
   		<div style="float: right;margin-top: 40px;color: yellow;font-weight:500">
   			<font style="float: left;margin-right: 20px;">欢迎您,</font>
   			<a  onclick="javascript:tuichu()" style="float: left;margin-right: 20px;color:oldlace;cursor:pointer;">退出系统</a>
   			<a  style="float: left;margin-right: 20px;color:oldlace;cursor:pointer;" onclick="javascript:$('#mima').dialog('open');">修改密码</a>
   			<div  id="currentTime" style="float: right;"></div>
   		</div>
   	</div>
	<div data-options="region:'west',split:true,title:'主菜单'" style="width:170px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
	
			<div title="运单管理" style="overflow:auto;padding: 10px;">
				<a style="cursor:pointer;" onclick="addTab('运单录入','/addBill')">运单录入</a>
			</div>
			<div title="新运单录入" style="overflow:auto;padding: 10px;">
				<a style="cursor:pointer;" onclick="addTab('新运单录入','/bill')">新运单录入</a>
			</div>
			<div title="投诉管理"  style="padding:10px;">
				<a style="cursor:pointer;" onclick="addTab('投诉列表','ts.jsp')">投诉列表</a>
			</div>
			<div title="维修管理"  style="padding:10px;">
				<a style="cursor:pointer;" onclick="addTab('维修列表','wx.jsp')">维修列表</a>
			</div>
			<div title="缴费管理" selected="true" style="padding:10px;">
				<a style="cursor:pointer;" onclick="addTab('缴费列表','jiaofei/goPage.do')">缴费列表</a>
			</div>
	
			<div title="业主操作列表" style="overflow:auto;padding: 10px;">
				<a style="cursor:pointer;" onclick="addTab('申请投诉','sqts.jsp')">投诉</a><br>
				<a style="cursor:pointer;" onclick="addTab('申请报修','sqwx.jsp')" style="margin-top: 20px;">报修</a>
			</div>
	
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height:40px;background-color:#008EAD;padding:10px;font-weight: 700" align="center">小马物流管理系统 Design by 小马快跑</div>
	<div data-options="region:'center'" style="border: 0">
			<div id="center" class="easyui-tabs" style="border: 0;" fit="true"></div>
	</div>
	<!-- mima -->
	<div id="mima" class="easyui-dialog" title="修改密码" data-options="iconCls:'icon-tip',closed:true,modal:true" style="width:480px;height:320px;padding:10px;">
			<div align="center">
			<form action="user/rePwd.do" method="post" id="form1">
				<table cellpadding="5" style="color:blueviolet;margin-top: 40px;">
		    		<tr>
		    			<td>原密码:</td>
		    			<td>
		    				<input id="mm" value="" type="hidden">
		    				<input name="id" value="" type="hidden">
		    				<input class="easyui-validatebox" type="password" name="lou" data-options="required:true" validType="yzmm['#mm']" maxlength="20"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>新密码:</td>
		    			<td><input class="easyui-validatebox" type="password" id="pwd" data-options="required:true"  maxlength="20" ></input></td>
		    		</tr>
		    		<tr>
		    			<td>确认密码:</td>
		    			<td><input class="easyui-validatebox" type="password" name="newPwd" data-options="required:true" validType="equals['#pwd']"  maxlength="20"></input></td>
		    		</tr>
		    	</table>
				<a style="cursor:pointer;" class="easyui-linkbutton" onclick="if($('#form1').form('validate')){$('#form1').submit();}" data-options="iconCls:'icon-ok'" style="margin-right: 80px;margin-top: 20px;">确定</a>
				<a style="cursor:pointer;" class="easyui-linkbutton" onclick="$('#form1').form('clear');$('#add').dialog('close');" data-options="iconCls:'icon-cancel'" style="margin-top: 20px;">取消</a>
			</form>
			</div>
	 </div>
  </body>
  <script type="text/javascript">
  //动态时间
  setInterval(function(){   
            $("#currentTime").text(new Date().toLocaleString());   
   },1000);   
  //覆写验证方法
  $.extend($.fn.validatebox.defaults.rules, {   
    equals: {   
        validator: function(value,param){   
            return value == $(param[0]).val();   
        },   
        message: '两次密码不一致.'  
    },
    yzmm: {   
        validator: function(value,param){   
            return value == $(param[0]).val();   
        },   
        message: '原密码错误'  
    }
});  
  //修改密码
  var msg="<%=request.getAttribute("msg")%>";
  	if(msg!="null"){
  		$.messager.alert('提示',msg); 
  	}
  
  //iframe
	function addTab(title, url){
		if ($('#center').tabs('exists', title)){
			$('#center').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#center').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
	}
  //退出
  function tuichu(){
	  window.location.href="<%=basePath%>login.jsp";
  }
</script>
</html>
