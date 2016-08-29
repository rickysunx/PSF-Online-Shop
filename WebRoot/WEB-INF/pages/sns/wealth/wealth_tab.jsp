<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="sns_imgtab">
	<h3 class="" style="padding-left: 30px;"><a href="#">申请提现</a></h3>
	<img src="/images/sns/default/wealthbg.jpg" alt="" /><div class="tab">
	   <dl class="tab03">
			<dd>
				<ul>
				   <li class="<psf:current key="wealthTab" value="mywealth"/>"><a href="/sns/wealth">我的财富</a></li>
				   <li class="<psf:current key="wealthTab" value="psffriendwealth"/>"><a href="/sns/wealth/psffriendwealth">品友财富</a></li>
				   <li class="<psf:current key="wealthTab" value="rankingwealth"/>"><a href="/sns/wealth/rankingwealth">财富排行榜</a></li>
				</ul>
			</dd>
			<dt>
			   <a class="current" href="/sns/wealth/rankingwealth?type=1">享金排行</a>
			   <a href="/sns/wealth/rankingwealth?type=2">积分排行</a>
			</dt>
		</dl>
	</div>

</div>