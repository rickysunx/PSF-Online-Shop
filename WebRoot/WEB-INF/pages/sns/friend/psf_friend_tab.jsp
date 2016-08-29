<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="tab_menu">
                    
    <div class="btns">
        <a href="javascript:followAll();" class="button01">
        
            <span><em></em><b>一键关注</b></span>
        
        </a>
    </div>

    <div class="linkbox">
    
        <dl>
            <dt><a href="javascript:loadPsfFriendList(0,1);" class="current" id="psf_friend_0" name="psffriend"><span><span>全部</span></span></a></dt>
        </dl>
        
        <dl><dt>|</dt></dl>
        
        <dl>
            <dt><a href="javascript:loadPsfFriendList(2,1);" id="psf_friend_2" name="psffriend"><span><span>同事</span></span></a></dt>
        </dl>
        
        <dl><dt>|</dt></dl>
        
        <dl>
            <dt><a href="javascript:loadPsfFriendList(1,1);" id="psf_friend_1" name="psffriend"><span><span>同学</span></span></a></dt>
        </dl>
        
        <dl><dt>|</dt></dl>
        
        <dl>
            <dt><a href="javascript:loadPsfFriendList(4,1);" id="psf_friend_4" name="psffriend"><span><span>同乡</span></span></a></dt>
        </dl>
        
        <dl><dt>|</dt></dl>
        
        <dl>
            <dt><a href="javascript:loadPsfFriendList(3,1);" id="psf_friend_3" name="psffriend"><span><span>同城</span></span></a></dt>
        </dl>
        
        <dl><dt>|</dt></dl>
        
        <dl>
            <dt><a href="javascript:loadPsfFriendList(5,1);" id="psf_friend_5" name="psffriend"><span><span>异性</span></span></a></dt>
        </dl>
    
    </div>

</div>