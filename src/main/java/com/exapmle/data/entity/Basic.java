package com.exapmle.data.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;

//@Getter
//@Setter
@Entity
@Table(name = "basic") // 매핑할 테이블_basic
public class Basic {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String function_name;
	private String url;
	private String contentType;
	private String type;
	
	public Basic() { }
	
	public Basic(String function_name, String url, String contentType, String type) {
        this.function_name = function_name;
        this.url = url;
        this.contentType = contentType;
        this.type = type;
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
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

//    private @Column(name = "function_name") String function_name;
//    private @Column(name = "url") String url;
//    private @Column(name = "contentType") String contentType;
//    private @Column(name = "type") String type;
}
