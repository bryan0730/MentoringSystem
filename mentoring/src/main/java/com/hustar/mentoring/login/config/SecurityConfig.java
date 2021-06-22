package com.hustar.mentoring.login.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.hustar.mentoring.login.service.LoginFailHandler;
import com.hustar.mentoring.login.service.LoginSuccessHandler;
import com.hustar.mentoring.login.service.MemberDetailService;

import lombok.RequiredArgsConstructor;

@EnableWebSecurity
@RequiredArgsConstructor
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	private final MemberDetailService memberDetailService;

	@Override
	public void configure(WebSecurity web) throws Exception {
		// TODO Auto-generated method stub
		web.ignoring().antMatchers("/resources/**", "/Member/**");
		web.httpFirewall(defaultHttpFirewall());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http
			.csrf()
			.disable()
			.authorizeRequests()
			.antMatchers("/login", "/signUp", "/sign", "/emailCheck").permitAll()
			//.antMatchers("/common/**").hasAnyRole("MEMBER","MENTO")
			.antMatchers("/menti/**").hasRole("MEMBER")
			.antMatchers("/mento/**").hasRole("MENTO")
			.antMatchers("/admin/**").hasRole("ADMIN")
			.anyRequest().authenticated()
		.and()
			.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/loginProcess")
			.defaultSuccessUrl("/common")
			.usernameParameter("memberEmail")
			.passwordParameter("memberPw")
			.failureHandler(failureHandler())
			.successHandler(successHandler())
			.permitAll()
		.and()
			.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			.invalidateHttpSession(true)
			.permitAll()
		.and()
			.sessionManagement()
			.maximumSessions(1)
			.maxSessionsPreventsLogin(false)
			.expiredUrl("/duplicated_login")
			.sessionRegistry(sessionRegistry());
			
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncode() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberDetailService)
			.passwordEncoder(passwordEncode());
	}
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
		// TODO Auto-generated method stub
		return new LoginSuccessHandler();
	}

	@Bean
	public AuthenticationFailureHandler failureHandler() {
		// TODO Auto-generated method stub
		return new LoginFailHandler();
	}
	
	@Bean
    public HttpFirewall defaultHttpFirewall() { //url 더블슬러쉬 허용
        return new DefaultHttpFirewall();
    }
}
