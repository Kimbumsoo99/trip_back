package com.happy.trip.model.service;

import java.util.List;

import com.happy.trip.model.dto.GugunDto;
import com.happy.trip.model.dto.SidoDto;
import com.happy.trip.model.dto.TripDto;
import com.happy.trip.model.dto.TripSearchDto;

public interface TripService {
	List<TripDto> getTripList(TripSearchDto param);
	List<SidoDto> getSidoList();
	List<GugunDto> getGugunList(String sidoCode);
}
