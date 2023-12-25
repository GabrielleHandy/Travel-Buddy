package com.example.travelbuddy_api.service;

import com.example.travelbuddy_api.repository.DestinationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DestinationService {
    private DestinationRepository destinationRepository;

    @Autowired
    public void setDestinationRepository(DestinationRepository destinationRepository) {
        this.destinationRepository = destinationRepository;
    }
}
