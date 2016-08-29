<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	var initIntro = ${empty group}? "最多可以输入70个字" : "${group.intro}";
	$(function(){
		$("#group_intro").val(initIntro);
		$("#group_intro").focus(function(){
			if($(this).val() == "最多可以输入70个字"){
				$(this).val("");
			}
		});
		$("#group_intro").blur(function(){
			$('.group_intro_errmsg').text("");
			if($(this).val()==''){
				$(this).val(initIntro);
				$('.group_intro_errmsg').text("圈子介绍字数不能空！");
			}else if($.trim($(this).val()).length > 70){
				$('.group_intro_errmsg').text("圈子介绍字数不能超过70！");
			}
		});
		
		$("[name='group_type']:radio").click(function(){
			if($('#group_type_1').is(":checked")){
				$('#join_type').show();	
			}else{
				$('#join_type').hide();	
			}
		});

	});
	
	function getChildZone(obj,divid){
		var parentid = $(obj).val();
		$.post(
			"/sns/group/getchildzone",
			"parentid="+parentid,
			function(result){
				var content = '';
				$.each(result.childs,function(i,child){
					content += "<option value="+child.zoneid+">"+child.zonename+"</option>"
				});
				$('#'+divid).html(content);
			},
			"json"
		);
	}
	
	function validateGroupName(divid){
		$('.'+divid+'_errmsg').text("");
		var groupname = $.trim($('#'+divid).val());
		if(groupname.length < 1){
			$('.'+divid+'_errmsg').text("圈子名称不能为空！");
			$('#'+divid)[0].focus();
			return false;
		}else{
			return true;
		}
	}
	
	function validateTag(divid){
		$(".group_tag_errmsg").text("");
		var tag = $.trim($('#'+divid).val());
		var regExp = /[,|\s|,\s|\s,]+/;
		var tags = tag.split(regExp);
		
		if(tags.length > 5){
			$(".group_tag_errmsg").text("最多5个标签");
			return false;
		}
		return true;
	}
	
	function saveGroup() {
		var groupname = $.trim($('#group_name').val());
		var groupintro = $.trim($('#group_intro').val());

		if(groupname.length < 1){
			$(".group_name_errmsg").text("圈子名称不能为空！");
			return false;
		}else if(groupintro.length < 1 || groupintro.length>70 || groupintro=='最多可以输入70个字'){
			$(".group_intro_errmsg").text("圈子介绍不能为空，且字数不能超过70！");
			return false;
		}else if(!validateTag('group_tag')){
			$('.group_tag_errmsg').text("最多5个标签");
			return false;
		}else{
			var param = $("#group_info").serialize();
			$.post(
				"/sns/group/savegroup",
				param,
				function(result){
					if(result.success){
						$.psfInfoDialog("创建成功！");
						$("#groupid").val(result.groupid);
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	}
</script>
        	
<form id="group_info">
<div class="group_manage_form">
	<input type="hidden" name="groupid" value="${group.groupid}"/>
	<dl>
    	<dt><span>*</span> 圈子名称：</dt>
        <dd>
        	<input id="group_name" class="input_name" name="group_name" onblur="validateGroupName('group_name')" value="${group.groupname}"/>
            <span class="errmsg group_name_errmsg"></span>
        </dd>
    </dl>
    
    <dl>
    	<dt><span>*</span> 圈子简介：</dt>
        <dd>
        	<textarea id="group_intro" name="group_intro"></textarea>
            <span class="errmsg group_intro_errmsg"></span>
        </dd>
    </dl>
    
    <dl>
    	<dt><span>*</span> 圈子分类：</dt>
        <dd>
        	<select id="group_class" name="group_class">
            	<c:forEach items="${groupclass}" var="gc">
            		<option value="${gc.groupclassid}">${gc.groupclassname}</option>
            	</c:forEach>
            </select>
            <span class="errmsg group_class_errmsg"></span>
        </dd>
    </dl>
    
    <dl>
    	<dt><span>*</span> 圈子地址：</dt>
        <dd>
        	<select id="addr_province" name="addr_province" onchange="getChildZone(this,'addr_city')">
            	<c:forEach items="${provinces}" var="province">
            	<option value="${province.zoneid}">${province.zonename}</option>
            	</c:forEach>
            </select>
            <select id="addr_city" name="addr_city">
            	<c:forEach items="${cities}" var="city">
            	<option value="${city.zoneid}">${city.zonename}</option>
            	</c:forEach>
            </select>
            <span class="errmsg addr_province_errmsg addr_city_errmsg"></span>
        </dd>
    </dl>
    
    <dl>
    	<dt>圈子标签：</dt>
        <dd>
        	<input id="group_tag" class="input_name" name="group_tag" onchange="validateTag('group_tag')" value="${group.grouptag}"/>
            <span class="errmsg group_tag_errmsg"></span>
            <p>标签可以让你的群更容易被搜索到（最多5个签标，签标之间可以用空格或逗号隔开）</p>
        </dd>
    </dl>
    
    <dl>
    	<dt>圈子类别：</dt>
        <dd>
            <ul>
            	<li>
                    <input id="group_type_1" name="group_type" class="radio" type="radio" checked="checked" value="1"/>
                    <label>公开圈子</label>
                    <span class="infomsg">
                        (圈子的内容是完全共公开的，任何人都可以搜索及转发)
                    </span>
                    <div id="join_type" class="group_popupbox">
                    	<div class="arrow"></div>
                        <div class="conbox">
                        	<ol>
                            	<li class="name">加入方式</li>
                            	<li>
                                    <input name="join_type" class="radio" type="radio" checked="checked" value="1"/>
                                    <label>自由加入</label>
                                </li>
                                <li>
                                    <input name="join_type" class="radio" type="radio" value="2"/>
                                    <label>申请加入</label>
                                </li>
                            </ol>
                        </div>
                    </div>
                </li>
                <li>
                    <input id="group_type_2" name="group_type" class="radio" type="radio" value="3"/>
                    <label>半公开圈子</label>
                    <span class="infomsg">
                        (只有圈友才能浏览、搜索及转发)
                    </span>
                </li>
                <li>
                    <input id="group_type_3" name="group_type" class="radio" type="radio" value="4"/>
                    <label>私密圈子</label>
                    <span class="infomsg">
                        (圈子只能由圈主和管理员主动邀请加入，内容不能被搜索及转发)
                    </span>
                </li>
            </ul>
            
        </dd>
    
    </dl>
    <dl>
    	<dt></dt>
        <dd><a class="savedatabtn" href="javascript:void(0)" onclick="saveGroup()">保存资料</a></dd>
    </dl>

</div>
</form>
<script type="text/javascript">
	if(${!empty group}){
		var groupclassid = ${group.groupclassid};
		var provinceid = ${parentid};
		var cityid = ${group.zoneid};
		var grouptype = ${group.grouptype};
		//alert(groupclassid + ":" + provinceid + ":" + cityid + ":" + grouptype);
		$("#group_class option[value='"+groupclassid+"']").attr("selected","selected");
		$("#addr_province option[value='"+provinceid+"']").attr("selected","selected");
		$("#addr_city option[value='"+cityid+"']").attr("selected","selected");
		if(grouptype == 1 || grouptype == 2){
			$("input[name='join_type'][value='"+grouptype+"']").attr("checked","checked");
			$("input[name='group_type'][value='1']").attr("checked","checked");
		}else{
			$("input[name='group_type'][value='"+grouptype+"']").attr("checked","checked");
		}
	}
</script>