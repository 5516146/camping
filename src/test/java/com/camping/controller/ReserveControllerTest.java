package com.camping.controller;

import com.camping.domain.ReserveVO;
import lombok.Setter;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
                        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
public class ReserveControllerTest {
    @Setter(onMethod_ = {@Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup(){
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    public void testRegister() throws Exception{
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/reserve/register")
                .param("reserve_people", "2")
                        .param("reserve_price", "20000")
                        .param("camp_no", "A-1")
                        .param("mem_id", "kkw")
                        .param("reserve_startDate", "2024-03-30")
                        .param("reserve_endDate", "2024-03-31"))
                .andReturn().getModelAndView().getViewName();

    }

}
