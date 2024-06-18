package com.poly.controllers.admin;


import com.poly.entities.Color;
import com.poly.entities.Product;
import com.poly.entities.Size;
import com.poly.repositories.ColorRepository;
import com.poly.repositories.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@Controller
@RequestMapping("/admin/size-color-management")
public class ColorSizeController {
    @Autowired
    private SizeRepository sizeRepository;

    @Autowired
    private ColorRepository colorRepository;

    @ModelAttribute("colors")
    public List<Color> getAllColor() {
        return colorRepository.findAll();
    }

    @ModelAttribute("sizes")
    public List<Size> getAllSize() {
        return sizeRepository.findAll();
    }

    @GetMapping("")
    public String showColorManagement(@ModelAttribute("color") Color color, @ModelAttribute("size") Size size,
                                      Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    /*Create*/
    @PostMapping("/create-color")
    public String createColor(@Validated @ModelAttribute("color") Color color,
                              BindingResult result, @ModelAttribute("size") Size size,
                              Model model) {
        model.addAttribute("disabledUpdate", "disabled");

        if (!result.hasErrors()) {
            Color colorName = colorRepository.findByColorName(color.getColorName());
            if (colorName == null) {
                colorRepository.save(color);
                return "redirect:/admin/size-color-management";
            } else {
                model.addAttribute("msg", "Color name is exists");
            }
        }
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create-size")
    public String createSize(@Validated @ModelAttribute("size") Size size,
                             BindingResult result, @ModelAttribute("color") Color color,
                             Model model) {


        model.addAttribute("disabledUpdate", "disabled");
        if (!result.hasErrors()) {
            Size sizeName = sizeRepository.findBySizeName(size.getSizeName());
            if (sizeName == null) {
                sizeRepository.save(size);
                return "redirect:/admin/size-color-management";
            } else {
                model.addAttribute("msg1", "Size name is exists");
            }

        }
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    /*Update*/
    @PostMapping("/update-color")
    public String updateColor(@Validated @ModelAttribute("color") Color color,
                              BindingResult result, @ModelAttribute("size") Size size,
                              Model model) {
        model.addAttribute("disabledSaveColor", "disabled");
        if (!result.hasErrors()) {
            Color colorUpdate = colorRepository.findById(color.getColorId()).orElse(null);
            color.setColorId(colorUpdate.getColorId());
            colorRepository.save(color);
            return "redirect:/admin/size-color-management";
        }
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update-size")
    public String updateSize(@Validated @ModelAttribute("size") Size size,
                             BindingResult result, @ModelAttribute("color") Color color,
                             Model model) {
        model.addAttribute("disabledSaveSize", "disabled");
        if (!result.hasErrors()) {
            Size sizeUpdate = sizeRepository.findById(size.getSizeId()).orElse(null);
            size.setSizeId(sizeUpdate.getSizeId());
            sizeRepository.save(size);
            return "redirect:/admin/size-color-management";
        }
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    /*Edit*/
    @GetMapping("/edit-color/{id}")
    public String editColor(@PathVariable Long id, @ModelAttribute("") Size size, Model model) {
        model.addAttribute("disabledSaveColor", "disabled");
        model.addAttribute("color", colorRepository.findById(id).orElse(null));
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit-size/{id}")
    public String editSize(@PathVariable Long id, @ModelAttribute("") Color color, Model model) {
        model.addAttribute("disabledSaveSize", "disabled");
        model.addAttribute("size", sizeRepository.findById(id).orElse(null));
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }

    /*Delete*/
    @GetMapping("/delete-color/{id}")
    public String deleteColor(@PathVariable Long id, Model model,
                              @ModelAttribute("color") Color color,
                              @ModelAttribute("size") Size size) {
        try {
            colorRepository.deleteById(id);
            return "redirect:/admin/size-color-management";
        } catch (Exception e) {
            model.addAttribute("msgDeleteColor", true);
        }
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";

    }

    @GetMapping("/delete-size/{id}")
    public String deleteSize(@PathVariable Long id, Model model,
                             @ModelAttribute("size") Size size,
                             @ModelAttribute("color") Color color) {
        try {
            sizeRepository.deleteById(id);
            return "redirect:/admin/size-color-management";
        } catch (Exception e) {
            model.addAttribute("msgDeleteSize", true);
        }
        model.addAttribute("page", "sizeColorManagement.jsp");
        return "admin/index";
    }
}
