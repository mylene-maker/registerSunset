<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="parts/script-style.jsp"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Inscription</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light shadow navbar-bg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img src="images/logo.png" width="86"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="http://localhost:8080/home">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/reserved">Reserver</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/myaccount">Mon compte</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="text-center d-flex flex-column align-items-center">

<h1 class="text-center mt-5">Inscription</h1>

    <div>
        <c:forEach items="${errorsHibernate}" var="hibernateError">
            <p class="text-danger">${hibernateError.message}</p>
        </c:forEach>
        <c:forEach items="${errors}" var="error">
            <p class="text-danger">${error}</p>
        </c:forEach>

    </div>

<form method="post" class="mt-5 w-75 text-center">
    <div class="form-outline m">
                                            <input type="text" value="${saisie.getLastname()}" id="lastname" name="lastname" class="form-control form-control-lg border-0 border-bottom text-center" placeholder="Votre Nom"/>
                                            <label class="form-label" for="lastname"></label>
                                        </div>

                                        <div class="form-outline ">
                                            <input type="text" value="${saisie.getFirstname()}"id="firstname" name="firstname" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Votre Prénom"/>
                                            <label class="form-label" for="firstname"></label>
                                        </div>

                                        <div class="form-outline ">
                                            <input type="email" value="${saisie.getEmail()}" id="email" name="email" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Votre Email"/>
                                            <label class="form-label" for="email"></label>
                                        </div>

                                        <div class="form-outline ">
                                            <input type="number" value="${saisie.getStreet_number()}" id="streetNumber" name="streetNumber" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Numéro de rue"/>
                                            <label class="form-label" for="streetNumber"></label>
                                        </div>

                                        <div class="form-outline ">
                                            <input type="text" value="${saisie.getStreet_name()}" id="streetName" name="streetName" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Nom de rue"/>
                                            <label class="form-label" for="streetName"></label>
                                        </div>

                                        <div class="form-outline ">
                                            <input type="text" value="${saisie.getZip_code()}" id="zipCode" name="zipCode" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Code postal"/>
                                            <label class="form-label" for="zipCode"></label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <select id="country" name="country" class="form-select form-select  border-0 border-bottom text-center">
                                                <option value="" disabled selected>Choisissez un pays</option>
                                                <c:forEach items="${countries}" var="country">
                                                    <option value="${country}">${country.displayName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="form-outline">
                                            <input type="password" value="${saisie.getPassword()}" id="password" name="password" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Mot de passe"/>
                                            <label class="form-label" for="Password"></label>
                                        </div>

                                        <div class="form-outline ">
                                            <input type="password" value="${saisie.getConfirmPassword()}" id="confirmPassword" name="confirmPassword" class="form-control form-control-lg  border-0 border-bottom text-center" placeholder="Confirmer le Mot de passe"/>
                                            <label class="form-label" for="confirmPassword"></label>
                                        </div>


    <!-- Submit button -->
    <button data-mdb-ripple-init type="submit" class="btn btn-dark btn-block mb-4 w-50">S'inscrire</button>

    <!-- Register buttons -->
    <div class="text-center">
        <p>J'ai déjà un compte <a href="http://localhost:8080/login" class="label">Me connecter</a></p>
    </div>
</form>
</section>
<%--<section class="bg-image vh-100 "--%>
<%--         style="background-image: url('https://images4.alphacoders.com/467/4674.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">--%>
<%--    <div class="mask d-flex align-items-center vh-100 gradient-custom-3">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="row d-flex justify-content-center align-items-center">--%>
<%--                <div class="col-12 col-md-9 col-lg-7 col-xl-6">--%>
<%--                    <div class="card" style="border-radius: 15px; margin: 40px; background-color: rgba(23, 23, 56, 0.80); color: white">--%>
<%--                        <div class="card-body p-5">--%>
<%--                            <h2 class="text-uppercase text-center mb-5">Inscription</h2>--%>

<%--                            <div>--%>
<%--                                <c:forEach items="${errorsHibernate}" var="hibernateError">--%>
<%--                                    <p class="text-danger">${hibernateError.message}</p>--%>
<%--                                </c:forEach>--%>
<%--                                <c:forEach items="${errors}" var="error">--%>
<%--                                    <p class="text-danger">${error}</p>--%>
<%--                                </c:forEach>--%>

<%--                            </div>--%>

<%--                            <form method="post">--%>

<%--                                <div class="form-outline m">--%>
<%--                                    <input type="text" value="${saisie.getLastname()}" id="lastname" name="lastname" class="form-control form-control-lg" placeholder="Votre Nom"/>--%>
<%--                                    <label class="form-label" for="lastname"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline ">--%>
<%--                                    <input type="text" value="${saisie.getFirstname()}"id="firstname" name="firstname" class="form-control form-control-lg" placeholder="Votre Prénom"/>--%>
<%--                                    <label class="form-label" for="firstname"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline ">--%>
<%--                                    <input type="email" value="${saisie.getEmail()}" id="email" name="email" class="form-control form-control-lg" placeholder="Votre Email"/>--%>
<%--                                    <label class="form-label" for="email"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline ">--%>
<%--                                    <input type="number" value="${saisie.getStreet_number()}" id="streetNumber" name="streetNumber" class="form-control form-control-lg" placeholder="Numéro de rue"/>--%>
<%--                                    <label class="form-label" for="streetNumber"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline ">--%>
<%--                                    <input type="text" value="${saisie.getStreet_name()}" id="streetName" name="streetName" class="form-control form-control-lg" placeholder="Nom de rue"/>--%>
<%--                                    <label class="form-label" for="streetName"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline ">--%>
<%--                                    <input type="text" value="${saisie.getZip_code()}" id="zipCode" name="zipCode" class="form-control form-control-lg" placeholder="Code postal"/>--%>
<%--                                    <label class="form-label" for="zipCode"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline mb-4">--%>
<%--                                    <select id="country" name="country" class="form-select form-select">--%>
<%--                                        <option value="" disabled selected>Choisissez un pays</option>--%>
<%--                                        <c:forEach items="${countries}" var="country">--%>
<%--                                            <option value="${country}">${country.displayName}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline">--%>
<%--                                    <input type="password" value="${saisie.getPassword()}" id="password" name="password" class="form-control form-control-lg" placeholder="Mot de passe"/>--%>
<%--                                    <label class="form-label" for="Password"></label>--%>
<%--                                </div>--%>

<%--                                <div class="form-outline ">--%>
<%--                                    <input type="password" value="${saisie.getConfirmPassword()}" id="confirmPassword" name="confirmPassword" class="form-control form-control-lg" placeholder="Confirmer le Mot de passe"/>--%>
<%--                                    <label class="form-label" for="confirmPassword"></label>--%>
<%--                                </div>--%>


<%--                                <div class="d-flex justify-content-center" style="background: linear-gradient(180deg, rgba(253, 210, 19, 0.22) 0%, #F5F5F5 100%); border-radius: 10px;--%>
<%--">--%>
<%--                                    <button type="submit"--%>
<%--                                            class="btn btn-block btn-lg gradient-custom-4 text-body">S'inscrire</button>--%>
<%--                                </div>--%>

<%--                                <p class="text-center mt-5 mb-0">Vous avez déjà un compte? <br/> <a href="http://localhost:8080/login"--%>
<%--                                                                                                        class="fw-bold text-light text-white"><u>Se connecter</u></a></p>--%>

<%--                            </form>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<div class="container-fluid" style="background: #171738;">
    <footer class="py-3">
        <p class="text-center text-muted">© 2023 Mylène SAID OUSSENI</p>
    </footer>
</div>

</body>
</html>