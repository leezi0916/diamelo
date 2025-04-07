package com.kh.diamelo.RESTController;

import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.CompanyService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/company")
public class APICompanycontroller {

    private final CompanyService companyService;

    @PostMapping("/status")
    public String updateCompanyStatus(UserInfo userInfo) {
        return companyService.updateStatus(userInfo) > 0 ? "success" : "fail";
    }


}
