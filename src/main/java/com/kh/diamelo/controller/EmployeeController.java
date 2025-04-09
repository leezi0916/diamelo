package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.EmployeeService;
import com.kh.diamelo.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;


@RequiredArgsConstructor
@Controller
public class EmployeeController {
    private final EmployeeService employeeService;

    // 인사관리 페이지로 가기
    @GetMapping("employee.erp")
    public String employee() {
        return "erpPage/employeePage";
    }

    // 인사 관리자 페이지로 가기
    @GetMapping("empAdmin.erp")
    public String empAdmin() {
        return "erpPage/employeeAdminPage";
    }

    //인사 상세 페이지에서 수정하기 눌렀을 때의 redirect
    @PostMapping("empAdmin.erp")
    public String empAdminPost() {
        return null;
    }

    @GetMapping("empList.erp")
    public String selectUserInfoList(@RequestParam(defaultValue = "1") int epage, Model model,HttpSession session) {
        String svg = "<svg width=\"25\"\n" +
                "                                height=\"25\"\n" +
                "                                viewBox=\"0 0 25 25\"\n" +
                "                                fill=\"none\"\n" +
                "                                xmlns=\"http://www.w3.org/2000/svg\"\n" +
                "                                xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n" +
                "                            <rect width=\"25\" height=\"25\" fill=\"url(#pattern0_240_5982)\" />\n" +
                "                            <defs>\n" +
                "                                <pattern id=\"pattern0_240_5982\"\n" +
                "                                        patternContentUnits=\"objectBoundingBox\"\n" +
                "                                        width=\"1\"\n" +
                "                                        height=\"1\">\n" +
                "                                    <use xlink:href=\"#image0_240_5982\" transform=\"scale(0.0104167)\" />\n" +
                "                                </pattern>\n" +
                "                                <image id=\"image0_240_5982\"\n" +
                "                                        width=\"96\"\n" +
                "                                        height=\"96\"\n" +
                "                                        preserveAspectRatio=\"none\"\n" +
                "                                        xlink:href=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACsUlEQVR4nO2dS2oUURSGv1EcGUF8xS0k7sQgErIEwQXoMgxR1OBMXINDdRNRCA7jTAQfiSKScKXgNoikbUmn66vb/X9wJk0e/39O1Tnn9qAKQgghhDa4DtwHXgL7wPca+/Wze8CKLXIeWQFeAL+AMiG6n3kOXLNFzwu3gC//kfi/4zOwbotvnbvA8SmSP4rud+/YJlplHTiaIvmj6P7GTdtMa1wCPp5B8kfxCbhim2qJZ2eY/FHs2KZa4TLwYwYF+AlcZQ65ATwE3gKHM0hcOSG6vX8DOF/jNrDX0/8+rF63gTUz8eeAp1NuKeWUyb94gp7usw89a+m8PwGWjOS/6dlsqdFd+ePYlDS97rsIO5LRUlvOOJZFXY/77PnHAy3ABVFXd95Y7aMA26LJUgfuODZkbVt9FOCdbHLvH0P4vaxtt48CfJNNlrrtbNaev1yvfDv5peZm5kwSMe8U278uQEb3rwuQ0f3rAmR0/7oAGd2/LkBG968LkNH96wJkdP/TCigDj0mkAKQAuQNICyItKDOADGEyhLMFkTWUrKE5iNHMQax1iu1fFyCj+9cFyOj+dQEyun9dgIzuXxcgo/vXBcjo/qcVUOSYlhSAFCB3AGlBpAVlBpAhTIZwtiCyhpI1NAcxmjmItU6x/esCZHT/ugAZ3b8uQEb3rwuQ0f3rAmR0/7oAGd3/tALKwGMSKQApQO4A0oJIC8oMIEOYDOFsQWQNJWtoDmI0cxBrnWL71wXI6P51ATK6f12AjO5fFyCj+9cFyOj+dQEyuv+DGX8dXBqOr4vw6OIy4NhdhId3lwHHgz4KsHZGr5cqcxa9Pb6e+toO23AZWDyiR5bqazts02Ug8cp4j8xSfW3HIrejo3rl9578P1mtb47YXZAV9aB63eqz54cQQgghhBBCCCEEmuc3e7uN+TUc9UcAAAAASUVORK5CYII=\"/>\n" +
                "                            </defs>\n" +
                "                        </svg>";
        
        int UserCount = employeeService.selectUserInfoCount();
        PageInfo pi = new PageInfo(UserCount, epage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectUserInfoList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "인사 관리");
        return "erpPage/employeePage";
    }

    @GetMapping("empAdminList.erp")
    public String selectAdminList(@RequestParam(defaultValue = "1") int epage, Model model) {
        int UserCount = employeeService.selectAdminUserInfoCount();
        PageInfo pi = new PageInfo(UserCount, epage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectAdminList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "erpPage/employeeAdminPage";
    }

    // 인사 상세 페이지로 가기
    @GetMapping("empDetail.erp")
    public String selectEmployeeDetail(@RequestParam(value = "uId") String userId, Model model) {

        UserInfo empDetail = employeeService.selectEmployeeDetail(userId);



        model.addAttribute("e", empDetail);
        return "erpPage/employeeDetailPage";
    }

    @GetMapping("empSearch.erp")
    public String selectEmployeeSearch(@RequestParam(defaultValue = "1") int cpage, String userName, String jobCode, Model model) {
        int UserCount = employeeService.selectSearchUserInfoCount(userName, jobCode);
        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectSearchUserInfoList(pi, userName, jobCode);

        model.addAttribute("userName", userName);
        model.addAttribute("jobCode", jobCode);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "erpPage/employeePage";
    }

    @GetMapping("empAdminSearch.erp")
    public String selectAdminSearch(@RequestParam(defaultValue = "1") int cpage, String userId, String userName, Model model) {
        int UserCount = employeeService.selectAdminSearchUserInfoCount(userId, userName);
        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectAdminSearchUserInfoList(pi, userId, userName);

        model.addAttribute("userName", userName);
        model.addAttribute("userId", userId);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "erpPage/employeeAdminPage";
    }

    @PostMapping("empDetailSearch.erp")
    public String updateEmployeeDetailSearch(@ModelAttribute UserInfo userInfo, MultipartFile refile, HttpSession session, Model model) {
        int imgSearch = employeeService.employeeDetailImageSearch(userInfo);
        int result = employeeService.updateEmployeeDetailSearch(userInfo);
        if (refile != null && !refile.getOriginalFilename().isEmpty()) {
            //기존 첨부파일 삭제
            if(userInfo.getOriginName() != null && !userInfo.getOriginName().equals("")){
                new File(session.getServletContext().getRealPath(userInfo.getOriginName())).delete();
            }
            String changeName = Template.saveFile(refile, session, "/resources/uploadFile/");
            userInfo.setChangeName("/resources/uploadFile/" + changeName);
            userInfo.setOriginName(refile.getOriginalFilename());

            System.out.println(userInfo);
            if(imgSearch==0){
                employeeService.employeeDetailImageInsert(userInfo);
            }else{
                employeeService.updateEmployeeImage(userInfo);
            }
        }
        if (result > 0) {
            session.setAttribute("alertMsg", "수정 성공");
            return "redirect:/empAdminList.erp";
        } else {
            model.addAttribute("errorMsg", "수정 실패");
            return "common/errorPage";
        }
    }

}