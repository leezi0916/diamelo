package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
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
    public String inventory(@RequestParam(defaultValue = "1") int cpage, Model model) {

        int productCount = inventoryService.selectProductCount();
        model.addAttribute("pCount",productCount);
        System.out.println("productCount: " + productCount);

        int materialCount = inventoryService.selectMaterialCount();
        model.addAttribute("mCount",materialCount);
        System.out.println("materialCount: " + materialCount);

        PageInfo pi = new PageInfo((productCount+materialCount), cpage, 10, 10);
        System.out.println("pi: " + pi);
        ArrayList<Product> list = inventoryService.selectProductList(pi);

        System.out.println("list: " + list);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);


        /*
        int finishedProductCount = productService.countProductsByType("Y"); // 완제품 개수
        int materialProductCount = productService.countProductsByType("N"); // 재료 개수

        List<Product> finishedProducts = productService.getProductsByType("Y"); // 완제품 목록
        List<Product> materialProducts = productService.getProductsByType("N"); // 재료 목록


        model.addAttribute("finishedCount", finishedProductCount);
        model.addAttribute("materialCount", materialProductCount);
        model.addAttribute("finishedProducts", finishedProducts);
        model.addAttribute("materialProducts", materialProducts);

        System.out.println("완제품 목록: " + finishedProducts);
        System.out.println("재료 목록: " + materialProducts);
        */


        return "erpPage/inventoryMainPage";
    }





    // ------------ 제품 -----------------

    //제품조회
    @GetMapping("select.pro")
    public String selectProduct() {
        return null;
    }

    // 제품등록 페이지로 가기
    @GetMapping("proAdd.erp")
    public String proAddPage() {
        return "erpPage/insertProductPage";
    }

    // 제품등록 버튼 클릭시 (* redirect 해야함)
    @PostMapping("/insert.pro")
    public String insertpro(@ModelAttribute Product product, MultipartFile upfile, HttpSession session, Model model) {
        return null;
    }




    // ------------ 재료 -----------------

    //재료조회
    @GetMapping("select.ing")
    public String selectIngredient() {
        return null;
    }

    // 재료등록 페이지로 가기
    @GetMapping("ingAdd.erp")
    public String ingAddPage() {
        return "erpPage/insertIngredientPage";
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
