<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	    <script type="text/javascript">
	        
	    </script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<div class="page_main_msg left">
				<div class="left_row">
		              <div class="list pic_news">
				          <div class="list_bar">景点介绍</div>
				          <div class="list_content">
							    <table width="100%" border="0" cellpadding="5" cellspacing="5">
								    <tr>
								       <td align="left"><img src="<%=path %>/${requestScope.jingdian.fujian}" width="560" height="240" style="border:1px solid #ccc; padding:3px;"/></td>
								    </tr>
								    <tr>
								       <td align="left">名称：${requestScope.jingdian.name}</td>
								    </tr>
								    <tr>
								       <td align="left">地址：${requestScope.jingdian.dizhi}</td>
								    </tr>
								    <tr>
								       <td align="left">门票：${requestScope.jingdian.menpiao}</td>
								    </tr>
								    <tr>
								       <td align="left">介绍：<c:out value="${requestScope.jingdian.jieshao}" escapeXml="false"></c:out></td>
								    </tr>
								</table>
						  </div>
					  </div>	
				      <div style="clear:both;"></div>
			     </div>
			</div>
			
			<!-- 右边的用户登录。留言。投票 -->
			<div class="page_other_msg right">
				<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
			</div>
			<!-- 右边的用户登录。留言。投票 -->
		</div>
		
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
