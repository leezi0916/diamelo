package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.User_Info;
import com.kh.diamelo.services.InventoryService;
import com.kh.diamelo.services.ProductService;
import com.kh.diamelo.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class InventoryController {
    private final InventoryService inventoryService;

//    @Autowired
//    private ProductService productService;

    // 재고관리 페이지로 가기
    @GetMapping("inv.erp")

    public String inventory(@RequestParam(value = "cpage", defaultValue = "1") int cpage,
                            @RequestParam(value = "tab", defaultValue = "product") String tab,
                            Model model) {



        int productCount = inventoryService.selectProductCount();
        model.addAttribute("pCount",productCount);
        System.out.println("productCount: " + productCount);

        int materialCount = inventoryService.selectMaterialCount();
        model.addAttribute("mCount",materialCount);
        System.out.println("materialCount: " + materialCount);

        // 현재 탭에 따라 전체 개수 설정
        int totalCount = (tab.equals("product")) ? productCount : materialCount;

        PageInfo pi = new PageInfo(totalCount, cpage, 10, 10);
        System.out.println("pi: " + pi);

        ArrayList<Product> list ;
        if (tab.equals("product")) {
            list = inventoryService.selectProductList(pi); // 제품 리스트 조회
        } else {
            list = inventoryService.selectMaterialList(pi); // 재료 리스트 조회
        }

        System.out.println("list: " + list);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("tab", tab);  // 현재 탭 정보 추가
    /*
        int finishedProductCount = inventoryService.countProductsByType("Y"); // 완제품 개수
        int materialProductCount = inventoryService.countProductsByType("N"); // 재료 개수


        List<Product> finishedProducts = inventoryService.getProductsByType("Y"); // 완제품 목록
        List<Product> materialProducts = inventoryService.getProductsByType("N"); // 재료 목록


        model.addAttribute("finishedCount", finishedProductCount);
        model.addAttribute("materialCount", materialProductCount);
        model.addAttribute("finishedProducts", finishedProducts);
        model.addAttribute("materialProducts", materialProducts);

        System.out.println("완제품 목록: " + finishedProducts);
        System.out.println("재료 목록: " + materialProducts);
       */
        /*
        PageInfo pi = new PageInfo((productCount+materialCount), cpage, 10, 5);
        System.out.println("pi: " + pi);
        ArrayList<Product> list = inventoryService.selectProductList(pi);

        System.out.println("list: " + list);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        */








        return "erpPage/inventoryMainPage";
    }





    // ------------ 제품 -----------------



    //제품조회
    @GetMapping("search.pro")
    public String selectProduct() {
        return null;
    }

    // 제품등록 페이지로 가기
    @GetMapping("add.pro")
    public String proAddPage() {
        return "erpPage/insertProductPage";
    }

    // 재료 수정버튼 클릭시
    @GetMapping("update.pro")
    public String proUpdatePage() {
        return "erpPage/updateProductPage";
    }

    // 제품 삭제버튼 클릭시
    @GetMapping("delete.pro")
    public String deleteProduct() {
        return null;
    }

    // 제품등록 버튼 클릭시 (* redirect 해야함)
    @PostMapping("/insert.pro")
    public String insertpro(@ModelAttribute Product product, MultipartFile upfile, HttpSession session, Model model) {
        return null;
    }




    // ------------ 재료 -----------------



    //재료조회
    @GetMapping("search.ing")
    public String searchIngrediant(@RequestParam(defaultValue = "1") int cpage, String proName, Product proNo, Model model) {
       return null;
    }

    // 재료등록 페이지로 가기
    @GetMapping("add.ing")
    public String ingAddPage() {
        return "erpPage/insertIngredientPage";
    }

    // 재료 수정버튼 클릭시
    @GetMapping("update.ing")
    public String ingUpdatePage() {
        return "erpPage/updateIngredientPage";
    }

    // 재료 삭제버튼 클릭시
    @GetMapping("delete.ing")
    public String ingDeletePage() {
        return null;
    }

    // 재료등록 버튼 클릭시 (* redirect 해야함)
    @PostMapping("insert.ing")
    public String insertIngrediant(@ModelAttribute Product product, MultipartFile upfile, HttpSession session, Model model) {
        System.out.println(product);
        System.out.println(upfile);

        if (!upfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(upfile, session, "/resources/image/productImgae");

            product.setChangeName("/resources/image/productImgae" + changeName);
            product.setOriginName(upfile.getOriginalFilename());
        }

        int result = inventoryService.insertIngrediant(product);

        if (result > 0) {
            session.setAttribute("alertMsg", "재료 등록 성공");
            return "redirect:/inv.erp";
        } else {
            model.addAttribute("errorMsg", "재료 등록 실패");
            return "common/errorPage";
        }
    }

}
