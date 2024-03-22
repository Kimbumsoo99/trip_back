package com.happy.trip.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.happy.trip.model.dto.GugunDto;
import com.happy.trip.model.dto.SidoDto;
import com.happy.trip.model.dto.TripDto;
import com.happy.trip.model.dto.TripSearchDto;
import com.happy.trip.model.service.TripService;
import com.happy.trip.model.service.TripServiceImpl;

@WebServlet("/trip")
public class TripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static TripService tripService = TripServiceImpl.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TripController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String root = request.getContextPath();
			String path = "";
			String action = request.getParameter("action");
			if ("sido".equals(action)) {
				List<SidoDto> sidoList = tripService.getSidoList();

				// JSON으로 변환
				Gson gson = new Gson();
				String json = gson.toJson(sidoList);

				// HTTP 응답 설정
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");

				// JSON 응답 출력
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
			}else if("gugun".equals(action)) {
				String sidoCode = request.getParameter("sidoCode");
				List<GugunDto> gugunList = tripService.getGugunList(sidoCode);
				
				// JSON으로 변환
				Gson gson = new Gson();
				String json = gson.toJson(gugunList);

				// HTTP 응답 설정
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");

				// JSON 응답 출력
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
			}else if("mapping".equals(action)) {
				String sidoCode = request.getParameter("sidoCode");
				String gugunCode = request.getParameter("gugunCode");
				String type = request.getParameter("type");
				
				TripSearchDto param = new TripSearchDto(sidoCode, gugunCode, type);
				List<TripDto> tripList = tripService.getTripList(param);
				
				// JSON으로 변환
				Gson gson = new Gson();
				String json = gson.toJson(tripList);

				// HTTP 응답 설정
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");

				// JSON 응답 출력
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
