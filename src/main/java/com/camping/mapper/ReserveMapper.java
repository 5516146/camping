package com.camping.mapper;

import com.camping.domain.CampVO;
import com.camping.domain.MemberVO;
import com.camping.domain.ReserveVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReserveMapper {

    // 예약 정보를 저장
    public void insertSelectKey(ReserveVO reserveVO);

    // 고객별 예약 정보를 불러옴
    public List<ReserveVO> readMemId(String mem_id);

    // 하나의 예약 정보 자세히 보기
    public ReserveVO readReserveNo(Long reserve_no);

    // 예약 정보 수정
    public int update(ReserveVO reserveVO);

    // 예약 정보 삭제
    public int delete(Long reserve_no);
}
