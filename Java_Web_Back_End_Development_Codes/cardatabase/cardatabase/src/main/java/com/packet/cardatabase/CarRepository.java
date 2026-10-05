package com.packet.cardatabase;

import com.packet.cardatabase.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CarRepository extends JpaRepository<Car, Long> {

    List<Car> findByBrandIgnoreCase(String brand);

    List<Car> findByYearGreaterThanEqual(Integer year);

    List<Car> findByPriceBetween(Double minimum, Double maximum);
}
