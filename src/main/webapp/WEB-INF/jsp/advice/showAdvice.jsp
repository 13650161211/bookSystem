<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yuanjunye.www.po.*, java.util.*, com.yuanjunye.www.service.UserService, com.yuanjunye.www.util.PageUtil
,java.text.SimpleDateFormat" %>

<link rel="stylesheet" type="text/css" href="../css/comment.css">

<script type="text/javascript">
function del() {
	var del = window.confirm("确定删除此评论吗？");
	return del;
}
		
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统->查看意见反馈</title>
</head>
<body>
<%@ include file="../head.jsp" %>
	<h1 align="center">意见反馈</h1><hr>
	
	<%
   		String userName = (String)session.getAttribute("userName");
		String identity = (String)session.getAttribute("identity");
		int currentPage = 1;
		PageUtil pUtil = null;
   		if(null != session.getAttribute("adviceList")) {
   			@SuppressWarnings("unchecked")
   			List<Advice> adviceList = (List<Advice>)session.getAttribute("adviceList");  			
   			String pageStr = request.getParameter("page");
   			if (pageStr != null) {
	   			currentPage = Integer.parseInt(pageStr);
   			}
	   		pUtil = new PageUtil(5, adviceList.size(), currentPage);
	   		currentPage = pUtil.getCurrentPage();
   			for (int i = pUtil.getFromIndex(); i < pUtil.getToIndex(); i++)  {
   				Advice advice = adviceList.get(i);
   				String time = "";
   				if(null != advice.getTime() ) {
   					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
   					time = df.format(advice.getTime());
   				}
   
   %>
   <div class="comment">
   			<h1 align="center">第<%=advice.getId() %>条意见</h1>
   			<p>&nbsp;&nbsp;&nbsp;&nbsp;<%=advice.getUserName() %>(<%=advice.getIdentity() %>):</p>
   			<textarea rows="10" cols="80" class="te" readonly="readonly" ><%=advice.getAdvice() %></textarea>
			<div class="time"><%=time %></div>
		<div class="del">
			<a href="../advice/deleteAdvice.do?id=<%=advice.getId() %>" onclick="return del();">
				<img alt="删除" src="../image/upload/image/del.png" width="50" height="50" title="删除">
			</a>
		</div>
			<div class="commentphoto">
				<a href="../user/lookUser.do?userName=<%=advice.getUserName() %>&messageTag=2">
					<img alt="头像" src="../image/upload/<%=advice.getPhoto() %>" width="100px" height="100px;" title="头像">
				</a>
			</div>
   		</div>
 
   <%
   			}  
   		}else {
   			response.sendRedirect("ban.jsp");
   		}
   %>
   <center>
		   记录总数<%=pUtil.getRecordCount() %>条&nbsp;&nbsp;&nbsp; 
		   当前页/总页数:<%=currentPage %>/<%=pUtil.getPageCount()%>&nbsp;&nbsp;&nbsp;
		   每页显示<%=pUtil.getPageSize()%>条<br><br>
		<a href="toShowAdvice.do?page=1">首页</a>
		<a href="toShowAdvice.do?page=<%=(currentPage - 1)%>">上页</a>
		<a href="toShowAdvice.do?page=<%=(currentPage + 1)%>">下页</a>
		<a href="toShowAdvice.do?page=<%=pUtil.getPageCount()%>">末页</a>
	</center>
<%@ include file="../foot.jsp" %>	
</body>
</html>