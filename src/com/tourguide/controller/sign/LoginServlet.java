package com.tourguide.controller.sign;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tourguide.dao.MmMstDAO;
import com.tourguide.dto.MmMstVO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		MmMstVO vo = new MmMstVO();
		String mmId = request.getParameter("mmId");
		String mmPwd = request.getParameter("mmPwd");
		
		MmMstDAO dao = new MmMstDAO();
		int check= dao.mmMstcheckId(mmId, mmPwd);
		System.out.println(check);
		if(check == 1) {
		vo = dao.mmMstGetOne(mmId);
		
		int stsCode = vo.getStsCode();

		HttpSession session = request.getSession();
		
		session.setAttribute("mmId", mmId);
		session.setAttribute("stsCode", stsCode );

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

}
