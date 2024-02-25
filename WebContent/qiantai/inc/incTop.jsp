<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <style type="text/css">
        .Header {background: url(<%=path %>/img/banner.jpg) #d10e00 repeat-x left top; height: 110px;width: 966px;}
        .HeaderTop {margin: 0px auto;}
    </style>
     <script type="text/javascript">
            function myXinxi()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	            </s:else>
	        }
	        
	        function zhutiAll()
	        {
	            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
	            </c:if>
	            
	            <c:if test="${sessionScope.user!=null}">
	                var url="<%=path %>/zhutiAll.action";
					var targetWinName="newWin";
					var features="width=972,height=690,toolbar=no, top=0, left=0, menubar=yes, scrollbars=yes, resizable=no,location=yes, status=yes"
					var new_win=window.open(url,targetWinName,features);
	            </c:if>
	        }
	        
	        function reg()
	        {
	                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	        }
     </script>
  </head>
  
  <body>
        <div class="Header HeaderTop">
			<br/>
			<font style="font-size: 40px;color: white;font-weight: bolder;display: block;text-align: center;"></font>
		</div>
		<div class="topmenu cbody1">
			<ul>
				<li class="thisclass">
					<A href="<%=path %>/qiantai/default.jsp" style="font-family: 楷体;font-size: 17px;">网站首页</A>
				</li>
				<li class="thisclass">
					<A href="<%=path %>/jingdianAll.action" style="font-family: 楷体;font-size: 17px;">旅游景点</A>
				</li>
				<li class="thisclass">
					<A href="<%=path %>/xianluAll.action" style="font-family: 楷体;font-size: 17px;">旅游线路</A>
				</li>
				<li class="thisclass">
					<A href="#"  onclick="reg()" style="font-family: 楷体;font-size: 17px;">免费注册</A>
				</li>
				<li class="thisclass">
					<A href="#" onclick="myXinxi()" style="font-family: 楷体;font-size: 17px;">我的信息</A>
				</li>
			</ul>
		</div>
		<form id="searchForm" action="<%=path %>/jingdianSearch.action" method="post">
			<div class="topsearch">
				<div class="title"></div>
				<div id="page_search_left">
					<input class="inputText" size="16" onkeypress="if(event.keyCode==13){searchFormSubmit();return false;}" name="name" type="text" />
				</div>
				<div id="page_search_btn">
					<input type="submit" value="搜索">
				</div>
				<div id="page_search_right">
					<script>
						<!--var day="";
						var month="";
						var ampm="";
						var ampmhour="";
						var myweekday="";
						var year="";
						mydate=new Date();
						myweekday=mydate.getDay();
						mymonth=mydate.getMonth()+1;
						myday= mydate.getDate();
						year= mydate.getFullYear();
						if(myweekday == 0)
						weekday=" 星期日 ";
						else if(myweekday == 1)
						weekday=" 星期一 ";
						else if(myweekday == 2)
						weekday=" 星期二 ";
						else if(myweekday == 3)
						weekday=" 星期三 ";
						else if(myweekday == 4)
						weekday=" 星期四 ";
						else if(myweekday == 5)
						weekday=" 星期五 ";
						else if(myweekday == 6)
						weekday=" 星期六 ";
						document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
						//-->
					</script>
				</div>
				<div style="clear: both"></div>
			</div>
		</form>
  </body>
</html>
