package com.camping.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MyPageController {

//	private MyPageService service;

	@GetMapping("/update")
	public void update() {

	}

	/*
	 * @PreAuthorize("principal.username == #board.writer")
	 * 
	 * @PostMapping("/modify") public String modify(BoardVO board, Criteria cri,
	 * RedirectAttributes rttr) { log.info("modify:" + board);
	 * 
	 * if (service.modify(board)) { rttr.addFlashAttribute("result", "success"); }
	 * 
	 * return "redirect:/board/list" + cri.getListLink(); }
	 */


}
