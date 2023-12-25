package com.example.travelbuddy_api.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "destinations")
public class Destination {
    @Id
    private Long id;

    @Column
    private String cityName;

    @Column
    private String countryName;

    @OneToMany(mappedBy = "destination", orphanRemoval = true)
    private Set<Embassy> embassies = new HashSet<>();


    @ManyToMany(
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            },
            mappedBy = "destinations")
    @JsonIgnore
    private Set<TravelPlanner> travelPlanners;


    public Destination() {
    }

    public Destination(Long id, String cityName, String countryName,
                       Set<Embassy> embassies ,Set<TravelPlanner> travelPlanners) {
        this.id = id;
        this.cityName = cityName;
        this.countryName = countryName;
        this.embassies = embassies;
        this.travelPlanners = travelPlanners;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public Set<Embassy> getEmbassies() {
        return embassies;
    }

    public void setEmbassies(Set<Embassy> embassies) {
        this.embassies = embassies;
    }

    public Set<TravelPlanner> getTravelPlanners() {
        return travelPlanners;
    }

    public void setTravelPlanners(Set<TravelPlanner> travelPlanners) {
        this.travelPlanners = travelPlanners;
    }

    @Override
    public String toString() {
        return "Destination{" +
                "id=" + id +
                ", cityName='" + cityName + '\'' +
                ", countryName='" + countryName + '\'' +
                ", embassies=" + embassies +
                ", travelPlanners=" + travelPlanners +
                '}';
    }
}
