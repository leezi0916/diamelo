package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.*;
import com.kh.diamelo.services.InventoryService;
import com.kh.diamelo.services.ProductService;
import com.kh.diamelo.utils.Template;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
        model.addAttribute("pCount", productCount);
        System.out.println("productCount: " + productCount);

        int materialCount = inventoryService.selectMaterialCount();
        model.addAttribute("mCount", materialCount);
        System.out.println("materialCount: " + materialCount);

        // 현재 탭에 따라 전체 개수 설정
        int totalCount = (tab.equals("product")) ? productCount : materialCount;

        PageInfo pi = new PageInfo(totalCount, cpage, 10, 10);
        System.out.println("pi: " + pi);

        ArrayList<Product> list;
        if (tab.equals("product")) {
            list = inventoryService.selectProductList(pi); // 제품 리스트 조회
        } else {
            list = inventoryService.selectMaterialList(pi); // 재료 리스트 조회
        }

        System.out.println("list: " + list);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("tab", tab);  // 현재 탭 정보 추가



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

    // 제품 수정버튼 클릭시
    @GetMapping("update.pro")
    public String updateProductPage(@RequestParam(value = "proNo") int proNo, Model model) {

        System.out.println("proNo: " + proNo);
        // 1. 제품 정보
        Product product = inventoryService.selectProduct(proNo);

        // 2. 이미지 정보
        Attachment attachment = inventoryService.selectProductAttachment(proNo);

        // 3. Recipe (재료 리스트)
        ArrayList<Recipe> recipeList = inventoryService.selectRecipeList(proNo);

        // model 에 담아서 JSP 로 보내기
        model.addAttribute("product", product);
        model.addAttribute("attachment", attachment);
        model.addAttribute("recipeList", recipeList);


        return "erpPage/updateProductPage";

    }

    // 제품 삭제버튼 클릭시
    @GetMapping("delete.pro")
    public String deleteProduct() {
        return null;
    }

    // 제품등록 버튼 클릭시 (* redirect 해야함)
    @PostMapping("insert.pro")
    public String insertProduct(@ModelAttribute Product product,
                                @ModelAttribute Attachment attachment,
                                @RequestParam("upfile") MultipartFile upfile,
                                @RequestParam("matNo[]") ArrayList<Integer> matNoList,
                                @RequestParam("proName[]") ArrayList<String> matNameList,
                                @RequestParam("amount[]") ArrayList<Integer> amountList,
                                @RequestParam("proPrice[]") ArrayList<Integer> matPriceList,
                                HttpSession session,
                                Model model) {

        // 1. Product Insert
        int result1 = inventoryService.insertProduct(product);

        // 2. Get Product No
        int proNo = product.getProNo();

        // 3. File Upload (Attachment Insert)
        int result2 = 1;
        if (!upfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveProductlFile(upfile, session, "/resources/uploadFile/product/");

            attachment.setOriginName(upfile.getOriginalFilename());
            attachment.setChangeName("/resources/uploadFile/product/" + changeName);
        }


        if (result1 > 0 && attachment.getOriginName() != null) {
            // Product insert 성공 후 Product의 proNo를 가져와서 attachment에 넣기
            attachment.setProNo((product.getProNo()));

            result2 = inventoryService.insertProductAttachment(attachment);
        }

            // 4. Recipe Insert
        int result3 = 1;
        for (int i = 0; i < matNoList.size(); i++) {
            int res = inventoryService.insertRecipe(
                    proNo,
                    matNoList.get(i),
                    matNameList.get(i),
                    amountList.get(i),
                    matPriceList.get(i)
            );
            result3 *= res;
        }

            if (result1 > 0 && result2 > 0 && result3 > 0) {
                session.setAttribute("alertMsg", "제품 등록 성공");
                return "redirect:/inv.erp";
            } else {
                session.setAttribute("alertMsg", "제품 등록 실패");
                return "redirect:/insertProductPage.erp";
            }
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
    public String insertMaterial(@ModelAttribute Product product,
                                 @ModelAttribute Attachment attachment,
                                 @RequestParam("upfile") MultipartFile upfile,
                                 HttpSession session,
                                 Model model) {

        if (!upfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveProductlFile(upfile, session, "/resources/uploadFile/product/material/");

            attachment.setOriginName(upfile.getOriginalFilename());
            attachment.setChangeName("/resources/uploadFile/product/material/" + changeName);
        }

        int result = inventoryService.insertMaterial(product);

        if (result > 0 && attachment.getOriginName() != null) {
            // Product insert 성공 후 Product의 proNo를 가져와서 attachment에 넣기
            attachment.setProNo((product.getProNo()));

            int attachmentResult = inventoryService.insertMaterialAttachment(attachment);

            if (attachmentResult > 0) {
                session.setAttribute("alertMsg", "재료 등록 성공");
                return "redirect:/inv.erp";
            } else {
                model.addAttribute("errorMsg", "이미지 등록 실패");
                return "common/errorPage";
            }
        } else {
            model.addAttribute("errorMsg", "재료 등록 실패");
            return "common/errorPage";
        }
    }




}
