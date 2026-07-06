package com.lcb404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcb404.command.PopcornVO;
import com.lcb404.service.PopcornService;

@Controller
@RequestMapping("storemenu")
public class StoreController {
	
	@Autowired
	private PopcornService popcornService;

	@RequestMapping("/store")
	public String store() {
		return "storemenu/store";
	}
	
	@RequestMapping("/storeDetail")
	public String movieDetail(@RequestParam("pno") int pno,Model model) {
		
		model.addAttribute("pno", pno);
		
		return "storemenu/storeDetail";
	}
	
	@ResponseBody
	@GetMapping("/getList/{POPCORN_CODE}")
	public PopcornVO getList(@PathVariable("POPCORN_CODE") int POPCORN_CODE) {
						
		return popcornService.getList(POPCORN_CODE);
	}

	@RequestMapping("/storeDetail1")
	public String movieDetail1() {
		return "storemenu/storeDetail1";
	}

	@RequestMapping("/storeDetail2")
	public String movieDetail2() {
		return "storemenu/storeDetail2";
	}
	
	@RequestMapping("/storeDetail3")
	public String movieDetail3() {
		return "storemenu/storeDetail3";
	}
	
	@RequestMapping("/storeDetail4")
	public String movieDetail4() {
		return "storemenu/storeDetail4";
	}
	
	@RequestMapping("/storeDetail5")
	public String storeDetail1() {
		return "storemenu/storeDetail5";
	}

	@RequestMapping("/storeDetail6")
	public String movieDetail6() {
		return "storemenu/storeDetail6";
	}

	@RequestMapping("/storeDetail7")
	public String movieDetail7() {
		return "storemenu/storeDetail7";
	}
	
	@RequestMapping("/storeDetail8")
	public String movieDetail8() {
		return "storemenu/storeDetail8";
	}

	@RequestMapping("/storeDetail9")
	public String movieDetail9() {
		return "storemenu/storeDetail9";
	}
}
