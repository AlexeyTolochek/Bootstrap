package ru.java.mentor.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import ru.java.mentor.model.Role;
import ru.java.mentor.model.User;
import ru.java.mentor.repositories.RoleRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        HttpSession session = request.getSession();
        User user = (User) authentication.getPrincipal();

        session.setAttribute("user", user);
        session.setAttribute("authorities", authentication.getAuthorities());

        response.setStatus(HttpServletResponse.SC_OK);

        //delete
        Role adminRole =  roleRepository.findById(1);

        if (user.getRoles().contains(adminRole)) {
            response.sendRedirect("admin");
        } else {
            response.sendRedirect("user");
        }
    }
}
