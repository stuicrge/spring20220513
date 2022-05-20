package com.choong.spr.controller.PJ01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.choong.spr.domain.PJ01.ReplyDto;

import com.choong.spr.service.PJ01.Pj02Service;

@Controller
@RequestMapping("ex02")
public class Pj02Controller {
	@Autowired
	private Pj02Service service;
	
	@PostMapping("reply/add")
	public String addReply(ReplyDto reply) {
		boolean success = service.addReply(reply);
		
		return "redirect:/ex01/pj/" + reply.getBoardId();
	}
	
	
	@PostMapping("reply/remove")
	public String removeReply(ReplyDto reply) {
		boolean success = service.removeReply(reply.getId());
		
		return "redirect:/ex01/pj/" + reply.getBoardId();
	}
	
	@PostMapping("reply/modify")
	public String modifyReply(ReplyDto reply) {
		boolean success = service.modifyReply(reply);
		return "redirect:/ex01/pj/" + reply.getBoardId();
	}
}
