package com.exapmle.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exapmle.data.entity.Basic;
import com.exapmle.service.BasicService;

@Controller
public class ViewController {
	@Autowired
	private BasicService basicService;

	@RequestMapping(value = "/service/add")
	public String serviceAdd() {
		System.out.println("ViewController - serviceAdd");
		return "serviceAdd";
	}
	
	
	@RequestMapping(value = "/service/list")
	public String List(Model model) throws Exception {
		System.out.println("ViewController - serviceList");
		List<Basic> list = new ArrayList<Basic>();
		list = (List<Basic>) basicService.basicSelect();
		model.addAttribute("list", list);
		return "list";
	}
	


}
