package com.exapmle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exapmle.data.entity.Basic;
import com.exapmle.data.entity.ReqTable;
import com.exapmle.repository.BasicRepository;
import com.exapmle.repository.ReqTableRepository;

@Service
@Transactional
public class BasicService {
	@Autowired
	private BasicRepository BasicRepo;
	
	@Autowired
	private ReqTableRepository RTRepo;

	
	public Iterable<Basic> basicSelect(){//Basic select 쿼리
		System.out.println("BasicService - basicSelect");
		return BasicRepo.findAll();
	}
	
	public Basic findByfunctionName(String FunctionName){//Basic select 쿼리
		System.out.println("BasicService - findByfunctionName");
		return BasicRepo.findByfunctionName(FunctionName);
	}
	
	public List<ReqTable> rtfindByfunctionName(String FunctionName){//Basic select 쿼리
		System.out.println("BasicService - rtfindByfunctionName");
		return RTRepo.findByfunctionName(FunctionName);
	}

}
