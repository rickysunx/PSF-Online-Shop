<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>系统通知</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script type="text/javascript">
<!--
function setTab(name,cursel,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+"_"+i);
  menu.className=i==cursel?"hover":"";
  con.style.display=i==cursel?"block":"none";
 }
}
//-->

function changePage(keyword,page){
	keyword = encodeURI(encodeURI(keyword));
	window.location.href = "/sns/my/notice?keyword="+keyword+"&page="+page;
}
</script>
</head>

<body>
<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="index"/>
			<div id="sns_main" class="snsrbox s_clear">
					<div id="sns_left">
						<psf:include page="/sns/my/notice_content.jsp"/>
                     </div>
                     <div id="sns_right">
							<psf:include page="/sns/my/my_right.jsp"/>
					</div>	
            </div>
            <!--内容end-->
            
   	 </div>
<psf:tail/>
</body>
</html>