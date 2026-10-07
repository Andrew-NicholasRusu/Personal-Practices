package com.example.Super_Duper_Fun_Program;

import java.util.List;

public interface FunService {
    List<Student> findAll();
    Student findByName(String name);
    Student save (Student student);
}
