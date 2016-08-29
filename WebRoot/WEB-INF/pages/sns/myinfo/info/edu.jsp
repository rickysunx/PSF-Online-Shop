<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>教育经历</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
	
	});
	function openAddEdu(){
		var dialogId = $("#addEdu").psfDialog({"modal":true,"center":true});
		$("#addEdu").find(".close").click(function(){
			$("#addEdu").psfDialogClose();
		});
	}
	function saveEdu(){
		$.post(
				"/action/sns/myinfo/save_info_edu",$("#addEduForm").serialize(),
				function(data) {
					if(data.success==1) {
						$("#addEdu").psfDialogClose();
						$("#eduList_"+data.schooltype).append("<li id='eduInfo_'"+data.eduid+">"+
								"<div class='experience'><a href='#'><span id='schoolname_"+data.eduid+"'>"+data.schoolname+"</span><span class='senTitle'><span>"+data.startdate+"-"+data.enddate+"</span><span id='classname_"+data.eduid+"'>"+data.classname+"</span></span></a></div>"+
				                "<ul> <li><a href='#'>隐藏</a><span>|</span></li>"+
				                "<li><a href='javascript:openUpdateEdu("+data.eduid+","+data.schooltype+");'>编辑</a><span>|</span></li>"+
				                "<li><a href='javascript:delEdu("+data.eduid+");'>删除</a></li></ul></li>");
						$.psfInfoDialog("保存成功");
					} else {
						$.psfInfoDialog("保存失败："+data.info,2000);
					}
				},"json"
		);
	}
	function delEdu(eduid) {
		if(confirm("确定删除？")) {
			$.post(
					"/action/sns/myinfo/del_edu","eduid="+eduid,
					function(data) {
						if(data.success==1) {
							$.psfInfoDialog("删除成功");
							$("#eduInfo_"+eduid).remove();
						} else {
							$.psfInfoDialog("删除失败："+data.info,2000);
						}
					},"json"
			);
		}
	}
	function openUpdateEdu(eduid,schooltype){
		var s= "<select name='beginyear'><option value='0'>-年-</option>"+
		"<c:forEach begin='1900' end='2011' var='beginyear'><option value='${beginyear}'>${beginyear}</option></c:forEach></select>年"+
		"<select name='beginmonth'><option value='0'>-月-</option>"+
			"<c:forEach begin='1' end='12' var='beginmonth'><option value='${beginmonth}'>${beginmonth}</option></c:forEach></select>月到"+
		"<select name='endyear'><option value='0'>-年-</option>"+
			"<c:forEach begin='1900' end='2011' var='endyear'><option value='${endyear}'>${endyear}</option></c:forEach></select>年"+
		"<select name='endmonth'><option value='0'>-月-</option>"+	
			"<c:forEach begin='1' end='12' var='endmonth'><option value='${endmonth}'>${endmonth}</option></c:forEach></select>月";
		var info = "";
		if(schooltype == 1){
			info = "<dl><dd><b>大学名称：</b><input type='text' class='userinsert' name='newschoolname' id='newschoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>所属院系：</b><input type='text' class='userinsert' name='newclassname' id='newclassname'/></dd></dl>";
		} else if(schooltype == 2){
			info = "<dl><dd><b>高中名称：</b><input type='text' class='userinsert' name='newschoolname' id='newschoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>文理科班：</b><input type='text' class='userinsert' name='newclassname' id='newclassname'/></dd></dl>";
		} else if(schooltype == 3){
			info = "<dl><dd><b>中学名称：</b><input type='text' class='userinsert' name='newschoolname' id='newschoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>所在班级：</b><input type='text' class='userinsert' name='newclassname' id='newclassname'/></dd></dl>";
		} else if(schooltype == 4){
			info = "<dl><dd><b>小学名称：</b><input type='text' class='userinsert' name='newschoolname' id='newschoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>所在班级：</b><input type='text' class='userinsert' name='newclassname' id='newclassname'/></dd></dl>";
		} else{
			info = "<dl><dd><b>其他名称：</b><input type='text' class='userinsert' name='newschoolname' id='newschoolname'/></dd><dd><b>受教年份：</b>"+s+"</dd><dd><b>受教内容：</b><input type='text' class='userinsert' name='newclassname' id='newclassname'/></dd></dl>";
		}
		$("#neweduTime").empty();
		$("#neweduTime").append(info);

		$("#schooltypeval").val(schooltype);
		$("#eduid").val(eduid);
		$("#schooltype").val($("#exp_"+schooltype).text()+"教育经历");
		$("#newschoolname").val($("#schoolname_"+eduid).text());
		$("#newclassname").val($("#classname_"+eduid).text());
		var date = $("#date_"+eduid).text();	
		var by = date.substr(0,5);
		date = date.substr(5,date.length);
		var bm = date.substr(0,date.indexOf("-"));
		date = date.substr(date.indexOf("-")+1,date.length);	
		var ey = date.substr(0,5);
		var em = date.substr(5,date.length);
		$("select[name='beginyear']").val(by.substr(0,4));
		$("select[name='beginmonth']").val(bm.substr(0,bm.length-1));
		$("select[name='endyear']").val(ey.substr(0,4));
		$("select[name='endmonth']").val(em.substr(0,em.length-1));
		var dialogId = $("#updateEdu").psfDialog({"modal":true,"center":true});
		$("#updateEdu").find(".close").click(function(){
			$("#updateEdu").psfDialogClose();
		});
	}
	function saveUpdateEdu(){
		$.post(
				"/action/sns/myinfo/update_edu",$("#updateEduForm").serialize(),
				function(data) {
					if(data.success==1) {
						$("#updateEdu").psfDialogClose();
						$("#schoolname_"+data.eduid).text(data.schoolname);
						$("#classname_"+data.eduid).text(data.classname);
						$("#date_"+data.eduid).text(data.startdate+"-"+date.enddate);
						$.psfInfoDialog("保存成功");
					} else {
						$.psfInfoDialog("保存失败："+data.info,2000);
					}
				},"json"
		);
	}
	function hidden(eduid) {
		$.post(
			"/action/sns/myinfo/set_edu_power","eduid="+eduid,
			function(data) {
				if(data.success == 1){
					$.psfInfoDialog("保存成功");
				} else {
					$.psfInfoDialog("保存失败："+data.info,2000);
				}
			},"json"
		);
	}
