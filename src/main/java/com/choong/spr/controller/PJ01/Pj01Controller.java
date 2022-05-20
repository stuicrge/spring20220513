package com.choong.spr.controller.PJ01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.choong.spr.domain.PJ01.ReplyDto;

import com.choong.spr.domain.PJ01.BoardDto;
import com.choong.spr.service.PJ01.Pj01Service;
import com.choong.spr.service.PJ01.Pj02Service;

@Controller
@RequestMapping("ex01")
public class Pj01Controller {

	@Autowired
	private Pj01Service service;
	@Autowired
	private Pj02Service replyService;
	
	@GetMapping("pj/list")
	public void listBoard(Model model)
	{
		List<BoardDto> list = service.listBoard();
		model.addAttribute("pjList", list);
		
	}
	@GetMapping("pj/{id}")
	public String getBoard(@PathVariable("id") int id, Model model) {
		
		BoardDto dto=service.getBoard(id);
		List<ReplyDto> replyList = replyService.listReplyByBoardId(id);
		
		model.addAttribute("board",dto);
		model.addAttribute("replyList",replyList);
		
		return "/ex01/pj/get";
		
	}
	@PostMapping("pj/modify")
	public String modifyBoard(BoardDto board) {
		boolean success = service.updateBoard(board);
		
		if(success) {
			
		} else {
			
		}
			
		return "redirect:/ex01/pj/" + board.getId();
		
	}
	
	@PostMapping("/pj/remove")
	public String removeBoard(int id) {
		boolean success = service.removeBoardById(id);
		if(success) {
			
		}	else {
			
		}
		return "redirect:/ex01/pj/list";
	}
	
	@GetMapping("pj/write")
	public void writeBoard() {
		
	}
	
	@PostMapping("pj/write")
	public String writeBoardProcess(BoardDto board) {
		boolean success = service.addBoard(board);
		
		if(success) {
			
		} else {
			
		}
		
		int id = 1;
		
		return "redirect:/ex01/pj/" + board.getId();
	}
}
