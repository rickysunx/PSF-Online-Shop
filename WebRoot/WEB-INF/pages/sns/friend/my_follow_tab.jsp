<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">

	var myGroupTab = null;
	
	$(document).ready(function(){
		var tabItems = new Array();
		<c:forEach items="${followGroupList}" var="followGroup">
			tabItems.push({id:'${followGroup.followgroupid}',name:'${followGroup.followgroupname}'});
		</c:forEach>
		myGroupTab = new GroupTab('myFollowGroupTab',tabItems,true);
	});

	function GroupTab(id,groups) {
		this._id = id;
		this._groups = groups;
		this._selected = "all";
		this._menus = new Array();
		this._reloadTab();
	}

	GroupTab.prototype._onFollowGroupTabItemClick = function(selectid) {
		this._selected = selectid;
		this._reloadTab();
		onFollowGroupTabChanged(selectid);
	};
	GroupTab.prototype._reloadTab = function() {
		var i;
		//释放原有菜单
		if(this._menus) {
			for(i=0;i<this._menus.length;i++) {
				var menuid = this._menus[i];
				$("#psfmenu_"+menuid).remove();
			}
			this._menus = new Array();
		}
		
		var s = "";
		s+="<dl><dt><a id='followgroup_all' psftype='followgroupTabItem' href='javascript:loadFollowList(-1,\"\",1);'><span><span>全部</span></span></a></dt></dl>";
		s+="<dl><dt>|</dt></dl>";
		s+="<dl><dt><a id='followgroup_none' psftype='followgroupTabItem' href='javascript:loadFollowList(0,\"\",1);'><span><span>未分组</span></span></a></dt></dl>";
		s+="<dl><dt>|</dt></dl>";
		
		
		
		var tabCount = 3;
		
		var newGroups = new Array();
		for(i=0;i<this._groups.length;i++) {
			newGroups.push(this._groups[i]);
		}
		
		
		var selectedByBefore = (this._selected=='all'||this._selected=='none');
		if(!selectedByBefore) {
			for(i=0;i<tabCount;i++) {
				var fg = this._groups[i];
				if(this._selected==fg.id) {
					selectedByBefore = true;
					break;
				}
			}
		}
		
		if(!selectedByBefore) {
			for(i=tabCount;i<this._groups.length;i++) {
				var fg = this._groups[i];
				if(this._selected==fg.id) {
					var temp = newGroups[tabCount-1];
					newGroups[tabCount-1] = newGroups[i];
					newGroups[i] = temp;
					break;
				}
			}
		}
		
		for(i=0;i<newGroups.length;i++) {
			if(i>=tabCount) break;
			var fg = newGroups[i];
			s+="<dl id='dl_followgroup_"+fg.id+"' psftype='followgroupTabItem'><dt><a psftype='followgroupTabItem' id='followgroup_"+fg.id+"' href='javascript:void(0);'><span><span>"+fg.name+"</span></span></a></dt></dl>";
			s+="<dl><dt>|</dt></dl>";
		}
		
		s+="<dl id='dl_followgroup_more' class='dropmenu'><dt><a class='morebtn'><i>更多</i><span></span></a></dt></dl>";
		
		$("#"+this._id).html(s);
		for(i=0;i<newGroups.length;i++) {
			if(i>=tabCount) break;
			var fg = newGroups[i];
			this._menus.push($("#dl_followgroup_"+fg.id).psfIconMenu({pos:'below',items:[
				{'name':'删除该分组','handler':"onDelFollowGroup("+fg.id+")",'icon':"icon_del"},
				{'name':'修改分组名称','handler':"onUpdateFollowGroupName("+fg.id+")","icon":"icon_mod"}
			]}));
		}
		
		var moreMenuItems = new Array();
		for(i = tabCount;i<newGroups.length;i++) {
			var fg = newGroups[i];
			moreMenuItems.push({'name':"<div psftype='followgroupTabItem' id='followgroup_"+fg.id+"'>"+fg.name+"</div>",'handler':'void(0)'});
		}
		moreMenuItems.push({'type':'line'});
		moreMenuItems.push({'name':'创建分组','handler':'onAddFollowGroup()','icon':'icon_add'});
		moreMenuItems.push({'name':'调整分组顺序','handler':'onChangeOrder();','icon':'icon_ad'});
		var moreMenuId = $("#dl_followgroup_more").psfIconMenu({pos:'below',items:moreMenuItems});
		this._menus.push(moreMenuId);
		
		
		var _this = this;
		
		$("*[psftype='followgroupTabItem']").click(function(){
			var id = $(this).attr("id");
			var fgid = id.split("_")[1];
			_this._onFollowGroupTabItemClick(fgid);
		});
		
		$("#followgroup_"+this._selected).addClass("current");
		
	};

	function onChangeOrderOkClicked() {
		$("#groupOrderInfo").text("正在发送请求……");
		$.post("/action/sns/follow/follow_group_order",$("#groupOrderForm").serialize(),function(data){
			if(data.success==1) {
				$.psfInfoDialog("调整顺序成功");
				$("#groupOrderInfo").text("请求成功，正在刷新页面……");
				window.location.reload();
			} else {
				$("#groupOrderInfo").text("出错"+data.info);
				alert(data.info);
			}
		},"json");
	}

	function onChangeOrder() {
		var groups = myGroupTab._groups;
		var s = "";
		var i;
		for(i=0;i<groups.length;i++) {
			var fg = groups[i];
			s+="<li><input name='fgid' type='hidden' value='"+fg.id+"'>"+fg.name+"</li>"
		}
		
		$("#groupOrderList").html(s);
		$("#groupOrderList").sortable();
		$("#changeOrderDialog").psfDialog({"center":true,"modal":true});
	}

	function onFollowGroupTabChanged(id) {
		//此处处理点击后加载列表
		var keyword =  $("#follow_keyword").val();
		if("输入昵称或备注" == keyword || "" == keyword) {
			loadFollowList(id,'',1);
		} else {
			loadFollowList(id,keyword,1);
		}	
	}

	function onDelFollowGroup(id) {
		delFollowGroup(id);
	}

	function onUpdateFollowGroupName(id) {
		openUpdateFollowGroupNameDialog(id);
	}

	function onAddFollowGroup() {
		openAddFollowGroupDialog();
	}
</script>
<div class="tab_menu">

    <div class="searchbox01">
    
        <c:choose>
			<c:when test="${empty keyword}"><input value="输入昵称或备注" id="follow_keyword" onclick="this.value=''"/></c:when>
			<c:otherwise><input value="${keyword }" id="follow_keyword"/></c:otherwise>
		</c:choose>
        <a class="searchbtn" href="javascript:findByKeyword(2);"></a>
    
    </div>

    <div class="linkbox" id="myFollowGroupTab"></div>

</div>


