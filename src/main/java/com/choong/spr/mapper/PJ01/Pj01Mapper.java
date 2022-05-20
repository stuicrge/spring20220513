package com.choong.spr.mapper.PJ01;

import java.util.List;

import com.choong.spr.domain.PJ01.BoardDto;

public interface Pj01Mapper {

	List<BoardDto> selectBoard();

	BoardDto getBoard(int id);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int insertBoard(BoardDto board);

}
