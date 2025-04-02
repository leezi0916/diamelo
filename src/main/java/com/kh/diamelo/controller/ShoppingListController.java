package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingListController {

    @GetMapping("shoppingList.crm")
    public String shoppingListCrm() {
        return "crmPage/shoppingList";
    }
}
