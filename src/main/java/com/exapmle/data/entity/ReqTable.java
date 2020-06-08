package com.exapmle.data.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "req_table") // 매핑할 테이블_req_table
public class ReqTable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String function_name;
	private String dataKey;
	private String dataID;
	
	public ReqTable() { }
	
	public ReqTable(String function_name, String dataKey, String dataID) {
        this.function_name = function_name;
        this.dataKey = dataKey;
        this.dataID = dataID;
    }

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getfunctionName() {
		return function_name;
	}

	public void setfunctionName(String function_name) {
		this.function_name = function_name;
	}

	public String getDataKey() {
		return dataKey;
	}

	public void setDataKey(String dataKey) {
		this.dataKey = dataKey;
	}

	public String getDataID() {
		return dataID;
	}

	public void setDataID(String dataID) {
		this.dataID = dataID;
	}

}
