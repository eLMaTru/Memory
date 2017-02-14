package com.afm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.afm.model.People;
@Repository("peopleJpaRepository")
public interface PeopleJpaRepository extends JpaRepository<People, Long> {

}
