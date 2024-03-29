package com.camping.service;

import com.camping.domain.ReserveVO;
import lombok.Setter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReserveServiceTest {

    @Setter(onMethod_ = @Autowired)
    private ReserveService service;

    @Test
    public void testRegister(){
        ReserveVO reserveVO = new ReserveVO();

        reserveVO.setReserve_people(2L);
        reserveVO.setReserve_price(20000l);
        reserveVO.setCamp_no("A-1");
        reserveVO.setMem_id("kkw");
        reserveVO.setReserve_startDate("2024-03-30");
        reserveVO.setReserve_endDate("2024-03-31");

       service.register(reserveVO);
    }

    @Test
    public void testGetMem(){
        String mem_id = "kkw";

        service.getMem(mem_id);
    }

    @Test
    public void testGetRes(){
        Long reserve_no = 90l;

        service.getRes(reserve_no);
    }

    @Test
    public void testModify(){
        ReserveVO reserveVO = new ReserveVO();

        reserveVO.setReserve_no(90l);
        reserveVO.setReserve_people(4l);

        service.modify(reserveVO);
    }

    @Test
    public void testRemove(){
        Long reserve_no = 22l;

        service.remove(reserve_no);
    }
}
