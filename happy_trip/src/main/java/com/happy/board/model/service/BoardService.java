package com.happy.board.model.service;

import java.util.List;

import com.happy.board.model.dto.BoardDto;

public interface BoardService {
	
	void writeBoard(BoardDto boardDto) throws Exception;
	List<BoardDto> listBoard() throws Exception;
	BoardDto getBoard(int boardNo) throws Exception;
	void updateHit(int boardNo) throws Exception;
	void modifyBoard(BoardDto boardDto) throws Exception;
	void deleteBoard(int boardNo) throws Exception;
	
}
