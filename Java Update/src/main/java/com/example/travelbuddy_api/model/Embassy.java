package com.example.travelbuddy_api.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "embassies")
public class Embassy {
    @Id
    private Long id;

    @Column
    private String homeCountry;

    @Column
    private String address;

    @Column
    private Float latitude;

    @Column
    private Float longitude;

    @Column
    private String website;


    @ManyToOne
    @JoinColumn(name = "destination_id", nullable = false)
    @JsonIgnore
    private Destination destination;


    public Embassy() {
    }

    public Embassy(Long id, String homeCountry, String address, Float latitude, Float longitude, String website, Destination destination) {
        this.id = id;
        this.homeCountry = homeCountry;
        this.address = address;
        this.latitude = latitude;
        this.longitude = longitude;
        this.website = website;
        this.destination = destination;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getHomeCountry() {
        return homeCountry;
    }

    public void setHomeCountry(String homeCountry) {
        this.homeCountry = homeCountry;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    public Float getLongitude() {
        return longitude;
    }

    public void setLongitude(Float longitude) {
        this.longitude = longitude;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Destination getDestination() {
        return destination;
    }

    public void setDestination(Destination destination) {
        this.destination = destination;
    }

    @Override
    public String toString() {
        return "Embassy{" +
                "id=" + id +
                ", homeCountry='" + homeCountry + '\'' +
                ", address='" + address + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", website='" + website + '\'' +
                ", destination=" + destination +
                '}';
    }
}
