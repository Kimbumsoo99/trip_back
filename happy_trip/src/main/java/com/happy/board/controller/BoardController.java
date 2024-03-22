package com.happy.board.controller;

import java.io.IOException;
import java.util.List;

import com.happy.board.model.dto.BoardDto;
import com.happy.board.model.service.BoardService;
import com.happy.board.model.service.BoardServiceImpl;
import com.happy.member.model.dto.MemberDto;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService boardService = BoardServiceImpl.getInstance();

	public BoardController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		String path = "";
		if ("list".equals(action)) {
			path = list(request, response);
			forward(request, response, path);
		} else if ("view".equals(action)) {
			path = view(request, response);
			forward(request, response, path);
		} else if ("mvwrite".equals(action)) {
			path = "/board/write.jsp";
			redirect(request, response, path);
		} else if ("write".equals(action)) {
			path = write(request, response);
			redirect(request, response, path);
		} else if ("mvmodify".equals(action)) {
			path = mvModify(request, response);
			forward(request, response, path);
		} else if ("modify".equals(action)) {
			path = modify(request, response);
			forward(request, response, path);
		} else if ("delete".equals(action)) {
			path = delete(request, response);
			redirect(request, response, path);
		} else {
			redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if (memberDto != null) {
			try {
				List<BoardDto> list = boardService.listBoard();
				request.setAttribute("boards", list);

				return "/board/list.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				return "/index.jsp";
			}
		} else
			return "/user/login.jsp";
	}

	private String view(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		if (memberDto != null) {
			int boardNo = Integer.parseInt(request.getParameter("board_no"));
			try {
				BoardDto boardDto = boardService.getBoard(boardNo);
				boardService.updateHit(boardNo);
				request.setAttribute("article", boardDto);
				return "/board/view.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				return "/index.jsp";
			}
		} else
			return "/user/login.jsp";
	}

	private String write(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if (memberDto != null) {
			BoardDto boardDto = new BoardDto();
			boardDto.setUserId(memberDto.getUserId());
			boardDto.setSubject(request.getParameter("subject"));
			boardDto.setContent(request.getParameter("content"));
			try {
				boardService.writeBoard(boardDto);
				return "/board?action=list";
			} catch (Exception e) {
				e.printStackTrace();
				return "/index.jsp";
			}
		} else
			return "/user/login.jsp";
	}

	private String mvModify(HttpServletRequest request, HttpServletResponse response) {
		// TODO : 수정하고자하는 글의 글번호를 얻는다.
		int boardNo = Integer.parseInt(request.getParameter("board_no"));
		try {
			BoardDto boardDto = boardService.getBoard(boardNo);
			request.setAttribute("board", boardDto);
			return "/board/modify.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO : 글번호에 해당하는 글정보를 얻고 글정보를 가지고 modify.jsp로 이동.
		return "/index.jsp";
	}

	private String modify(HttpServletRequest request, HttpServletResponse response) {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("board_no"));
		try {
			BoardDto boardDto = boardService.getBoard(boardNo);
			boardDto.setSubject(subject);
			boardDto.setContent(content);
			request.setAttribute("article", boardDto);
			boardService.modifyBoard(boardDto);
			return "/board?action=view&board_no=" + boardNo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/index.jsp";
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO : 삭제할 글 번호를 얻는다.
		int boardNo = Integer.parseInt(request.getParameter("board_no"));
		// TODO : 글번호를 파라미터로 service의 deleteArticle()을 호출.
		try {
			boardService.deleteBoard(boardNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board?action=list";
	}

}
