<%@ page language="java" pageEncoding="UTF-8"%>
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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function xianluAdd()
           {
              var url="<%=path %>/admin/xianlu/xianluAdd.jsp";
              window.location.href=url;
           }
           
           function yudingMana(xianluId)
           {
                var strUrl = "<%=path %>/yudingMana.action?xianluId="+xianluId;
				var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="24" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="20%">线路名称</td>
					<td width="12%">发团地点</td>
					<td width="12%">发团时间</td>
					<td width="8%">价格</td>
					
					<td width="8%">联系电话</td>
					<td width="8%">联系人</td>
					<td width="12%">发布时间</td>
					<td width="12%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.xianluList}" var="xianlu" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xianlu.xianlumincheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xianlu.fatuandidian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xianlu.fatuanshiian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${xianlu.xianlujiage}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${xianlu.lianxidianhua}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${xianlu.lianxiren}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${xianlu.fabushijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a class="pn-loperator" style="color: red" href="#" onclick="yudingMana(${xianlu.id})">查看预订信息</a>
						<a class="pn-loperator" style="color: red" href="<%=path %>/xianluDel.action?id=${xianlu.id}">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			      <input type="button" value="添加旅游线路" style="width: 80px;" onclick="xianluAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
