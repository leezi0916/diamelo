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

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "재고 관리");


        return "erpPage/inventoryMainPage";
    }

    @GetMapping("materialList")
    @ResponseBody
    public ArrayList<Product> getMaterialList() {
        ArrayList<Product> materialList = inventoryService.selectAllMaterials();
        System.out.println("materialList: " + materialList);
        return materialList;
    }


    // ------------ 제품 -----------------


    //제품검색
    @GetMapping("productSearch.pro")
    public String searchProduct(@RequestParam(defaultValue = "1") int cpage,
                                @RequestParam(required = false, defaultValue = "0")int searchCategoryNo,
                                @RequestParam(required = false, defaultValue = "0")int proNo,
                                @RequestParam(required = false)String proName,
                                @RequestParam(value = "tab", defaultValue = "product") String tab,
                                Model model) {
        System.out.println("searchCategoryNo: " + searchCategoryNo);
        System.out.println("proNo: " + proNo);
        System.out.println("proName: " + proName);
        System.out.println("tab: " + tab);

        int productCount = inventoryService.selectProductCount();
        model.addAttribute("pCount", productCount);
        System.out.println("productCount: " + productCount);

        int materialCount = inventoryService.selectMaterialCount();
        model.addAttribute("mCount", materialCount);
        System.out.println("materialCount: " + materialCount);


        int pSearchCount = inventoryService.selectSearchProductCount(searchCategoryNo, proNo, proName);
        PageInfo pi = new PageInfo(pSearchCount, cpage, 10, 10);
        ArrayList<Product> list = inventoryService.selectSearchProductList(pi, searchCategoryNo, proNo, proName);

        model.addAttribute("tab", tab);
        model.addAttribute("searchCategoryNo", searchCategoryNo);
        model.addAttribute("proNo", proNo);
        model.addAttribute("proName", proName);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "erpPage/inventoryMainPage";
    }

    // 제품등록 페이지로 가기
    @GetMapping("insertProduct.pro")
    public String insertProductPage() {
        return "erpPage/insertProductPage";
    }

    // 제품 수정버튼 클릭시
    @GetMapping("updateView.pro")
    public String updateProductPage(@RequestParam(value = "proNo") int proNo, Model model) {

        System.out.println("proNo: " + proNo);
        // 1. 제품 정보
        Product product = inventoryService.selectProduct(proNo);
        System.out.println("product: " + product);
        // 2. 이미지 정보
        Attachment attachment = inventoryService.selectProductAttachment(proNo);
        System.out.println("attachment: " + attachment);
        // 3. Recipe (재료 리스트)
        ArrayList<Recipe> recipeList = inventoryService.selectRecipeList(proNo);
        System.out.println("recipeList: " + recipeList);

        // model 에 담아서 JSP 로 보내기
        model.addAttribute("product", product);
        model.addAttribute("attachment", attachment);
        model.addAttribute("recipeList", recipeList);


        return "erpPage/updateProductPage";

    }

    @PostMapping("update.pro")
    public String updateProduct(
                                Product product,
                                Attachment attachment,
                                @RequestParam("upfile") MultipartFile upfile,
                                @RequestParam("matNo[]") ArrayList<Integer> matNoList,
                                @RequestParam("proName[]") ArrayList<String> matNameList,
                                @RequestParam("amount[]") ArrayList<Integer> amountList,
                                @RequestParam("proPrice[]") ArrayList<Integer> matPriceList,
                                HttpSession session,
                                Model model) {

        int proNo = product.getProNo();
        System.out.println("proNo: " + proNo);

        // 1. 상품 정보 수정
        int result1 = inventoryService.updateProduct(product);

        // 2. 이미지 정보 수정
        int result2 = 1;
        if (!upfile.isEmpty()) { // 새로운 파일이 있는 경우
            // 파일 이름 변경 및 저장
            String changeName = Template.saveProductlFile(upfile, session, "/resources/uploadFile/product/");

            attachment.setOriginName(upfile.getOriginalFilename());
            attachment.setChangeName("/resources/uploadFile/product/" + changeName);

            // DB 업데이트
            result2 = inventoryService.updateProductAttachment(attachment);
        }
            // 새로운 파일이 없는 경우 → 기존 attachment 정보 유지



        // 3. 기존 레시피 삭제
        int result3 = inventoryService.deleteRecipeByProNo(product.getProNo());

        // 4. 새로운 레시피 삽입
        int result4 = 1;
        for (int i = 0; i < matNoList.size(); i++) {
            int res = inventoryService.insertRecipe(
                    proNo,
                    matNoList.get(i),
                    matNameList.get(i),
                    amountList.get(i),
                    matPriceList.get(i)
            );
            result4 *= res;
        }

        // 5. 성공 여부 판단
        if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
            session.setAttribute("alertMsg", "제품 수정 성공");
            return "redirect:inv.erp";
        } else {
            model.addAttribute("errorMsg", "제품 수정 실패");
            return "common/errorPage";
        }
    }




    // 제품 삭제버튼 클릭시
    @PostMapping("delete.pro")
    public String deleteProduct(@RequestParam(value = "proNo") int proNo, Model model) {
        inventoryService.deleteProduct(proNo);
        return "redirect:inv.erp";
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

        int inveninsert = inventoryService.inventoryInsert(proNo);

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
            System.out.println("result3: " + result3);

        }

            if (result1 > 0 && result2 > 0 && result3 > 0) {
                session.setAttribute("alertMsg", "제품 등록 성공");
                return "redirect:/inv.erp";
            } else {
                session.setAttribute("alertMsg", "제품 등록 실패");
                return "redirect:/insertProductPage.erp";
            }
        }

    @RequestMapping("/getProductInfo")
    @ResponseBody
    public Product getProductInfo(@RequestParam(value = "proNo", required = false) Integer proNo) {
        System.out.println("받은 proNo: " + proNo);
        if (proNo == null) {
            throw new IllegalArgumentException("proNo가 null입니다");
        }
        return inventoryService.getProductInfo(proNo);
    }




    // ------------ 재료 -----------------



    //재료검색
    @GetMapping("ingredientSearch.ing")
    public String searchIngredient(@RequestParam(defaultValue = "1") int cpage,
                                   @RequestParam(required = false, defaultValue = "0")int proNo,
                                   @RequestParam(required = false)String proName,
                                   @RequestParam(value = "tab", defaultValue = "material") String tab,
                                   Model model) {
        System.out.println("proNo: " + proNo);
        System.out.println("proName: " + proName);
        System.out.println("tab: " + tab);

        int productCount = inventoryService.selectProductCount();
        model.addAttribute("pCount", productCount);
        System.out.println("productCount: " + productCount);

        int materialCount = inventoryService.selectMaterialCount();
        model.addAttribute("mCount", materialCount);
        System.out.println("materialCount: " + materialCount);


        int mSearchCount = inventoryService.selectSearchMaterialCount(proNo, proName);
        System.out.println("mSearchCount: " + mSearchCount);
        PageInfo pi = new PageInfo(mSearchCount, cpage, 10, 10);
        ArrayList<Product> list = inventoryService.selectSearchMaterialList(pi, mSearchCount, proNo, proName);


        model.addAttribute("tab", tab);
        model.addAttribute("proNo", proNo);
        model.addAttribute("proName", proName);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "erpPage/inventoryMainPage";

    }

    // 재료등록 페이지로 가기
    @GetMapping("insert.ing")
    public String insertIngredient() {
        return "erpPage/insertIngredientPage";
    }

    // 재료 수정버튼 클릭시
    @GetMapping("updateView.ing")
    public String UpdateIngredientPage(@RequestParam(value = "proNo") int proNo, Model model) {
        System.out.println("proNo: " + proNo);
        // 1. 제품 정보
        Product product = inventoryService.selectProduct(proNo);
        System.out.println("product: " + product);
        // 2. 이미지 정보
        Attachment attachment = inventoryService.selectProductAttachment(proNo);
        System.out.println("attachment: " + attachment);

        // model 에 담아서 JSP 로 보내기
        model.addAttribute("product", product);
        model.addAttribute("attachment", attachment);

        return "erpPage/updateIngredientPage";
    }

    @PostMapping("update.ing")
    public String UpdateIngredien(
            Product product,
            Attachment attachment,
            @RequestParam("upfile") MultipartFile upfile,
            HttpSession session,
            Model model) {

        int proNo = product.getProNo();
        System.out.println("proNo: " + proNo);

        // 1. 상품 정보 수정
        int result1 = inventoryService.updateProduct(product);

        // 2. 이미지 정보 수정
        int result2 = 1;
        if (!upfile.isEmpty()) { // 새로운 파일이 있는 경우
            // 파일 이름 변경 및 저장
            String changeName = Template.saveProductlFile(upfile, session, "/resources/uploadFile/product/material/");

            attachment.setOriginName(upfile.getOriginalFilename());
            attachment.setChangeName("/resources/uploadFile/product/material/" + changeName);

            // DB 업데이트
            result2 = inventoryService.updateProductAttachment(attachment);
        }
            // 새로운 파일이 없는 경우 → 기존 attachment 정보 유지



        // 5. 성공 여부 판단
        if (result1 > 0 && result2 > 0) {
            session.setAttribute("alertMsg", "제품 수정 성공");
            return "redirect:inv.erp";
        } else {
            model.addAttribute("errorMsg", "제품 수정 실패");
            return "common/errorPage";
        }
    }



    // 재료 삭제버튼 클릭시
    @PostMapping("delete.ing")
    public String deleteIngredient(@RequestParam(value = "proNo") int proNo, Model model) {
        inventoryService.deleteProduct(proNo);
        return "redirect:inv.erp";
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

        System.out.println("proNo: " + product.getProNo());


        int result = inventoryService.insertMaterial(product);

        int proNo = product.getProNo();
        System.out.println("proNo: " + proNo);
        int inveninsert = inventoryService.inventoryInsert(proNo);

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
