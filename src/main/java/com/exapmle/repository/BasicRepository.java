package com.exapmle.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.exapmle.data.entity.Basic;

//@Repository
public interface BasicRepository extends CrudRepository<Basic,Integer> {
	@Query("SELECT b FROM Basic b WHERE b.function_name = ?1") 
	Basic findByfunctionName(String function_name);
	
	@Transactional
	@Modifying
    @Query("delete from Basic b where b.function_name = ?1")
    void deleteByFunctionName(String function_name);


}
