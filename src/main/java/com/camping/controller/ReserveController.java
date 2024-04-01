package com.camping.controller;

import com.camping.domain.ReserveVO;
import com.camping.service.ReserveService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {

    @Setter(onMethod_ = @Autowired)
    private ReserveService reService;

    @GetMapping("/site_choice")
    public void site_choice(){}

    @GetMapping("/go_modify")
    public void go_modify(@RequestParam("reserve_no") Long reserve_no, Model model){
        model.addAttribute("reserve", reService.getRes(reserve_no));
    }

    @GetMapping("/enter_info")
    public void enter_info(@RequestParam("site") String site, Model model){
        model.addAttribute("site", site);
    }

    // 예약 실행
    @PostMapping("/register")
    public void register(ReserveVO reserveVO, RedirectAttributes rttr){
        reService.register(reserveVO);
//        return "redirect:/reserve/register";
    }

//    // 예약 실행
//    @PostMapping("/register")
//    public void register(ReserveVO reserveVO, RedirectAttributes rttr){
//        reService.register(reserveVO);
//
//        return "/reserve/getMem";
//    }

    // 회원의 모든 예약정보
    @GetMapping("/getMem")
    public void getMem(String mem_id, Model model){
        model.addAttribute("reserve", reService.getMem(mem_id));
    }

    // 예약 1건의 예약정보
    @GetMapping("/getRes")
    public void getRes(Long reserve_no, Model model){
        model.addAttribute("reserve", reService.getRes(reserve_no));
    }

    // 예약 수정
    @PostMapping("/modify")
    public String modify(ReserveVO reserveVO, RedirectAttributes rttr){
        if (reService.modify(reserveVO)){
            rttr.addFlashAttribute("reserve_no", reserveVO.getMem_id());
        }

        return "redirect:/register/getRes?reserve_no=" + reserveVO.getReserve_no();
    }

    // 예약 취소
    @PostMapping("/remove")
    public String remove(Long reserve_no, RedirectAttributes rttr){
        if (reService.remove(reserve_no)){
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/register/getMem";
    }
}
