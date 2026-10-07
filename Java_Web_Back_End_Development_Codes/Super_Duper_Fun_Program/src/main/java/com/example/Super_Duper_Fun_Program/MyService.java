package com.example.Super_Duper_Fun_Program;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.lang.annotation.Annotation;
import java.util.List;

@Service
@Transactional
public class MyService implements FunService {


    @Override
    public List<Student> findAll() {
        return null;
    }

    @Override
    public Student findByName(String name) {
        return null;
    }

    @Override
    public Student save(Student student) {
        return null;
    }
}
