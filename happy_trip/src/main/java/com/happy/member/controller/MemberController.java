package com.happy.member.controller;

import java.io.IOException;

import com.happy.member.model.dto.MemberDto;
import com.happy.member.model.service.MemberServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberServiceImpl memberService;

	public MemberController() {
		super();
		memberService = MemberServiceImpl.getInstance();
		// System.out.println("유저 생성");
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// System.out.println("user 방문");
		String root = request.getContextPath();
		String action = request.getParameter("action");
		System.out.println(action);
		if (action.equals("signUp")) {
			System.out.println("회원가입!");
			// 회원가입
			MemberDto dto = new MemberDto();
			dto.setUserName(request.getParameter("userName"));
			dto.setUserId(request.getParameter("userId"));
			dto.setUserPw(request.getParameter("userPw"));
			dto.setEmailId(request.getParameter("emailId"));
			dto.setEmailDomain(request.getParameter("emailDomain"));
			dto.setSido(request.getParameter("sido"));
			dto.setGugun(request.getParameter("gugun"));

			if (memberService.signUp(dto)) {
				// 성공
				System.out.println("회원가입 성공" + dto);
			} else {
				// 실패
				System.out.println("회원가입 실패" + dto);
			}
			response.sendRedirect(root);

		} else if (action.equals("signIn")) {
			String flag = request.getParameter("idck");
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");

			MemberDto dto = memberService.getMember(userId);
			if (dto == null || !dto.getUserPw().equals(userPw)) {
				request.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
				response.sendRedirect(root);
				return;
			}

			// System.out.println(flag + " " + userId + " " + userPw + " " +
			// dto.toString());
			// 로그인
			if (memberService.signIn(userId, userPw)) {
				// 성공
				// System.out.println("로그인 성공" + request.getParameter("userId"));

				// 세션 설정
				HttpSession session = request.getSession();
				session.setAttribute("member", dto);

				// 쿠키 설정
				if ("on".equals(flag)) {
					// 쿠키 생성
					Cookie cookie = new Cookie("last_id", userId);
					cookie.setPath(request.getContextPath());
					cookie.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie);
				} else {
					// 쿠키 삭제
					Cookie[] cookies = request.getCookies();
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if ("last_id".equals(cookie.getName())) {
								cookie.setMaxAge(0);
								response.addCookie(cookie);
								break;
							}
						}
					}
				}
			} else {
				// 실패
				System.out.println("로그인 실패" + request.getParameter("userId"));
			}
			response.sendRedirect(root);
		}else if (action.equals("signOut")) {
			// 로그 아웃
			HttpSession session = request.getSession();
			session.removeAttribute("member");
			response.sendRedirect("/happy_trip");
		} else if (action.equals("deleteAccount")) {
			// 회원 탈퇴 -> ID
			if (memberService.deleteAccount(request.getParameter("delete_userId"))) {

				// 성공
				System.out.println("탈퇴 성공" + request.getParameter("delete_userId"));
			} else {
				// 실패
				System.out.println("탈퇴 실패" + request.getParameter("delete_userId"));
			}
			response.sendRedirect(root);
		} else if (action.equals("modify")) {
			System.out.println("수정쪽");
			String userId = request.getParameter("update_userid");
			System.out.println(request.getParameter("update_username"));
			System.out.println(userId + " userID");
			MemberDto dto = memberService.getMember(userId);
			if (!request.getParameter("userPw").equals(dto.getUserPw())) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/user/profile.jsp");
				request.setAttribute("msg", "비밀번호가 틀립니다.");
				dispatcher.forward(request, response);
				return;
			}

			dto.setUserName(request.getParameter("userName"));
			dto.setEmailId(request.getParameter("emailId"));
			dto.setEmailDomain(request.getParameter("emailDomain"));
			dto.setSido(request.getParameter("sido"));
			dto.setGugun(request.getParameter("gugun"));

			if (memberService.modifyMember(dto)) {
				dto = memberService.getMember(request.getParameter("userId"));
				HttpSession session = request.getSession();
				session.setAttribute("member", dto);
			}
			response.sendRedirect(root + "/user/profile.jsp");

		}

		else {
			// 이상한 action
			System.out.println("/user 에서의 action이 이상함 : " + action);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
