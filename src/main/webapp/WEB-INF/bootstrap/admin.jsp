<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <title>AdminBootstrap</title>
  <link rel="icon" href="../img/favicon.ico">
  <link rel="stylesheet" href="../css/my.css">

  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.css" rel="stylesheet">

  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/dashboard.css" rel="stylesheet" type="text/css">
  <link href="../css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="../css/bootstrap-modal.css" rel="stylesheet" />
  <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
  <!--[if lt IE 9]><script src="../js/ie8-responsive-file-warning.js"></script><![endif]-->
  <script src="../js/ie-emulation-modes-warning.js"></script>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <meta th:name="_csrf" th:content="${_csrf.token}"/>
  <meta th:name="_csrf_header" th:content="${_csrf.headerName}"/>
</head>

<body class="bg-light">

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">Project name</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <form action="/user/logout" method="post">
            <button type="submit" class="btn btn-success">Logout</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
        <li class="active"><a href="/admin">Admin <span class="sr-only">(current)</span></a></li>
        <li><a href="/user">User</a></li>
      </ul>
    </div>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Admin panel</h1>
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#tab1" role="tab" data-toggle="tab">Users table</a></li>
            <li role="presentation"><a href="#tab2" role="tab" data-toggle="tab">New User</a></li>
          </ul>

          <div class="tab-content" style="background: white">
            <div role="tabpanel" class="tab-pane active" id="tab1">
                <h4><b> All users</b></h4>
                <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Role</th>
                    <th>Login</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Edit</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${requestScope.list}" var="user" varStatus="vs">
                    <tr>
                      <td> ${user.id} </td>
                      <td> ${user.roles.toString().replaceAll("^\\[|\\]$", "")} </td>
                      <td> ${user.login} </td>
                      <td> ${user.password} </td>
                      <td> ${user.address} </td>
                      <td>
                          <button type="button" class="btn btn-primary" data-toggle="modal"
                                  data-target="#editUserModal${vs.index}">
                            Edit
                          </button>
                          <!-- Modal -->
                          <div class="modal fade" id="editUserModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <form:form method="post" action="${pageContext.request.contextPath}/admin/update">
                              <div class="modal-content">
                              <div class="modal-header">
                                <h3 class="modal-title" id="exampleModalCenterTitle">Edit user ${user.login}</h3>
                              </div>
                              <div class="modal-body">
                                <div class="row justify-content-center">
                                  <div class="col-md-4"></div>
                                  <div class="col-md-4 text-center justify-content-center">
                                    <h4>ID</h4>
                                    <input class="form-control text-center" type="text" name="id"  value="${user.id}" readonly>
                                    <h4>Name</h4>
                                    <input type="text" name="name" class="form-control text-center" value="${user.name}">
                                    <h4>Email</h4>
                                    <input type="text" name="address" class="form-control text-center" value="${user.address}">
                                    <h4>Login</h4>
                                    <input type="text" name="login" class="form-control text-center" value="${user.login}">
                                    <h4>Password</h4>
                                    <input type="text" name="password" class="form-control text-center" value="${user.password}">
                                    <h4>Role</h4>
                                    <select class="custom-select" type="text" name="role" class="form-control text-center">
                                      <option selected>${user.roles.toString().replaceAll("^\\[|\\]$", "")}</option>
                                      <option value="1">USER</option>
                                      <option value="2">ADMIN</option>
                                    </select>
                                </div>
                                  <div class="col-md-4"></div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                                <button type="submit" class="btn btn-primary">Edit user</button>
                              </div>
                            </div>
                            </form:form>
                          </div>
                        </div>
                      </td>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

            <div role="tabpanel" class="tab-pane" id="tab2">
              <h4><b>Add new user</b></h4>
                    <form:form method="post">
                      <div class="row justify-content-center">
                        <div class="col-md-4"></div>
                        <div class="col-md-4 mb-4 text-center justify-content-center">
                          <h4>Name</h4>
                          <input type="text" name="name" class="form-control text-center" placeholder="Enter name"/>
                          <h4>Email</h4>
                          <input type="text" name="address" class="form-control  text-center" placeholder="email"/>
                          <h4>Login</h4>
                          <input type="text" name="login" class="form-control text-center" placeholder="Login"/>
                          <h4>Password</h4>
                          <input type="text" name="password" class="form-control text-center" placeholder="Password"/>
                          <h4>Role</h4>
                          <select class="custom-select form-control text-center" name="role">
                            <option selected value="1">USER</option>
                            <option value="2">ADMIN</option>
                          </select>
                          <br>
                          <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/admin/add">
                            Add new user
                          </button>
                         </div>
                        <div class="col-md-4"></div>
                      </div>
                    </form:form>
              </div>
            </div>
          </div>
      </div>
  </div>




<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--<script>window.jQuery || document.write('<script src="../js/jquery.min.js"><\/script>')</script>-->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap-modalmanager.js"></script>
<script src="../js/bootstrap-modal.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../js/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>


</html>
