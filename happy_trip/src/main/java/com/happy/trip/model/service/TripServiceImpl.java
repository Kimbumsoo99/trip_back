package com.happy.trip.model.service;

import java.sql.SQLException;
import java.util.List;

import com.happy.trip.model.dao.TripDao;
import com.happy.trip.model.dao.TripDaoImpl;
import com.happy.trip.model.dto.GugunDto;
import com.happy.trip.model.dto.SidoDto;
import com.happy.trip.model.dto.TripDto;
import com.happy.trip.model.dto.TripSearchDto;

public class TripServiceImpl implements TripService{
	TripDao tripDao = TripDaoImpl.getInstance();
	private static TripService instance = new TripServiceImpl();
	private TripServiceImpl() {}
	public static TripService getInstance() {
		return instance;
	}
	@Override
	public List<TripDto> getTripList(TripSearchDto param) {
		try {
			return tripDao.searchByParam(param);
		} catch (SQLException e) {
			return null;
		}
	}
	@Override
	public List<SidoDto> getSidoList() {
		try {
			return tripDao.searchAllSido();
		} catch (SQLException e) {
			return null;
		}
	}
	@Override
	public List<GugunDto> getGugunList(String sidoCode) {
		try {
			return tripDao.searchGugunBySido(sidoCode);
		} catch (SQLException e) {
			return null;
		}
	}
	
}
