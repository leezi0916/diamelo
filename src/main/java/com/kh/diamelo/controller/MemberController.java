package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public MemberController(MemberService memberService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.memberService = memberService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @GetMapping("logout.me")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 제거
        return "redirect:/loginForm.me";
    }


    @PostMapping("signUp.me")
    public String insertMember(UserInfo userInfo, HttpSession session, Model model) {
         /*
            비밀번호를 사용자 입력 그대로 저장한다.(평문)
            Bcrypt방식을 이용해서 암호화작업 후 저장함
            -> 스프링 시큐리티에서 제공하는 모듈을 이용 (pom.xml에 라이브러리 추가 후 빈에 객체등록)
         */

        // 암호화
        String pwd = bCryptPasswordEncoder.encode(userInfo.getUserPwd());
        userInfo.setUserPwd(pwd);

        int result = memberService.insertMember(userInfo);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입을 완료되었습니다. 관리자에게 문의 후 로그인 하세요.");
            return "redirect:/loginForm.me";
        } else {
            model.addAttribute("errorMsg", "회원가입 실패");
            return "common/errorPage";
        }
    }

    @PostMapping("login.me")
    public String login(UserInfo userInfo, HttpSession session, Model model) {
        UserInfo loginMember = memberService.loginMember(userInfo.getUserId());

        // loginMember의 userPwd --> 암호화된 userPwd
        // UserInfo의 userPwd --> 암호화 전의 userPwd(평문)

        // bCryptPasswordEncoder.matches(평문,암호문) -> 해당 비밀번호가 암호화된 비밀번호와 일치하면 true 아니면 false반환

        if (loginMember == null) {
            session.setAttribute("errorMsg", "아이디를 찾을 수 없습니다.");
            return ("common/errorPage");
        } else if (!bCryptPasswordEncoder.matches(userInfo.getUserPwd(), loginMember.getUserPwd())) {
            model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
            return ("common/errorPage");
        } else {
            session.setAttribute("loginUser", loginMember);
            return "redirect:/";
        }
    }
}
