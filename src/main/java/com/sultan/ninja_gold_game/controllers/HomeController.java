package com.sultan.ninja_gold_game.controllers;

import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session) {
		if(session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		ArrayList<String> activities = new ArrayList<String>();
		
		if(session.getAttribute("activities") == null) {
			session.setAttribute("activities", activities);
		}
		
		return "index.jsp";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String getGold(@RequestParam(name = "location") String location, HttpSession session) {
		
		int gold = (int) session.getAttribute("gold");
		Random random = new Random();
		int random_num = 0;
		
		ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities");
		
		LocalDateTime timestamp = LocalDateTime.now();
		DateTimeFormatter formatted = DateTimeFormatter.ofPattern("MMMM dd yyyy h:mma");
		
		
		if(location.equals("farm")) {
			random_num = random.nextInt(20 - 10 + 1) + 10;
		}
		else if(location.equals("cave")) {
			random_num = random.nextInt(10 - 5 + 1) + 5;
		}
		else if(location.equals("house")) {
			random_num = random.nextInt(5 - 2 + 1) + 2;
		}
		else if(location.equals("casino")) {
			random_num = random.nextInt(50 + 50 + 1) - 50;
			System.out.println(random_num);
		}
		else if(location.equals("spa")) {
			random_num = random.nextInt(-5 + 20 + 1) - 20;
			System.out.println(random_num);
		}
		
		
		if(random_num < 0) {
			activities.add(0, "You entered a " + location + " and lost "+ Math.abs(random_num) +" gold. (" + formatted.format(timestamp) + ")");
		}
		else {
			activities.add(0, "You entered a " + location + " and earned "+ random_num +" gold. (" + formatted.format(timestamp) + ")");
		}
		
		session.setAttribute("gold", gold + random_num);
		session.setAttribute("activities", activities);             
		System.out.println(activities);
		
		if((int) session.getAttribute("gold") < -50) {
			return "redirect:/prison";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/clear", method = RequestMethod.GET)
	public String clear(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/prison", method = RequestMethod.GET)
	public String prison(HttpSession session) {
		
		return "prison.jsp";
	}
}
