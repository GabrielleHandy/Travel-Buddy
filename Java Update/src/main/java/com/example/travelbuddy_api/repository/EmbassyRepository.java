package com.example.travelbuddy_api.repository;

import com.example.travelbuddy_api.model.Embassy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmbassyRepository extends JpaRepository<Embassy, Long> {


    public List<Embassy> findAllByHomeCountry(String homeCountry);

}
