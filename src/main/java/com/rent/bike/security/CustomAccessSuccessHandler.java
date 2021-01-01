package com.rent.bike.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAccessSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
		Authentication authentication) throws IOException, ServletException {

		// Authentication 객체를 이용해서 사용자가 가진 모든 권한을 문자열로 체크 가능.
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(auth -> {
			roleNames.add(auth.getAuthority());
		});
		
		HttpSession session = request.getSession();
		session.setAttribute("username", ((User) authentication.getPrincipal()).getUsername());

		// 만약 사용자가 ROLE_ADMIN 권한을 가졌다면, 로그인 직후 곧바로 admin/amain 으로 이동

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/admin/adminRepair");
			return;
		}

		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		}

		response.sendRedirect(request.getContextPath());
	}

}
