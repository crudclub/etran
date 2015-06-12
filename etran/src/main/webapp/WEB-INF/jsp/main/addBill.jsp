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
	<script type="text/javascript" charset="utf-8"></script>
	<style type="text/css"> 
        #fm 
        { 
            margin: 0; 
            padding: 10px 30px; 
        } 
        .ftitle 
        { 
            font-size: 14px; 
            font-weight: bold; 
            padding: 5px 0; 
            margin-bottom: 10px; 
            border-bottom: 1px solid #ccc; 
        } 
        .fitem 
        { 
            margin-bottom: 5px; 
        } 
        .fitem label 
        { 
            display: inline-block; 
            width: 80px; 
        } 
    </style> 
    <script type="text/javascript">
        var url;
        var type;
        
        $(document).ready(function(){
        	//设置分页控件 
            var p = $('#dg').datagrid('getPager'); 
            $(p).pagination({ 
                pageSize: 10,//每页显示的记录条数，默认为10 
                pageList: [5,10,15],//可以设置每页记录条数的列表 
                beforePageText: '第',//页数文本框前显示的汉字 
                afterPageText: '页    共 {pages} 页', 
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
            }); 
      });
        
        
        
        function newuser() {
            $("#dlg").dialog("open").dialog('setTitle', '运单录入'); ;
            $("#fm").form("clear");
            url = "/add";
           // document.getElementById("hidtype").value="submit";
        }
        function edituser() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                $("#dlg").dialog("open").dialog('setTitle', 'Edit User');
                $("#fm").form("load", row);
                url = "add?id=" + row.ID;
            }
        }
        function saveuser() {
            $("#fm").form("submit", {
                url: url,
                onsubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    if (result == "1") {
                        $.messager.alert("提示信息", "操作成功");
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("load");
                    }
                    else {
                        $.messager.alert("提示信息", "操作失败");
                    }
                }
            });
        }
        function destroyUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('Confirm', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post('/deleteBill', { id: row.id }, function (result) {
                            if (result == "1") {
                                $('#dg').datagrid('reload');    // reload the user data  
                            } else {
                                $.messager.show({   // show error message  
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }  
       
        
        
        $.fn.datebox.defaults.formatter = function(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
        };
        $.fn.datebox.defaults.parser = function(s){
            if (!s) return new Date();
            var ss = s.split('-');
            var y = parseInt(ss[0],10);
            var m = parseInt(ss[1],10);
            var d = parseInt(ss[2],10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
                return new Date(y,m-1,d);
            } else {
                return new Date();
            }
        };
    </script>
</head>
<body class="easyui-layout">
	<table id="dg" title="My Users" class="easyui-datagrid"
        url="/showBill" toolbar="#toolbar" pagination="true" rownumbers="true"
        fitcolumns="true" singleselect="true">
        <thead>
            <tr>
                <th field="id" width="50">
                    编号
                </th>
                <th field="cardNo" width="50">
                    卡名
                </th>
                <th field="passwd" width="50">
                    密码
                </th>
                <th field="createTime" width="50">
                    创建时间
                </th>
                <th field="createPeople" width="50">
                    创建人
                </th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" onclick="newuser()"
            plain="true">添加</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit"
                onclick="edituser()" plain="true">修改</a> <a href="javascript:void(0)" class="easyui-linkbutton"
                    iconcls="icon-remove" onclick="destroyUser()" plain="true">删除</a>
    </div>
    
    <!--数据源  -->
    <div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" buttons="#dlg-buttons"> 
       <div class="ftitle"> 
           信息编辑 
       </div> 
       <form id="fm" method="post"> 
       <div class="fitem"> 
           <label> 
               编号 
           </label> 
           <input name="id" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               卡号</label> 
           <input name="cardNo" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               密码</label> 
           <input name="passwd"  class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               创建时间</label> 
           <input id="te" name="createTime" class="easyui-datebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               创建人</label> 
           <input name="createPeople" class="easyui-vlidatebox" /> 
       </div> 
       </form> 
   </div>
     <div id="dlg-buttons"> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"  iconcls="icon-cancel">取消</a> 
    </div> 
</body>
</html>