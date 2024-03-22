package com.happy.trip.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.happy.trip.model.dto.GugunDto;
import com.happy.trip.model.dto.SidoDto;
import com.happy.trip.model.dto.TripDto;
import com.happy.trip.model.dto.TripSearchDto;

public interface TripDao {
	List<TripDto> searchByParam(TripSearchDto param) throws SQLException;
	List<GugunDto> searchGugunBySido(String sido) throws SQLException;
	List<SidoDto> searchAllSido() throws SQLException;
}
