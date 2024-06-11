package com.poly.controllers.admin;

import com.poly.entities.Color;
import com.poly.entities.Review;
import com.poly.repositories.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/review-management")
public class ReviewController {

    @Autowired
    ReviewRepository reviewRepository;

    @GetMapping("")
    public String reviewManagement(Model model) {
        model.addAttribute("page", "reviewManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        reviewRepository.deleteById(id);
        return "redirect:/admin/review-management";
    }

    @ModelAttribute("reviews")
    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }
}
