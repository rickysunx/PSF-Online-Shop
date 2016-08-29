<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>工作经历</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
 	<script src="/js/userselect.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		initJobDate();
		initIndustry();
		initData();
	});
	function initData() {
		$("select[name='parent_industry']").val(${parentindustryid});
		$("select[name='parent_industry']").change();
		$("select[name='industry']").val(${industryid});

		$("select[name='ap_industry']").val(${ap_industry});
		$("select[name='company']").val(${accesspower});
	}
	function initJobDate() {
		var thisyear = new Date().getFullYear();
		for(var year=1900;year<=thisyear;year++) {
			$("select[name='beginyear']").append(
				"<option value='"+year+"'>"+year+"年</option>");
		}
		for(var month=1;month<=12;month++) {
			$("select[name='beginmonth']").append(
				"<option value='"+month+"'>"+month+"月</option>");
		}
		for(var endyear=1900;endyear<=thisyear;endyear++) {
			$("select[name='endyear']").append(
				"<option value='"+endyear+"'>"+endyear+"年</option>");
		}
		for(var endmonth=1;endmonth<=12;endmonth++) {
			$("select[name='endmonth']").append(
				"<option value='"+endmonth+"'>"+endmonth+"月</option>");
		}
	}
	var industryList = ${industryList};
	
	function initIndustry(){
		$("select[name='parent_industry']").append("<option value='0'>-请选择-</option>");
		$("select[name='industry']").append("<option value='0'>-请选择-</option>");
		$.each(industryList,function(i,industry){
			$("select[name='parent_industry']").append("<option value='"+industry.industryid+"'>"+industry.industryname+"</option>");
		});

		$("select[name='parent_industry']").change(function(){
			var industryid = $(this).val();
			var industry = findIndustryById(parseInt(industryid));
			$("select[name='industry']").empty();
			$("select[name='industry']").append("<option value='0'>-请选择-</option>");
			$.each(industry.children,function(i,c){
				$("select[name='industry']").append("<option value='"+c.industryid+"'>"+c.industryname+"</option>");
			});
		});
	}
	function findIndustryById(industryid) {
		for(var i=0;i<industryList.length;i++) {
			if(industryList[i].industryid == industryid) return industryList[i];
		}
		return null;
	}
	function openAddJob(){
		$("#companyaccesspower").val($("select[name='company']").val());	
		var dialogId = $("#addJob").psfDialog({"modal":true,"center":true});
		$("#addJob").find(".close").click(function(){
			$("#addJob").psfDialogClose();
		});
	}
	function openUpdateJob(jobid) {
		$("#newcompanyname").attr("value",$("#companyname_"+jobid).text());
		$("#newposition").attr("value",$("#position_"+jobid).text());
		$("#jobid").attr("value",jobid);
		var date = $("#date_"+jobid).text();	
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
		var dialogId = $("#updateJob").psfDialog({"modal":true,"center":true});
		$("#updateJob").find(".close").click(function(){
			$("#updateJob").psfDialogClose();
		});
	}
	function saveJob(){
		$.post(
				"/action/sns/myinfo/save_info_job",$("#addJobForm").serialize(),
				function(data) {
					if(data.success==1) {
						$("#addJob").psfDialogClose();
						$("#jobInfoList").append("<dd><div class='left'><span id='companyname_"+data.jobid+"'>"+data.companyname+" </span><span class='senTitle'>"+
												 "<span id='date_"+data.jobid+"'>"+ data.startdate+"-"+data.enddate+"</span> 担任<span id='position_"+data.jobid+"'>"+data.position+"</span>职位</span>"+
												 "</div><div class='right'><a href='javascript:openUpdateJob("+data.jobid+");'>编辑</a> | <a href='javascript:delJob("+data.jobid+");'>删除</a></div></dd>");
						$.psfInfoDialog("保存成功");
					} else {
						$.psfInfoDialog("保存失败："+data.info,2000);
					}
				},"json"
		);
	}
	function delJob(jobid) {
		if(confirm("确定删除？")) {
			$.post(
					"/action/sns/myinfo/del_job","jobid="+jobid,
					function(data) {
						if(data.success==1) {
							$.psfInfoDialog("删除成功");
							$("#jobinfo_"+jobid).remove();
						} else {
							$.psfInfoDialog("删除失败："+data.info,2000);
						}
					},"json"
			);
		}
	}
	function saveUpdateJob(){
		$.post(
				"/action/sns/myinfo/update_job",$("#updateJobForm").serialize(),
				function(data) {
					if(data.success==1) {
						$("#updateJob").psfDialogClose();
						$("#companyname_"+data.jobid).text(data.companyname);
						$("#position_"+data.jobid).text(data.position);
						var by = $("#updatebeginyear").val();
						var bm = $("#updatebeginmonth").val();
						var ey = $("#updateendyear").val();
						var em = $("#updateendmonth").val();
						$("#date_"+data.jobid).text(by+"年"+bm+"月 -"+ey+"年"+em+"月");
						$.psfInfoDialog("保存成功");
					} else {
						$.psfInfoDialog("保存失败："+data.info,2000);
					}
				},"json"
		);
	}

	function savePower(){
		$.post(
				"/action/sns/myinfo/set_job_power",$("#setPowerForm").serialize(),
				function(data) {
					if(data.success==1) {
						$("#saveOK").psfDialog({"modal":true,"center":true});
						$("#saveOkBtn").click(function(){
							$("#saveOK").psfDialogClose();
						});		
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
	<form id="setPowerForm">
	<div class="jobtime">
	<dl>
		<dt><span class="title"><b>行业</b></span><div id="uboxstyle" class="permis">
	<select name="ap_industry" type="dropDownDiv">
		<option value="1"  selected="selected">完全公开</option>
		<option value="2" >好友公开</option>
		<option value="3" >关注公开</option>
		<option value="4" >完全隐藏</option>
	</select></div></dt>
			<dd>
			当前从事行业:	<span><select name="parent_industry" style="width:170px;"></select></span>
			   			<span><select name="industry" style="width:170px;"></select></span>
			
			</dd>
	</dl>
	<dl>
		<dt><span class="title"><b>公司</b></span><div id="uboxstyle" class="permis">
			<select name="company" type="dropDownDiv">
				<option value="1" selected="selected" id="access_1">完全公开</option>
				<option value="2" id="access_2">好友公开</option>
				<option value="3" id="access_3">关注公开</option>
				<option value="4" id="access_4">完全隐藏</option>
			</select></div>
		</dt>
		<div id="jobInfoList"></div>
		<c:forEach items="${jobList}" var="job">
		<dd id="jobinfo_${job.jobid }">
			<div class="left">
				<span id="companyname_${job.jobid }">${job.companyname }</span> 
				<span class="senTitle">
					<span id="date_${job.jobid }">${job.startdate }-${job.enddate }</span>
					担任<span id="position_${job.jobid }">${job.position }</span>职位</span>
			</div>
			<div class="right"><a href="javascript:openUpdateJob(${job.jobid });">编辑</a> | <a href="javascript:delJob(${job.jobid });">删除</a></div>
		</dd>
		</c:forEach>
	</dl>
	<dl>
	<dd><a href="#" onclick="openAddJob();">添加工作经历&gt;&gt;</a></dd>
	</dl>
	<center><input type="button" class="saveBtn" value="保存设置"  onclick="savePower();"/></center>
	</div>
	</form>

	<!-- 添加工作经历   -->
	<div class="addjob"  style="display:none" id="addJob">
		<form id="addJobForm">
		<input type="hidden" name="companyaccesspower" id="companyaccesspower" value=""/>
    	<div class="addjobtitle"><span class="left">添加工作经历</span><div class="layerClose"><div class="close"></div></div></div>
        <dl>
       		<dd><b>公司：</b><input type="text" class="userinsert" id="companyname" name="companyname" value="" /></dd>
            <dd><b>任职时间：</b><input type="checkbox"  checked="checked" class="checkbtn" /><span class="checktext">正在这里就职</span></dd>
            <dd><b></b>
            <select name="beginyear">
				<option value="0">-年份-</option>
			</select>
			<select name="beginmonth">
				<option value="0">-月-</option>
			</select>
			<select name="endyear">
				<option value="0">-年份-</option>
			</select> 
			<select name="endmonth">
				<option value="0">-月-</option>
			</select> 
          	</dd>
            <dd><b>工作内容：</b><input type="text" class="userinsert" id="position" name="position" value="" /></dd>
            <dd id="jobSubmit"><b></b><input id="addJobSaveBtn" type="button" value="保 存" class="savebtn" onclick="saveJob();"/></dd>
       	</dl>
		</form>
    </div>
	<!-- 编辑工作经历 -->
	<div class="addjob"  style="display:none" id="updateJob">
		<form id="updateJobForm">
		<input type="hidden" id="jobid" name="jobid" value=""/>
    	<div class="addjobtitle"><span class="left">编辑工作经历</span><div class="layerClose"><div class="close"></div></div></div>
        <dl>
       		<dd><b>公司：</b><input type="text" class="userinsert" id="newcompanyname" name="newcompanyname" value="" /></dd>
            <dd><b>任职时间：</b><input type="checkbox"  checked="checked" class="checkbtn" /><span class="checktext">正在这里就职</span></dd>
            <dd><b></b>
            <select name="beginyear" id="updatebeginyear">
				<option value="0">-年份-</option>
			</select>
			<select name="beginmonth" id="updatebeginmonth">
				<option value="0">-月-</option>
			</select>
			<select name="endyear" id="updateendyear">
				<option value="0">-年份-</option>
			</select> 
			<select name="endmonth" id="updateendmonth">
				<option value="0">-月-</option>
			</select> 
          	</dd>
            <dd><b>工作内容：</b><input type="text" class="userinsert" id="newposition" name="newposition" value="" /></dd>
            <dd id="jobSubmit"><b></b><input id="updateJobSaveBtn" type="button" value="保 存" class="savebtn" onclick="saveUpdateJob();"/></dd>
       	</dl>
		</form>
    </div>
   
</div>

	<div class="addjob" style="display:none" id="saveOK">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的资料保存成功！</div>
        <center><input type="submit" value="确 定" class="savebtn" id="saveOkBtn"/></center>                                               
     </div>
	
</body>
</html>