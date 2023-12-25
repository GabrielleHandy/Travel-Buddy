package com.example.travelbuddy_api.repository;

import com.example.travelbuddy_api.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    public User findByEmailAddress(String emailAddress);
}