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
                            Model model,HttpSession session) {

        String svg = "/image/erpIcon/product.png";

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

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "재고 관리");
        
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
    @PostMapping("insert.pro")
    public String insertProduct(@ModelAttribute Product product,
                                @ModelAttribute Attachment attachment,
                                @RequestParam("upfile") MultipartFile upfile,
                                HttpServletRequest request,
                                HttpSession session,
                                Model model) {

        // 🖼️ 첨부파일 처리
        if (!upfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveProductlFile(upfile, session, "/resources/uploadFile/product/");
            attachment.setOriginName(upfile.getOriginalFilename());
            attachment.setChangeName("/resources/uploadFile/product/" + changeName);
        }

        // 🧩 상품 등록
        int result = inventoryService.insertProduct(product);

        if (result > 0) {
            int proNo = product.getProNo(); // 생성된 상품 번호

            // 🖼️ 첨부파일 저장
            if (attachment.getOriginName() != null) {
                attachment.setProNo(proNo);
                int attachmentResult = inventoryService.insertProductAttachment(attachment);
                if (attachmentResult <= 0) {
                    model.addAttribute("errorMsg", "제품 이미지 등록 실패");
                    return "common/errorPage";
                }
            }

            // 🧩 재료 배열 처리
            String[] matNos = request.getParameterValues("matNo");
            String[] amounts = request.getParameterValues("amount");

            ArrayList<Recipe> recipeList = new ArrayList<>();

            if (matNos != null && amounts != null) {
                for (int i = 0; i < matNos.length; i++) {
                    Recipe recipe = new Recipe();
                    recipe.setProNo(proNo); // ✅ 상품 번호 포함
                    recipe.setMatNo(Integer.parseInt(matNos[i]));
                    recipe.setAmount(Integer.parseInt(amounts[i]));
                    recipeList.add(recipe);
                }
            }

            System.out.println("recipeList: " + recipeList); // 디버깅 출력

            // 🧩 레시피 등록
            if (!recipeList.isEmpty()) {
                int recipeResult = inventoryService.insertRecipeList(recipeList);
                if (recipeResult <= 0) {
                    model.addAttribute("errorMsg", "레시피 등록 실패");
                    return "common/errorPage";
                }
            }

            session.setAttribute("alertMsg", "제품 등록 성공");
            return "redirect:/inv.erp";

        } else {
            model.addAttribute("errorMsg", "제품 등록 실패");
            return "common/errorPage";
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
