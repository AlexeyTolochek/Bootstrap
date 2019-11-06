<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
  <title>Registration</title>
  <link href="${pageContext.request.contextPath}/css/FormStyle.css" rel="stylesheet" type="text/css" />
  <meta th:name="_csrf" th:content="${_csrf.token}"/>
  <meta th:name="_csrf_header" th:content="${_csrf.headerName}"/>
  <meta charset="utf-8">
</head>
<body>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
  <div>Java<span>Mentor</span></div>
  <section>
    <h2>Форма регистрации</h2><br/>
    <h2>${requestScope.message}</h2>
  </section>
</div>
<div class="login">
  <form:form method="post">
    <p><b>Введите данные</b></p>

    <input type="text" placeholder="Введите имя" name="name"><br>
    <input type="text" placeholder="Введите login" name="login"><br>
    <input type="text" placeholder="Введите пароль" name="password"><br>
    <input type="text" placeholder="Введите адрес" name="address"><br>
    <input type="submit" value="Зарегистрироваться" formaction="${pageContext.request.contextPath}/reg/user">
  </form:form>

</div>



</body>

</html>