</script>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">
	<psf:snsHeader/>
	<psf:snsTab/>
	<psf:include page="/sns/myinfo/tab.jsp"/>
	<psf:include page="/sns/myinfo/info/info_tab.jsp"></psf:include>
	<form>
	<div class="jobtime">
		<script type="text/javascript">
			startList = function() {
			if (document.all&&document.getElementById) {
			navRoot = document.getElementById("experience");
			for (i=0; i<navRoot.childNodes.length; i++) {
			node = navRoot.childNodes[i];
			if (node.nodeName=="LI") {
			node.onmouseover=function() {
			this.className+=" over";
			}
			node.onmouseout=function() {
			this.className=this.className.replace(" over", "");
			}
			}
			}
			}
			}
			window.onload=startList;
		</script>
	<div id="experience">
	<div class="expertitle" id="exp_1">大学</div>
	<ul id="eduList_1">
		<c:forEach items="${universityList}" var="university">
  		 <li id="eduInfo_${university.eduid }">
			<div class="experience"><a href="#"><span id="schoolname_${university.eduid }">${university.schoolname}</span> <span class="senTitle"><span id="date_${university.eduid }">${university.startdate }-${university.enddate }</span><span id="classname_${university.eduid }">${university.majorname }</span></span></a></div>
               <ul> 
				<li><a href="javascript:hidden(${university.eduid })" id="hidden_${university.eduid }">隐藏</a>	   <span>|</span></li>
               <li><a href="javascript:openUpdateEdu(${university.eduid },1);">编辑</a><span>|</span></li>
               <li><a href="javascript:delEdu(${university.eduid });">删除</a></li>
  			   </ul>
		</li>
		</c:forEach>
	</ul> 

	<div class="expertitle" id="exp_2">高中</div>
	<ul id="eduList_2">
		<c:forEach items="${seniorList}" var="senior">
  		 <li id="eduInfo_${senior.eduid }">
			<div class="experience"><a href="#"><span id="schoolname_${senior.eduid }">${senior.schoolname }</span> <span class="senTitle"><span id="date_${senior.eduid }">${senior.startdate }-${senior.enddate }</span><span id="classname_${senior.eduid }">${senior.classname }</span></span></a></div>
               <ul> 
				<li><a href="javascript:hidden(${senior.eduid });" id="hidden_${senior.eduid }">隐藏</a><span>|</span></li>
               <li><a href="javascript:openUpdateEdu(${senior.eduid },2);">编辑</a><span>|</span></li>
               <li><a href="javascript:delEdu(${senior.eduid });">删除</a></li>
  			   </ul>
		</li>
		</c:forEach>
	</ul> 

	<div class="expertitle" id="exp_3">初中</div>
	<ul id="eduList_3">
		<c:forEach items="${junionList}" var="junion">
  		 <li id="eduInfo_${junion.eduid }">
			<div class="experience"><a href="#"><span id="schoolname_${junion.eduid }">${junion.schoolname }</span> <span class="senTitle"><span id="date_${junion.eduid }">${junion.startdate }-${junion.enddate }</span><span id="classname_${junion.eduid }">${junion.classname }</span></span></a></div>
               <ul> 
				<li><a href="javascript:hidden(${junion.eduid });" id="hidden_${junion.eduid }">隐藏</a><span>|</span></li>
               <li><a href="javascript:openUpdateEdu(${junion.eduid },3);">编辑</a><span>|</span></li>
               <li><a href="javascript:delEdu(${junion.eduid });">删除</a></li>
  			   </ul>
		</li>
		</c:forEach>
	</ul> 

	<div class="expertitle" id="exp_4">小学</div>
	<ul id="eduList_4">
		<c:forEach items="${primaryList}" var="primary">
  		 <li id="eduInfo_${primary.eduid }">
			<div class="experience"><a href="#"><span id="schoolname_${primary.eduid }">${ primary.schoolname}</span> <span class="senTitle"><span id="date_${primary.eduid }">${primary.startdate }-${primary.enddate }</span><span id="classname_${primary.eduid }">${primary.classname }</span></span></a></div>
               <ul> 
			   <li><a href="javascript:hidden(${primary.eduid });" id="hidden_${primary.eduid }">隐藏</a><span>|</span></li>
               <li><a href="javascript:openUpdateEdu(${primary.eduid },4);">编辑</a><span>|</span></li>
               <li><a href="javascript:delEdu(${primary.eduid });">删除</a></li>
  			   </ul>
		</li>
		</c:forEach>
	</ul> 

	<div class="expertitle" id="exp_5">其他</div>
	<ul id="eduList_5">
		<c:forEach items="${otherList}" var="other">
  		 <li id="eduInfo_${other.eduid }">
			<div class="experience"><a href="#"><span id="schoolname_${other.eduid }">${other.schoolname }</span> <span class="senTitle"><span id="date_${other.eduid }">${other.startdate }-${other.enddate }</span><span id="classname_${other.eduid }">${other.majorname }</span></span></a></div>
               <ul>
				<li><a href="javascript:hidden(${other.eduid });" id="hidden_${other.eduid }">隐藏</a><span>|</span></li>
               <li><a href="javascript:openUpdateEdu(${other.eduid },5);">编辑</a><span>|</span></li>
               <li><a href="javascript:delEdu(${other.eduid });">删除</a></li>
  			   </ul>
		</li>
		</c:forEach>
	</ul> 

	<br />
	<div><a href="javascript:openAddEdu();">·添加教育经历&gt;&gt;</a></div>
	</div>
	 </div>
	 <center><input type="button" class="saveBtn" value="保存设置" /></center>
	 </form>
	
		<!-- 添加教育信息 -->
		<div class="addjob" style="display: none " id="addEdu">
			  <form name="edustory" id="addEduForm">
				<div class="addjobtitle"><span class="left">添加教育经历</span><div class="layerClose"><div class="close"></div></div></div>
				<dl>
				<div><b style="font-size:14px;">学校类别：</b>
					<select name="edutime"   onChange="displaydesc(document.edustory.edutime.selectedIndex)">
						<option value="1" selected>大学教育经历</option>
						<option value="2">高中教育经历</option>
						<option value="3">初中教育经历</option>
						<option value="4">小学教育经历</option>
						<option value="5">其他教育经历</option>
					</select>
				</div>
					<div id="eduTime"></div>
					<center><input type="button" value="保 存" class="savebtn" onclick="saveEdu()"/></center>
				</dl>			
				<script>
				var s= "<select name='beginyear'><option value='0'>-年-</option>"+
							"<c:forEach begin='1900' end='2011' var='beginyear'><option value='${beginyear}'>${beginyear}</option></c:forEach></select>年"+
						"<select name='beginmonth'><option value='0'>-月-</option>"+
							"<c:forEach begin='1' end='12' var='beginmonth'><option value='${beginmonth}'>${beginmonth}</option></c:forEach></select>月到"+
						"<select name='endyear'><option value='0'>-年-</option>"+
							"<c:forEach begin='1900' end='2011' var='endyear'><option value='${endyear}'>${endyear}</option></c:forEach></select>年"+
						"<select name='endmonth'><option value='0'>-月-</option>"+	
							"<c:forEach begin='1' end='12' var='endmonth'><option value='${endmonth}'>${endmonth}</option></c:forEach></select>月";
				var textdisplay=new Array()
				textdisplay[0]="<dl><dd><b>大学名称：</b><input type='text' class='userinsert' name='schoolname' id='schoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>所属院系：</b><input type='text' class='userinsert' name='classname' id='classname'/></dd></dl>";
				textdisplay[1]="<dl><dd><b>高中名称：</b><input type='text' class='userinsert' name='schoolname' id='schoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>文理科班：</b><input type='text' class='userinsert' name='classname' id='classname'/></dd></dl>";
				textdisplay[2]="<dl><dd><b>中学名称：</b><input type='text' class='userinsert' name='schoolname' id='schoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>所在班级：</b><input type='text' class='userinsert' name='classname' id='classname'/></dd></dl>";
				textdisplay[3]="<dl><dd><b>小学名称：</b><input type='text' class='userinsert' name='schoolname' id='schoolname'/></dd><dd><b>入学年份：</b>"+s+"</dd><dd><b>所在班级：</b><input type='text' class='userinsert' name='classname' id='classname'/></dd></dl>";
				textdisplay[4]="<dl><dd><b>其他名称：</b><input type='text' class='userinsert' name='schoolname' id='schoolname'/></dd><dd><b>受教年份：</b>"+s+"</dd><dd><b>受教内容：</b><input type='text' class='userinsert' name='classname' id='classname'/></dd></dl>";
				function displaydesc(which){
				if (document.all)
				eduTime.innerHTML=textdisplay[which]
				else if (document.getElementById)
				document.getElementById("eduTime").innerHTML=textdisplay[which]
				}
				displaydesc(document.edustory.edutime.selectedIndex)
				document.edustory.edutime.options[0].selected=true
				</script>
			  </form>
			</div>
  
		<!-- 编辑教育信息 -->
		<div class="addjob" style="display: none " id="updateEdu">
			  <form name="edustory" id="updateEduForm">
				<div class="addjobtitle"><span class="left">编辑教育经历</span><div class="layerClose"><div class="close"></div></div></div>
				<dl>
				<div><b style="font-size:14px;">学校类别：</b>	
					<input type="hidden" name="schooltypeval" id="schooltypeval" value="" />
					<input type="hidden" name="eduid" id="eduid" value="" />
					<input type="text" name="schooltype" id="schooltype" style="border: 0px" value="" readonly="readonly"/>
				</div>
					<div id="neweduTime"></div>
					<center><input type="button" value="保 存" class="savebtn" onclick="saveUpdateEdu()"/></center>
				</dl>	
			  </form>
			</div>
			
		
	<div class="addjob" style="display: none">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的资料保存成功！</div>
        <center><input type="submit" value="确 定" class="savebtn" /></center>                                         
     </div>
</div>
</body>
</html>