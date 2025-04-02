package com.kh.diamelo.RESTController;

import com.kh.diamelo.services.MemberService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// @RestController = @Controller + @ResponseBody
// 모든 요청에 대한 응답을 뷰가 아닌 데이터로 직접 http 객체에 하겠다.
@RestController
@RequestMapping("/api/member")
public class APIMemberController {

    private final MemberService memberService;

    @Autowired
    public APIMemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    //@ResponseBody
    @GetMapping("/id")
    public String checkMemberId(@RequestParam(value = "checkId") String userId) {
        int result = memberService.idCheck(userId);

        if (result > 0) {
            // 중복 아이디가 존재 O
            return "Y";
        } else {
            // 중복 아이디가 존재 X
            return "N";
        }
    }
}