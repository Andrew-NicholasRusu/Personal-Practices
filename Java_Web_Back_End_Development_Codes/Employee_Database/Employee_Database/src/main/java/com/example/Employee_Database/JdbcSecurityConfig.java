package com.example.Employee_Database;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;

@Configuration
public class JdbcSecurityConfig {
    // Inject the DataSource auto-configured by Spring Boot
    @Bean
    public UserDetailsManager userDetailsManager(DataSource dataSource) {
        // Leverages standard Spring Security JDBC queries to manage users
        return new JdbcUserDetailsManager(dataSource);
    }
}
