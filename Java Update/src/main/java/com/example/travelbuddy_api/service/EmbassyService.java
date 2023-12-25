package com.example.travelbuddy_api.service;


import com.example.travelbuddy_api.repository.EmbassyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmbassyService {
    private EmbassyRepository embassyRepository;

    @Autowired
    public void setEmbassyRepository(EmbassyRepository embassyRepository) {
        this.embassyRepository = embassyRepository;
    }
}
