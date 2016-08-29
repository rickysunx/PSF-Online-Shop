<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	
	$("#all").click(function(){
		if($(this).is(":checked")){
			$("input[name='applyid']").attr("checked",true);
		}else{
			$("input[name='applyid']").attr("checked",false);
		}
	});
	
	var apply_param = {
		"groupid" : options['groupid'],
		"page" : 1
	};
	
	$(function(){
		loadApplyList(-1);
	})
	
	function loadApplyList(page){
		if(page != -1){
			apply_param["page"] = page;
		}
		$("#apply_form").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$("#apply_form").load(
			"/sns/group/manage/apply_list",
			apply_param
		);
	}
	
	/**
	*	申请处理
	*   @param isAll 是否为一键处理
	*   @param type  1-通过，2-拒绝，3-忽略
	*   @param applyid
	*/
	function handleApply(isAll, type, applyid){
		var param = "type="+type+"&";
		if(isAll){
			param += $("#apply_form").serialize();
		}else{
			param += "applyid="+applyid;
		}
		$.post(
			"/sns/group/handle_apply",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("操作成功");
					loadApplyList(apply_param["page"]);
				}else{
					$.psfInfoDialog(result.message);
					return false;
				}
			},
			"json"
		);
	}
</script>

<div class="member_managebox">
    <dl class="actions">
        <dd>
            <ul>
                <li>
                    <input id="all" type="checkbox" /><label for="all">全选</label>
                </li>
                <li>
                    <a href="javascript:void(0)" onclick="handleApply(true,1,null)">一键通过</a>
                    <a href="javascript:void(0)" onclick="handleApply(true,2,null)">一键拒绝</a>
                    <a href="javascript:void(0)" onclick="handleApply(true,3,null)">一键忽略</a>
                </li>
            </ul>
        </dd>
    </dl>
    <form id="apply_form"></form>
</div>