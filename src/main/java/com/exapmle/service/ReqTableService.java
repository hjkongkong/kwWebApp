package com.exapmle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exapmle.data.entity.ReqTable;
import com.exapmle.repository.ReqTableRepository;

@Service
public class ReqTableService {
	@Autowired
	private ReqTableRepository RTRepo;
	
	public void RTInsert(ReqTable reqTable) { //insert 쿼리
		RTRepo.save(reqTable);
	}
	
	public Iterable<ReqTable> RTSelect(){//select 쿼리
		return RTRepo.findAll();
	}
}
