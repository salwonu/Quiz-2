package com.examtravel.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class TravelPackage implements Serializable {
    private int id;
    private String title;
    private int destinationId;
    private double price;
    private int durationDays;
    private List<String> highlights = new ArrayList<>();
    private String coverImage;

    public TravelPackage() {
    }

    public TravelPackage(int id, String title, int destinationId, double price,
                         int durationDays, List<String> highlights, String coverImage) {
        this.id = id;
        this.title = title;
        this.destinationId = destinationId;
        this.price = price;
        this.durationDays = durationDays;
        if (highlights != null) {
            this.highlights = new ArrayList<>(highlights);
        }
        this.coverImage = coverImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getDestinationId() {
        return destinationId;
    }

    public void setDestinationId(int destinationId) {
        this.destinationId = destinationId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDurationDays() {
        return durationDays;
    }

    public void setDurationDays(int durationDays) {
        this.durationDays = durationDays;
    }

    public List<String> getHighlights() {
        return highlights;
    }

    public void setHighlights(List<String> highlights) {
        this.highlights = new ArrayList<>(highlights);
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TravelPackage that = (TravelPackage) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}


