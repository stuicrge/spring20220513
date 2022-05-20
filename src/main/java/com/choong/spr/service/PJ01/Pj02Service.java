package com.choong.spr.service.PJ01;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choong.spr.domain.PJ01.ReplyDto;
import com.choong.spr.mapper.PJ01.Pj02Mapper;

@Service
public class Pj02Service {

	@Autowired 
	private Pj02Mapper mapper;
	
	public boolean addReply(ReplyDto reply) {
		
//		reply.setInserted(LocalDateTime.now());
		
		int cnt = mapper.insertReply(reply);
		return cnt==1;
	}

	public List<ReplyDto> listReplyByBoardId(int boardId) {

		
		return mapper.selectReplyByBoardId(boardId);
	}
	
	
	public boolean removeReply(int id) {
		int cnt = mapper.deleteReplyById(id);
		return cnt==1;
	}

	public boolean modifyReply(ReplyDto reply) {
		int cnt = mapper.updateReply(reply);
		return cnt==1;
	}

}
