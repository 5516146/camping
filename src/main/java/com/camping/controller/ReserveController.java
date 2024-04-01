package com.camping.controller;

import com.camping.domain.ReserveVO;
import com.camping.service.ReserveService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {

    @Setter(onMethod_ = @Autowired)
    private ReserveService reService;

    @GetMapping("/site_choice")
    public void site_choice(){}

    @GetMapping("/enter_info")
    public void enter_info(@RequestParam("site") String site, Model model){
        List<String> startDate = reService.find_sDate(site);
        List<String> endDate =  reService.find_eDate(site);

        model.addAttribute("site", site);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
    }

    // 예약 실행
    @PostMapping("/register")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    public String register(ReserveVO reserveVO, RedirectAttributes rttr){
//        // 포맷 지정
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//        // 포맷 적용하여 문자열로 변환
//        String startDate = sdf.format(reserveVO.getReserve_startDate());
//        String endDate = sdf.format(reserveVO.getReserve_endDate());
//
//        // 포멧팅한 날짜 값을 VO에 저장
//        reserveVO.setReserve_startDate(startDate);
//        reserveVO.setReserve_startDate(endDate);

        // reserve 값을 넘김
        ReserveVO reserve = reService.register(reserveVO);
        rttr.addFlashAttribute("reserveNo", reserve.getReserve_no());

        return "redirect:/reserve/getMem?mem_id=" + reserve.getMem_id();
    }

    // 회원의 모든 예약정보

    @GetMapping("/register")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    public void registerGet(String mem_id, Model model){ }


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
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String mem_id1 = authentication.getName();

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
            rttr.addFlashAttribute("reserve_no", reserveVO.getReserve_no());
        }

        return "redirect:/reserve/getRes?reserve_no=" + reserveVO.getReserve_no();
    }

    // 수정 페이지로 이동
    @GetMapping("/modify")
    public void go_modify(@RequestParam("reserve_no") Long reserve_no, Model model){
        model.addAttribute("reserve", reService.getRes(reserve_no));
    }


    // 예약 취소
    @GetMapping("/remove")
    public String remove(Long reserve_no, String mem_id, RedirectAttributes rttr){
        if (reService.remove(reserve_no)){
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/reserve/getMem?mem_id=" + mem_id;
    }
}
