<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	
	var rec_param = {"keyword": null};
	function getRecommendation(keyword){
		if(keyword != null && keyword != '圈子搜索'){
			rec_param["keyword"] = keyword;
		}else{
			rec_param["keyword"] = null;
		}
		$('#recommendation').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$('#recommendation').load(
			"/sns/group/squaregroup_recommedation",
			rec_param
		);
	}
	
	var friend_param = {
		type : 1,
		page : 1
	}
	function getPsfFriendGroup(type,page){
		if(type != -1){
			friend_param["type"] = type;
			$("#psffriend_tab li:eq("+(type-1)+")").addClass("current").siblings().removeClass("current");
		}if(page != -1){
			if(type == -1){
				var curpage = parseInt($.trim($('#page').val()));
				var pageCount = parseInt($.trim($('#pageCount').val()));
				page = (curpage+1>pageCount)? 1 : (curpage+1);
			}else{
				page = 1;
			}
			friend_param["page"] = page;
		}
		$('#friend_groups').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$('#friend_groups').load(
			"/sns/group/squaregroup_friends",
			friend_param
		);
	}
	
	var hot_param = {
		classid : null,
		page : 1
	};
	function getHotGroup(classid, page){
		if(classid != -1){
			hot_param["classid"] = classid;
			if(classid == null){
				$('#groupclass_tab li:eq(0)').addClass("current").siblings().removeClass("current");
			}else{
				$('#groupclass_tab li:eq('+classid+')').addClass("current").siblings().removeClass("current");
			}
		}if(page != -1){
			hot_param["page"] = page;
		}
		$('#hot_groups').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$('#hot_groups').load(
			"/sns/group/squaregroup_hot",
			hot_param
		);
	}
	
	var topic_param = {
		page : 1
	};
	function getTopics(page){
		if(page == -1){
			var curpage = parseInt($.trim($('#topic_page').val()));
			var pageCount = parseInt($.trim($('#topic_pageCount').val()));
			page = (curpage+1>pageCount)? 1 : (curpage+1);
			topic_param["page"] = page;
		}
		$('#group_topics').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$('#group_topics').load(
			"/sns/group/squaregroup_topic",
			topic_param
		);
	}
	
	var saying_param = {
		"keyword":null
	}; 
	function getComments(keyword){
		if(keyword != null && keyword != '圈子发言搜索'){
			saying_param["keyword"] = keyword;
		}else{
			saying_param["keyword"] = null;
		}
		$('#group_sayings').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$('#group_sayings').load(
			"/sns/group/squaregroup_saying",
			saying_param
		);
	}
	
	$(function(){
		getRecommendation(null);
		getPsfFriendGroup(-1,-1);
		getHotGroup(-1,-1);
		getTopics(1);
		getComments(null);
		
		initInput("search_saying","圈子发言搜索");
		initInput("search_rec","圈子搜索");
	});
</script>

<div class="group_recom_list">

	<div class="header">
    
    	<div class="searchbox01">
            <input id="search_rec" name="keyword"/>
            <a href="javascript:void(0)" onclick="getRecommendation($('#search_rec').val())" class="searchbtn"></a>
        </div>
    	<em></em>
    
    </div>
    <div id="recommendation"></div>
</div>

<div class="group_recom_main">

	<div class="group_left">
    
    	<div class="group_recom_friend">
        
        	<div class="header"><i></i><em></em></div>
            <dl class="tab">
            	<dt id="next" style="display:none;"><a href="javascript:void(0)" onclick="getPsfFriendGroup(-1,1)">换一组</a></dt>
                <dd>
                	<ul id="psffriend_tab">
                    	<li class="current"><a href="javascript:void(0)" onclick="getPsfFriendGroup(1,1)">好友</a></li>
                        <li><a href="javascript:void(0)" onclick="getPsfFriendGroup(2,1)">关注</a></li>
                        <li><a href="javascript:void(0)" onclick="getPsfFriendGroup(3,1)">粉丝</a></li>
                    </ul>
                </dd>
            </dl>
            
            <ul id="friend_groups" class="list"></ul>
        
        </div>
        
        
        <div class="group_recom_hot">
        
        	<div class="header"><i></i><em></em></div>
            <div class="list">
            	<ol id="groupclass_tab">
                	<li class="current"><a href="javascript:void(0)" onclick="getHotGroup(null,1)">全部</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(1,1)">同城活动</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(2,1)">明星粉丝</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(3,1)">行业交流</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(4,1)">兴趣爱好</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(5,1)">生活时尚</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(6,1)">学习教育</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(7,1)">互品活动</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(8,1)">童鞋会</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(9,1)">老友记</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(10,1)">房地产</a></li>
                    <li><a href="javascript:void(0)" onclick="getHotGroup(11,1)">车友会</a></li>
                </ol>
                
                <div id="hot_groups" class="items"></div>
            </div>
        
        </div>
    
    </div>
    
    <div class="group_right">
    
    	<div class="group_recom_topic">
        	<div class="header">
            	<div id="next_topic" class="right" style="display: none;"><a href="javascript:void(0)" onclick="getTopics(-1)">换一组</a></div>
            	<em></em>
            </div>
            <ul id="group_topics"></ul>
        </div>
        
        <div class="group_recom_post">
        	<div class="header">
            	<div class="searchbox01">
                    <input id="search_saying" name="keyword"/>
                    <a href="javascript:void(0)" onclick="javascript:getComments($('#search_saying').val())" class="searchbtn"></a>
                </div>
            	<em></em>
            </div>
            <ul id="group_sayings"></ul>
        </div>
    </div>

</div>