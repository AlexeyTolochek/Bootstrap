package ru.java.mentor.service;

import ru.java.mentor.model.User;
import java.util.List;

public interface UserService {

    List<User> getAllUsers();

    User getUserById(int id);

    User getUserByLogin(String login);

    User editUserView(String edit, User user);

    void deleteUser(User user);

    void dropTable();

    void createTable();

    boolean updateUser(User user, String access);

    boolean addUser(User user);

    boolean addUserAdmin(User user, String access);

    boolean isExistLogin(String login);

    boolean notNullDataLoginPassword(User user);

    boolean notNullDataUser(User user);
}
