package com.kh.diamelo.RESTController;

import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.CompanyService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/company")
public class APICompanycontroller {

    private final CompanyService companyService;

    @PostMapping("/commit")
    public String updateCompanyStatus(@RequestBody Map<String, ArrayList<String>> data, HttpSession session) {
        ArrayList<String> list = data.get("userId");

        int result = 0;
        for(String id : list){
            UserInfo userInfo = new UserInfo();
            userInfo.setUserId(id);

            UserInfo user = companyService.selectCompanyStatus(userInfo);
            if(user.getStatus().equals("Y") || user.getStatus().equals("N")){
                return "redirect:/compAdmin.erp";
            }else {
                result = companyService.updateStatusCommit(userInfo);
            }
        }

        return result > 0 ? "success" : "fail";
    }

    @PostMapping("/return")
    public String returnCompanyStatus(@RequestBody Map<String, ArrayList<String>> data) {
        ArrayList<String> list = data.get("userId");

        int result = 0;
        for(String id : list){
            UserInfo userInfo = new UserInfo();
            userInfo.setUserId(id);

            UserInfo user = companyService.selectCompanyStatus(userInfo);
            if(user.getStatus().equals("Y") || user.getStatus().equals("N")){
                return "redirect:/compAdmin.erp";
            }else {
                result = companyService.updateStatusReturn(userInfo);
            }
        }

        return result > 0 ? "success" : "fail";
    }

}
