package com.exapmle;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.example.dao")
public class KwWebAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(KwWebAppApplication.class, args);
	}

}
