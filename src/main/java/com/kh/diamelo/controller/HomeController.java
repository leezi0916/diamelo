package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Bean에 class를 등록하는 방법으로 @Component을 클래스에 부여한다.
 * @Controller -> Componet + Controller객체가 가질 수 있는 예외처리등의 기능을 포함하는 어노테이션
*/

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {

<<<<<<< HEAD
        return "erpPage/productionPage";
=======

        return "index";
>>>>>>> 2d808f2903f96b1197cea423c2b68b61519a5b99

    }
}
