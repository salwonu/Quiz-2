package com.examtravel.model;

import java.io.Serializable;
import java.util.Objects;

public class Destination implements Serializable {
    private int id;
    private String name;
    private String country;
    private String season;
    private String description;
    private String heroImage;
    private double rating;

    public Destination() {
    }

    public Destination(int id, String name, String country, String season,
                       String description, String heroImage, double rating) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.season = season;
        this.description = description;
        this.heroImage = heroImage;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHeroImage() {
        return heroImage;
    }

    public void setHeroImage(String heroImage) {
        this.heroImage = heroImage;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Destination that = (Destination) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}


