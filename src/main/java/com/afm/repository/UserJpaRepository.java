package com.afm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.afm.model.User;
@Repository("userJpaRepository")
public interface UserJpaRepository extends JpaRepository<User, Long>{

}
