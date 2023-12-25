package com.example.travelbuddy_api.service;

import com.example.travelbuddy_api.repository.TravelPlannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TravelPlannerService {
    private TravelPlannerRepository travelPlannerRepository;

    @Autowired
    public void setTravelPlannerRepository(TravelPlannerRepository travelPlannerRepository) {
        this.travelPlannerRepository = travelPlannerRepository;
    }
}
