package com.choong.spr.domain.PJ01;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReplyDto {
	private int id;
	private int boardId; //board_id 별칭필수!
	private String content;
	private LocalDateTime inserted;
}
