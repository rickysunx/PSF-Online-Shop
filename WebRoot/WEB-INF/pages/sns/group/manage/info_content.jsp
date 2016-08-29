<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>


<div class="group_manage_form">
	<form id="group_info_form">
	<dl>
    	<dt><span>*</span> 圈子名称：</dt>
        <dd>
        	<input class="input_name" />
            <span class="errmsg">错误提示</span>
        </dd>
    </dl>
    
    <dl>
    
    	<dt><span>*</span> 圈子简介：</dt>
        <dd>
        
        	<textarea>最多可以输入70个字</textarea>
            <span class="errmsg">错误提示</span>
            
        </dd>
    
    </dl>
    
    <dl>
    
    	<dt><span>*</span> 圈子分类：</dt>
        <dd>
        
        	<select>
            	<option>生活时尚</option>
                <option>生活时尚</option>
            </select>
            <span class="errmsg">错误提示</span>
        
        </dd>
    
    </dl>
    
    <dl>
    
    	<dt><span>*</span> 圈子地址：</dt>
        <dd>
        
        	<select>
            	<option>北京</option>
                <option>重庆</option>
            </select>
            
            <select>
            	<option>不限</option>
            </select>
            <span class="errmsg">错误提示</span>
        
        </dd>
    
    </dl>
    
    <dl>
    
    	<dt><span>*</span> 圈子标签：</dt>
        <dd>
        
        	<input class="input_name" value="时尚　社会服务" />
            <span class="errmsg">错误提示</span>
            <p>标签可以让你的群更容易被搜索到（最多5个签标，签标之间可以用空格或逗号隔开）</p>
        
        </dd>
    
    </dl>
    
    <dl>
    
    	<dt>圈子类别：</dt>
        <dd>
        	
            <ul>
            	<li>
                    <input name="g" class="radio" type="radio" />
                    <label>公开圈子</label>
                    <span class="infomsg">
                        (圈子的内容是完全共公开的，任何人都可以搜索及转发)
                    </span>
                </li>
                <li>
                    <input name="g" class="radio" type="radio" />
                    <label>半公开圈子</label>
                    <span class="infomsg">
                        (只有圈友才能浏览、搜索及转发)
                    </span>
                </li>
                <li>
                    <input name="g" class="radio" type="radio" />
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
        <dd><a class="savedatabtn" href="#">保存资料</a></dd>
    </dl>
	</form>
</div>
