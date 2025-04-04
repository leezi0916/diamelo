package com.kh.diamelo.RESTController;

import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/employee")
public class APIEmployeeController {
    private final EmployeeService employeeService;

    @PostMapping("empDelete.erp")
    public String empDelete(String userId) {

        int result;
        UserInfo list = employeeService.empStatusSearch(userId);


        String userStatus = list.getStatus();
        System.out.println(list);
        if(userStatus.equals("Y")) {
            result = employeeService.empStatusDelete(userId);
        }else{
            result = employeeService.empUserDelete(userId);
        }

            return String.valueOf(result);
    }

}
