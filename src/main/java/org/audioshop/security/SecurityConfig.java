package org.audioshop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration 
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

	@Override
    protected void configure(HttpSecurity http) throws Exception {
         
        // Remember-Me
        http.rememberMe()
            .rememberMeParameter("remember-me") // 기본명은 remember-me 이다
            .tokenValiditySeconds(3600) // 만료시간, 기본은 14일
            // .alwaysRemember(true) // 로그인하면 Remember-Me 기능 무조건 활성화 여부
            .userDetailsService(userDetailsService);
            // 안 하면 "java.lang.IllegalStateException: UserDetailsService is required."
            // 내부적으로 재인증 처리를 위해서는 이게 필요하다고 한다.
    
    }
}
