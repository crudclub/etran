<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Basic Dialog - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="${themes}/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${themes}/icon.css">
	<link rel="stylesheet" type="text/css" href="${style}/demo.css">
	<script type="text/javascript" src="${script}/jquery.min.js"></script>
	<script type="text/javascript" src="${script}/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>Basic Dialog</h2>
	<p>Click below button to open or close dialog.</p>
	<div style="margin:20px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('open')">Open</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')">Close</a>
	</div>
	<div id="dlg" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save'" style="width:400px;height:200px;padding:10px">
		The dialog content.
	</div>
</body>
</html>