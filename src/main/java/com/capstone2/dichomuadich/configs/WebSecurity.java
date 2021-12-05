package com.capstone2.dichomuadich.configs;

import com.capstone2.dichomuadich.details.CustomUserDetails;
import com.capstone2.dichomuadich.services.CustomUserDetailsService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Log
@EnableWebSecurity
@Configuration
public class WebSecurity extends WebSecurityConfigurerAdapter {

        @Autowired
        private DataSource dataSource;

        @Bean
        public BCryptPasswordEncoder bCryptPasswordEncoder() {
            return new BCryptPasswordEncoder();
        }

        @Override
        public void configure(org.springframework.security.config.annotation.web.builders.WebSecurity web) throws Exception {
            web.ignoring().antMatchers("/css/**", "/fonts/**", "/img/**", "/js/**", "/plugins/**", "/sample/**",
                    "/admins/**", "/dist/**", "/front/**", "/files/**", "/uploads/**");
        }


        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
            auth.jdbcAuthentication().dataSource(dataSource)
                    .usersByUsernameQuery("select username, password,status from user where username=?")
                    .authoritiesByUsernameQuery("select k.username,concat('ROLE_',v.roleCode) as role from user k inner join role v on v.roleId = k.roleId where username=?")
                    .passwordEncoder(bCryptPasswordEncoder());
        }


        @Override
        protected void configure(HttpSecurity http) throws Exception {

            http.csrf().disable().
                    authorizeRequests()
                    .and().formLogin().loginPage(
                    "/admin/login")
                    .usernameParameter("username")
                    .passwordParameter("password").failureUrl("/admin/login?msg=err").loginProcessingUrl("/admin/login")
                    .defaultSuccessUrl("/admin/index", true).and()
                    .logout().logoutUrl("/admin/logout").logoutSuccessUrl("/admin/login").invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID").and().exceptionHandling()
                    .accessDeniedPage("/error").and();

            // Cấu Hình Access role
            http
                    .csrf()
                    .disable()
                    .authorizeRequests()
                    .antMatchers("/", "/login", "/logout", "/contact", "/forgot-password", "/admin/login", "admin/logout")
                    .permitAll()
                    .antMatchers("/admin/**")
                    .authenticated();

            http.authorizeRequests().antMatchers("/admin/user/**").access("hasAnyRole('ROLE_ADMIN')");
            http.authorizeRequests().antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN','ROLE_STORE_MANAGER','ROLE_WARD_MANAGER')");


        }



    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
        db.setDataSource(dataSource);
        return db;
    }
}
