package com.choong.spr.mapper.PJ01;

import java.util.List;

import com.choong.spr.domain.PJ01.ReplyDto;

public interface Pj02Mapper {

	int insertReply(ReplyDto reply);

	List<ReplyDto> selectReplyByBoardId(int boardId);

	int deleteReplyById(int id);

	int updateReply(ReplyDto reply);

	int deleteReplyByBoard(int id);

}
