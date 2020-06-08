package com.exapmle.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.exapmle.data.entity.Basic;
import com.exapmle.data.entity.ReqTable;

//@Repository
public interface ReqTableRepository extends CrudRepository<ReqTable,Integer> {
	@Query("SELECT r FROM ReqTable r WHERE r.function_name = ?1") 
	List<ReqTable> findByfunctionName(String function_name);
	
	@Transactional
	@Modifying
    @Query("delete from ReqTable r where r.function_name = ?1")
    void deleteByFunctionName(String function_name);
	
	
}
