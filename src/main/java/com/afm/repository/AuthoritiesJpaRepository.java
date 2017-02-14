package com.afm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.afm.model.Authorities;
@Repository("authoritiesJparepository")
public interface AuthoritiesJpaRepository extends JpaRepository<Authorities, Long> {

}
