package com.poly.entities;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Color {

    @NotBlank(message = "NotBlank.color.color")
    private String color;

    @NotBlank(message = "NotBlank.color.colorDescription")
    private String colorDescription;

    // Getters and setters
    public void print() {
        System.out.println("color: " + color);
        System.out.println("description: " + colorDescription);


    }

    public boolean isEmpty() {
        return color == null || colorDescription == null;
    }
}
