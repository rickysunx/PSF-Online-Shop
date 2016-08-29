<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>个人标签</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">
	<psf:snsHeader/>
	<psf:snsTab/>
	<psf:include page="/sns/myinfo/tab.jsp"/>
	<psf:include page="/sns/myinfo/info/info_tab.jsp"></psf:include>
	
		<div id="signature">
		<p class="nav"></p>
		<span id="title"></span>
        <span id="titlespan">(添加描述自己的职业、兴趣、爱好等方面的关键词，让更多的品友认识你、更快的找到属于您的圈子)</span>
        	<p class="nav"></p>
        		<div class="signatureBox">
                	<div class="signatureMain">
                    		<div class="signatureHeader"><a href="#"><img src="/images/sns/header.gif" alt="userName" /></a></div>
                            <div class="signatureEntrance" sty>
                            		<p>
                                        <span class="username"><a href="#" class="nameText"><b>超级管理员</b></a></span>
                                        <span class="userfriend">通过标签您已经认识<a href="#" class="signatureNo">165</a> 位好友</span>
                                    </p>
                                    <p><input type="text" class="signatureSearch" value="多个标签请用逗号隔开..." onclick="this.value=''"><input type="submit" class="SubmitBtn" value="添加标签 " /></p>
                                    <p class="nav"></p>
                                    <p class="signaturesen">
                                    <b>设置标签的好处：</b>
                                    			设置标签后，您可以通过设置的标签找到和您设置相同或
												者类似标签的品友，也可以让别的朋友通过标签更快的找到您！</p>
                                    
                            </div>  
                            <p class="nav"></p>
                            <div class="signaturelist">
								<span class="signatureone"><a href="#">苹果控<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">张学友歌迷<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">数码达人<img src="/images/sns/close.gif" class="close" /></a></span>
								   <span class="signatureone"><a href="#">购物狂<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">养生专家<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">二级数码<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">音响界老大<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">测试长字符串数据<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">你的我的她的<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">男人女人还有什么<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
								<span class="signatureone"><a href="#">宅男先生<img src="/images/sns/close.gif" class="close" /></a></span>
                            </div>
                            <div class="signatureNumber">您已经设置了<span class="signatureNo">13</span> 个标签，还可以再设置<span class="signatureNo">2</span> 个标签</div>
                            <div class="signatureNumber"><a href="#">一键分享我的标签给品友>></a></div>
                    </div>
                    
                </div>
                <div class="signatureLable">
                	<div class="selectTags"></div>
                    <div class="changehot"><a href="#">换一换</a></div>
                    <p class="nav"></p>
                    <div class="rightnav"></div>
                   		 <div class="hottagsBox">
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">大宅女娃<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">很中肯的老东家<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">太阳下的贝壳<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">热门标签数据测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">标签测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">字符串的长度测试<img src="/images/sns/addTags.gif" class="close" /></a></span>
                            <span class="signatureone"><a href="#">小瘪三哈哈<img src="/images/sns/addTags.gif" class="close" /></a></span>

                            
                    </div>
                </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
		<div class="addjob">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的标签保存成功！</div>
        <center><input type="submit" value="确 定" class="savebtn" /></center>                                         
     </div>
</div>

</body>
</html>