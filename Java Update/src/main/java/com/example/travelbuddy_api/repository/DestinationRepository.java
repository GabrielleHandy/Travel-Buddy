package com.example.travelbuddy_api.repository;

import com.example.travelbuddy_api.model.Destination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DestinationRepository extends JpaRepository<Destination, Long> {
    public Destination findByCityName(String cityName);
    public List<Destination> findAllByCountryName(String countryName);
}
