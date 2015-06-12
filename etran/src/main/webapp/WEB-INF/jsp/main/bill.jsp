<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运单录入</title>
	<link rel="stylesheet" type="text/css" href="${themes}/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${themes}/icon.css">
	<link rel="stylesheet" type="text/css" href="${style}/demo.css">
	<script type="text/javascript" src="${script}/jquery.min.js"></script>
	<script type="text/javascript" src="${script}/mms.viewModel.search.js"></script>
	<script type="text/javascript" src="${script}/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${script}/jquery.detailgrid.js"></script>
	<script type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
      
	  function newuser() {
		  var index=$('#dg').datagrid('appendRow', {         
			  id: '2',
			  cardNo:'',
			  passwd:'',
			  createTime:'',
			  createPeople:''
          }).datagrid('getRows').length-1;
		  $('#dg').datagrid('beginEdit',index);
        
      }
	  function destroyUser() {
		  var row = $('#dg').datagrid('getSelected');
		  
		  $.messager.confirm('Confirm', '确定要删除吗?', function (r) {
			    if (row) {
			           var rowIndex = $('#dg').datagrid('getRowIndex', row);
			           $('#dg').datagrid('deleteRow', rowIndex);  
			           $('#dg').datagrid('reload');//删除后重新加载下
			   }else
			   {
				   $.messager.alert("提示信息", "请选择要删除的行");
				   return;
			   }
          });
		  
	  }
	 
	  
	  
	  function saveBill()
	  {
		  var content = $("#dg").datagrid('getData');
		  $('#goods').val(JSON.stringify(content));
		  $("#fm").form("submit", {
              url: "/addNewBill",
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
	  
	  function formatDecimal(value){
			var val = parseFloat(value);
			return isNaN(val) ? value : val.toFixed(2);
		}
	  
	  var editIndex = undefined;
      function endEditing(){
          if (editIndex == undefined){return true}
          if ($('#dg').datagrid('validateRow', editIndex)){
              var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'id'});
              $('#dg').datagrid('endEdit', editIndex);
              editIndex = undefined;
              return true;
          } else {
              return false;
          }
      }
      
      function onClickCell(index, field){
          if (editIndex != index){
              if (endEditing()){
                  $('#dg').datagrid('selectRow', index)
                          .datagrid('beginEdit', index);
                  var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
                  ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                  editIndex = index;
              } else {
                  $('#dg').datagrid('selectRow', editIndex);
              }
          }
      }
      function append(){
          if (endEditing()){
              $('#dg').datagrid('appendRow',{id:'1'});
              editIndex = $('#dg').datagrid('getRows').length-1;
              $('#dg').datagrid('selectRow', editIndex)
                      .datagrid('beginEdit', editIndex);
          }
      }
      function removeit(){
    	  alert(editIndex);
          if (editIndex == undefined){return}
          $('#dg').datagrid('cancelEdit', editIndex)
                  .datagrid('deleteRow', editIndex);
          editIndex = undefined;
      }
      function accept(){
          if (endEditing()){
              $('#dg').datagrid('acceptChanges');
          }
      }
      function reject(){
          $('#dg').datagrid('rejectChanges');
          editIndex = undefined;
      }
      function getChanges(){
          var rows = $('#dg').datagrid('getChanges');
          alert(rows.length+' rows are changed!');
      }
    </script>

</head>
<body class="easyui-layout">


<div class="datagrid-toolbar" >
    <a href="#" plain="true" class="easyui-linkbutton" icon="icon-save"         title="保存"  onclick="saveBill()" data-bind="click:saveClick">保存</a>
    <a href="#" plain="true" class="easyui-linkbutton" icon="icon-undo"         title="撤消"  data-bind="click:rejectClick">撤消</a>
    <a href="#" plain="true" class="easyui-linkbutton" icon="icon-user-accept"  title="审核"  data-bind="click:auditClick,easyuiLinkbutton:approveButton" >审核</a>
    <a href="#" plain="true" class="easyui-linkbutton" icon="icon-printer"      title="打印"  data-bind="click:printClick">打印</a>
</div>
    <form id="fm" method="post"> 
<div id="master" class="container_12" data-bind="inputwidth:0.9">
          <table cellpadding="0" cellspacing="0" class="form-table">
			<tr>
				<td style="width:60px">单据编号</td>
				<td style="width:260px"><input name="code" value="${bill.code }"  style="width:174px"></input></td>
				<td style="width:60px">单据日期</td>
				<td><input name="billDate" class="easyui-datebox" value="${bill.billDate }"></input></td>
			</tr>
			</table>
</div>
 
<div id="tt" class="easyui-tabs">  
    <div title="材料明细">
       <table id="dg"  class="easyui-datagrid"  toolbar="#toolbar"  rownumbers="true" height="240" fitcolumns="false" singleselect="true"  data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                 showFooter: true,
                onClickCell: onClickCell">
        <thead>
            <tr>
                <th data-options="field:'id',width:80,align:'right',editor:{type:'numberbox'}">
                    编号
                </th>
                <th data-options="field:'cardNo',width:80,align:'right',editor:{type:'numberbox'}">
                    卡名
                </th>
                <th data-options="field:'passwd',width:80,align:'right',editor:{type:'numberbox'}">
                    密码
                </th>
                  <th data-options="field:'createTime',width:80,align:'right',editor:{type:'numberbox'}">
                    创建时间
                </th>
                 <th data-options="field:'createPeople',width:80,align:'right',editor:{type:'numberbox'}">
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
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">Accept</a>  
           <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
    </div>
    </div>
</div>
<input id="goods" name="goods" type="hidden"></input>
<div id="master2" class="container_12" data-bind="inputwidth:0.9">
<table>
	    		<tr>
	    			<td>总金额:</td>
	    			<td><input class="easyui-textbox" type="text" name="phone" data-options="required:true"></input></td>
	    		</tr>
	    	</table>
</div>
</form>
</body>
</html>