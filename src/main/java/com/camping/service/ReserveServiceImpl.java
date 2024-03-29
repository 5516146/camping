package com.camping.service;

import com.camping.domain.ReserveVO;
import com.camping.mapper.ReserveMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ReserveServiceImpl implements ReserveService {

    @Setter(onMethod_ = @Autowired)
    private ReserveMapper reMapper;

    // 새로운 예약
    @Override
    public void register(ReserveVO reserveVO) {
        reserveVO.setReserve_people(2L);
        reserveVO.setReserve_price(20000l);
        reserveVO.setCamp_no("A-1");
        reserveVO.setMem_id("kkw");
        reserveVO.setReserve_startDate("2024-03-30");
        reserveVO.setReserve_endDate("2024-03-31");

        reMapper.insertSelectKey(reserveVO);
    }

    // 예약 목록
    @Override
    public List<ReserveVO> getMem(String mem_id) {
        return reMapper.readMemId(mem_id);
    }

    @Override
    public ReserveVO getRes(Long reserve_no) {
        return reMapper.readReserveNo(reserve_no);
    }

    // 예약 변경
    @Override
    public boolean modify(ReserveVO reserveVO) {
        return reMapper.update(reserveVO) == 1;
    }

    // 예약 취소
    @Override
    public boolean remove(Long reserve_no) {
        return reMapper.delete(reserve_no) == 1;
    }
}
