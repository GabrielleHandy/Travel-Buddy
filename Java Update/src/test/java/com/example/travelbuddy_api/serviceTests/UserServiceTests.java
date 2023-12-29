package com.example.travelbuddy_api.serviceTests;


import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.travelbuddy_api.model.TravelPlanner;
import com.example.travelbuddy_api.model.User;
import com.example.travelbuddy_api.repository.TravelPlannerRepository;
import com.example.travelbuddy_api.repository.UserRepository;
import com.example.travelbuddy_api.service.UserService;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class UserServiceTests {

    @Mock
    UserRepository userRepository;

    @Mock
    TravelPlannerRepository travelPlannerRepository;

    @InjectMocks
    UserService userServiceMock;


    private static User user;
    private static TravelPlanner tPlanner;


    
    
}
