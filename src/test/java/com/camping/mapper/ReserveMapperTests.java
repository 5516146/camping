package com.camping.mapper;

import com.camping.domain.ReserveVO;
import lombok.Setter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReserveMapperTests {

    @Setter(onMethod_ = @Autowired)
    private ReserveMapper mapper;

    @Test
    public void testInsertSelectKey(){
        ReserveVO reserveVO = new ReserveVO();

        reserveVO.setReserve_people(2L);
        reserveVO.setReserve_price(20000l);
        reserveVO.setCamp_no("A-1");
        reserveVO.setMem_id("kkw");
        reserveVO.setReserve_startDate("2024-03-30");
        reserveVO.setReserve_endDate("2024-03-31");

        mapper.insertSelectKey(reserveVO);
    }

    @Test
    public void testReadMemId(){
       String mem_id = "kkw";

       mapper.readMemId(mem_id);
    }

    @Test
    public void testReadReserveNo(){
        Long reserve_no = 24l;

        mapper.readReserveNo(reserve_no);
    }

    @Test
    public void testUpdate(){
        ReserveVO reserveVO = new ReserveVO();

        reserveVO.setReserve_no(20l);
        reserveVO.setReserve_people(4l);

        mapper.update(reserveVO);
    }

    @Test
    public void testDelete(){
        Long reserve_no = 20l;

        mapper.delete(reserve_no);
    }
}
