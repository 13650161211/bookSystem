<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yuanjunye.www.po.*, java.util.* " %>
<script type="text/javascript">
	function pass() {
		var pass = window.confirm("确定通过申请吗？");
		return pass;
	} 
	function reject() {
		var reject = window.confirm("确定不同意此申请吗？");
		return reject;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统->处理用户借阅申请</title>
</head>
<body>
<%@ include file="head.jsp" %>
	<%	
	Iterator<Map.Entry<StudentBorrow,SomeName>> qs1 = null;
	if(null != request.getAttribute("stBorrowMap")) {
		@SuppressWarnings("unchecked")
		Map<StudentBorrow,SomeName> stBorrowMap = (Map<StudentBorrow,SomeName>)request.getAttribute("stBorrowMap");
		Set<Map.Entry<StudentBorrow,SomeName>> stBorrowSet = stBorrowMap.entrySet();
		qs1 = stBorrowSet.iterator();
	}else {
		response.sendRedirect("ban.jsp");
		return;
	}
	%>

	<h1 align="center"><font color="red">处理用户借阅申请</font></h1><hr>
	
	<center>
		<a href="PassBorrowServlet?action=1">学生信息</a>&nbsp;&nbsp;&nbsp;
		<a href="PassBorrowServlet?action=2">管理员信息</a>
	</center>
	<h2 align="center" ><font color="blue">学生</font></h2>	
	<table border="1" align="center" style="background-color:#88FFAA">
	<tr> 
			<th width="40"></th>
			<th width="100" >图书编号</th>
			<th width="120">图书名</th>
			<th width="150">学号</th>
			<th width="100">姓名</th>
			<th width="80">用户名</th>
			<th width="80">借阅天数</th>
			<th width="120">申请时间</th>
			<th width="80">状态</th>
			<th width="100" align="center">操作</th>
		</tr>
	<%
		int i = 1;
		while(qs1.hasNext())
		{
			Map.Entry<StudentBorrow,SomeName> set1 = qs1.next();
			StudentBorrow borrow = set1.getKey();
			SomeName someName = set1.getValue();
	%>
		<tr>
			<td><%=i++ %></td>
			<td><a href="BookDetailsServleet?bookId=<%=borrow.getBookId() %>&tag=4"><%=borrow.getBookId() %></a></td>
			<td><a href="BookDetailsServleet?bookId=<%=borrow.getBookId() %>&tag=4"><%=someName.getBookName() %></a></td>
			<td><%=borrow.getReaderId() %></td>
			<td><%=someName.getReaderName() %></td>
			<td><%=borrow.getUserName() %></td>
			<td><%=borrow.getDay() %></td>
			<td><%=borrow.getApplyTime() %></td>
			<td><%=borrow.getStatus() %></td>
			<td>
				<a href="PassBorrowActionServlet?action=pass&id=<%=borrow.getId() %>&identity=student" onclick="return pass();">同意</a>&nbsp;&nbsp;
				<a href="PassBorrowActionServlet?action=reject&id=<%=borrow.getId() %>&identity=student" onclick="return reject();">不同意</a>
			</td>
		</tr>
	
	<%
		}
	%>
	
	</table>
	<br>
		<center>
			<a href="Login1Servlet"><img  src="image/upload/image/cancel.jpg"></a>
		</center>
		<%@ include file="foot.jsp" %>
</body>
</html>