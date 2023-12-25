package com.example.travelbuddy_api.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;


import java.util.Set;

import static jakarta.persistence.FetchType.LAZY;

@Entity
@Table(name = "travelplanners")
public class TravelPlanner {
    @Id
    private Long id;

    @Column
    private String name;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    @JsonIgnore
    private User user;

    @ManyToMany(fetch = LAZY )
    @JoinTable( name = "travelplanner_destinations",
            joinColumns = {@JoinColumn(name = "travelplanner_id")},
            inverseJoinColumns = {@JoinColumn(name = "destination_id")})
    private Set<Destination> destinations;

    public TravelPlanner() {
    }

    public TravelPlanner(Long id, String name, User user, Set<Destination> destinations = new Set<Destination>()) {
        this.id = id;
        this.name = name;
        this.user = user;
        this.destinations = destinations;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
