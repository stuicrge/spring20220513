package com.choong.spr.service.PJ01;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.PJ01.BoardDto;
import com.choong.spr.mapper.PJ01.Pj01Mapper;
import com.choong.spr.mapper.PJ01.Pj02Mapper;

@Service
public class Pj01Service {

	
	@Autowired
	private Pj01Mapper mapper;
	@Autowired
	private Pj02Mapper replyMapper;
	
	public List<BoardDto> listBoard() {
		
		return mapper.selectBoard();
	}


	public BoardDto getBoard(int id) {
		// TODO Auto-generated method stub
		return mapper.getBoard(id);
	}


	public boolean updateBoard(BoardDto board) {
		int cnt=mapper.updateBoard(board);
		return cnt==1;
	}


	@Transactional
	public boolean removeBoardById(int id) {
		
		//댓글 지우기
		replyMapper.deleteReplyByBoard(id);
		
		// for transaction(고의로 오류발생시킴)
		//exception
		//int i = 3 / 0;
		
		
		//게시물 지우기
		int cnt = mapper.deleteBoard(id);
		
		return cnt==1;
	}


	public boolean addBoard(BoardDto board) {
		int cnt = mapper.insertBoard(board);
		return cnt==1;
	}

}
