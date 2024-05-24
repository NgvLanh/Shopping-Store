package com.poly.entities;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Size {

    @NotBlank(message = "NotBlank.size.size")
    private String size;

    @NotBlank(message = "NotBlank.size.sizeDescription")
    private String sizeDescription;

    // Getters and setters
    public void print() {
        System.out.println("size: " + size);
        System.out.println("description: " + sizeDescription);


    }

    public boolean isEmpty() {
        return size == null || sizeDescription == null;
    }
}
