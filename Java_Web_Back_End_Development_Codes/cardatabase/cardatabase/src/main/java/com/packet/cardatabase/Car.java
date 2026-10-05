package com.packet.cardatabase;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String brand;

    @NotBlank
    private String model;

    @NotNull
    @Min(1886)
    private Integer year;

    @NotNull
    @Min(0)

    // Data fields

    private double price;
    private String color;
    private String image;
    private String fuelType;
    private double fuelCapacity;
    private double mileage;

    // ARG Constructor
    public Car(String brand, String model, Integer year, double price, String color, String image, String fuelType, double fuelCapacity, double mileage) {
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.price = price;
        this.color = color;
        this.image = image;
        this.fuelType = fuelType;
        this.fuelCapacity = fuelCapacity;
        this.mileage = mileage;
    }

    // Getters & Setters
    public @NotBlank String getBrand() {
        return brand;
    }

    public void setBrand(@NotBlank String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getFuelCapacity() {
        return fuelCapacity;
    }

    public void setFuelCapacity(double fuelCapacity) {
        this.fuelCapacity = fuelCapacity;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getMileage() {
        return mileage;
    }

    public void setMileage(double mileage) {
        this.mileage = mileage;
    }

    public @NotBlank String getModel() {
        return model;
    }

    public void setModel(@NotBlank String model) {
        this.model = model;
    }

    public @NotNull @Min(0) double getPrice() {
        return price;
    }

    public void setPrice(@NotNull @Min(0) double price) {
        this.price = price;
    }

    public @NotNull @Min(1886) Integer getYear() {
        return year;
    }

    public void setYear(@NotNull @Min(1886) Integer year) {
        this.year = year;
    }
}
