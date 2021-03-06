package com.yuanjunye.www.view;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuanjunye.www.po.Manager;
import com.yuanjunye.www.po.Student;
import com.yuanjunye.www.po.User;
import com.yuanjunye.www.service.UserService;

/**
 * 模糊查询用户
 * @author hasee
 *
 */
@WebServlet("/ShowAllUser1Servlet")
public class ShowAllUser1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserService();
	
    public ShowAllUser1Servlet() {
        super();  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("identity").equals("学生")) {
			response.sendRedirect("power.jsp");
			return;
		}
		String keyword = "";
		if(null != request.getParameter("keyword")) {
			keyword = request.getParameter("keyword");
		}else {
			response.sendRedirect("ban.jsp");
			return;
		}
		Map<Student,User> studentMap = userService.searchStudent(keyword);
		Map<Manager,User> managerMap = userService.searchManager(keyword);
		request.setAttribute("studentMap", studentMap);
		request.setAttribute("managerMap", managerMap);
		if(request.getParameter("action").equals("1")) {
			request.getRequestDispatcher("allStudent.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("allManager.jsp").forward(request, response);
		}
	}

}
