package com.poly.controllers.admin;

import com.poly.entities.Review;
import com.poly.repositories.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/review-management")
public class ReviewController {
    // 123
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
