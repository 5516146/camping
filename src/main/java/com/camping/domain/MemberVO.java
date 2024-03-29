package com.camping.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private Date mem_date;
	private boolean enabled;
	
	private List<AuthVO> authList;

}
