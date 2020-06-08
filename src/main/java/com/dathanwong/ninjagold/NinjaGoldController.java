package com.dathanwong.ninjagold;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NinjaGoldController {
	
	@RequestMapping("/")
	public String home(HttpSession session) {
		Integer gold;
		if(session.getAttribute("gold") == null) {
			gold = 0;
			session.setAttribute("gold", gold);
		}else {
			gold = (Integer) session.getAttribute("gold");
		}
		if(session.getAttribute("events") == null) {
			ArrayList<String> events = new ArrayList<String>();
			session.setAttribute("events", events);
		}
		if(gold < 0) {
			return "redirect:/prison";
		}
		System.out.println(gold);
		return "home.jsp";
	}
	
	@RequestMapping("/farm")
	public String farm(HttpSession session) {
		int gold = increaseGold(10, 20, session);
		this.addEvent("You entered a farm and earned " + gold + " gold", session);
		return "redirect:/";
	}
	
	@RequestMapping("/cave")
	public String cave(HttpSession session) {
		int gold = increaseGold(5, 10, session);
		this.addEvent("You entered a cave and earned " + gold + " gold", session);
		return "redirect:/";
	}
	
	@RequestMapping("/house")
	public String house(HttpSession session) {
		int gold = increaseGold(2, 5, session);
		this.addEvent("You entered a house and earned" + gold + " gold", session);
		return "redirect:/";
	}
	
	@RequestMapping("/casino")
	public String casino(HttpSession session) {
		Random rand = new Random();
		Boolean add = rand.nextBoolean();
		int value = rand.nextInt(51);
		int gold = (int) session.getAttribute("gold");
		if(add) {
			gold += value;
			this.addEvent("You entered a casino and earned " + value + " gold", session);
		}else {
			gold -= value;
			this.addEvent("You entered a casino and lost " + value + " gold...Ouch", session);
		}
		session.setAttribute("gold", gold);
		return "redirect:/";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("gold", 0);
		ArrayList<String> events = new ArrayList<String>();
		session.setAttribute("events", events);
		return "redirect:/";
	}
	
	@RequestMapping("/prison")
	public String prison() {
		System.out.println("You hit the prison");
		return "prison.jsp";
	}
	
	private int increaseGold(int lowerBound, int upperBound, HttpSession session) {
		int gold = (int) session.getAttribute("gold");
		Random rand = new Random();
		int change = rand.nextInt(upperBound-lowerBound+1) + lowerBound;
		gold += change;
		session.setAttribute("gold", gold);
		return change;
	}
	
	private void addEvent(String event, HttpSession session) {
		ArrayList<String> events = (ArrayList<String>) session.getAttribute("events");
		System.out.println(events.toString());
		Date date = new Date();
		events.add(event + "(" + date +")");
		session.setAttribute("events", events);
		return;
	}
}
