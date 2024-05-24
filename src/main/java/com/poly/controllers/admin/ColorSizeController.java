package com.poly.controllers.admin;


import com.poly.entities.Color;
import com.poly.entities.Size;
import com.poly.services.ParamService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/size-color-management")
public class ColorSizeController {
    @Autowired
    ServletContext context;

    @Autowired
    ParamService paramService;

    @GetMapping("")
    public String showColorManagement(@ModelAttribute("color") Color color, @ModelAttribute("size") Size size,
                                      Model model) {
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create-color")
    public String createColor(@Validated @ModelAttribute("color") Color color, BindingResult result, @ModelAttribute("size") Size size,

                              Model model,
                              RedirectAttributes redirectAttributes) {


        if (result.hasErrors()) {
            model.addAttribute("page", "sizeColorManagement.jsp");
            return "admin/index";
        }

        redirectAttributes.addFlashAttribute("color", color);
        return "redirect:/admin/size-color-management";
    }

    @PostMapping("/create-size")
    public String createSize(@Validated @ModelAttribute("size") Size size,
                             BindingResult result, @ModelAttribute("color") Color color,
                             Model model,
                             RedirectAttributes redirectAttributes) {


        if (result.hasErrors()) {
            model.addAttribute("page", "sizeColorManagement.jsp");
            return "admin/index";
        }

        redirectAttributes.addFlashAttribute("color", color);
        return "redirect:/admin/size-color-management";
    }
}
