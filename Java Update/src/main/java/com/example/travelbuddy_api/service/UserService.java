package com.example.travelbuddy_api.service;

import com.example.travelbuddy_api.model.User;
import com.example.travelbuddy_api.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private UserRepository userRepository;


    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public User findByEmailAddress(String username) {
        return null;
    }



}
