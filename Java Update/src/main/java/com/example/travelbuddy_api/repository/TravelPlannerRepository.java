package com.example.travelbuddy_api.repository;

import com.example.travelbuddy_api.model.TravelPlanner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TravelPlannerRepository extends JpaRepository<TravelPlanner, Long> {


}
