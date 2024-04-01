package com.camping.service;

import java.util.List;

import com.camping.domain.NoticeVO;
import com.camping.mapper.NoticeMapper;

public interface NoticeService {
	
	public void noticeregister(NoticeVO notice);
	
	public NoticeVO noticeget(int board_no);
	
	public boolean noticemodify(NoticeVO notice);
	
	public boolean noticeremove(int board_no);
	
	public List<NoticeVO> getList();
	
	public boolean plusCnt(int board_no);

}
