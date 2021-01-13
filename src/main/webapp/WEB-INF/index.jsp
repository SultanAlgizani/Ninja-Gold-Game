<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Ninja Gold Game</title>
            <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
            <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
            <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        </head>
        <body class="container mt-5">

            <div>
                <h3>Your Gold: ${gold}</h3>
                <a href="/clear">Reset</a>
            </div>
            <div class="d-flex justify-content-around">
                <div class="card text-center" style="width: 200px; border: solid 2px black;">
                    <div class="card-body">
                        <h5 class="card-title">Farm</h5>
                        <p class="card-text">(earns 10-20 gold)</p>
                        <form method=POST action="/">
                            <input type="hidden" name="location" value="farm">
                            <button class="btn btn-outline-dark ">Find Gold!</button>
                        </form>
                    </div>
                </div>

                <div class="card text-center" style="width: 200px; border: solid 2px black;">
                    <div class="card-body">
                        <h5 class="card-title">Cave</h5>
                        <p class="card-text">(earns 5-10 gold)</p>
                        <form method=POST action="/">
                            <input type="hidden" name="location" value="cave">
                            <button class="btn btn-outline-dark ">Find Gold!</button>
                        </form>
                    </div>
                </div>

                <div class="card text-center" style="width: 200px; border: solid 2px black;">
                    <div class="card-body">
                        <h5 class="card-title">House</h5>
                        <p class="card-text">(earns 2-5 gold)</p>
                        <form method=POST action="/">
                            <input type="hidden" name="location" value="house">
                            <button class="btn btn-outline-dark ">Find Gold!</button>
                        </form>
                    </div>
                </div>

                <div class="card text-center" style="width: 200px; border: solid 2px black;">
                    <div class="card-body">
                        <h5 class="card-title">Casino</h5>
                        <p class="card-text">(earns/takes 0-50 gold)</p>
                        <form method=POST action="/">
                            <input type="hidden" name="location" value="casino">
                            <button class="btn btn-outline-dark ">Find Gold!</button>
                        </form>
                    </div>
                </div>

                <div class="card text-center" style="width: 200px; border: solid 2px black;">
                    <div class="card-body">
                        <h5 class="card-title">Spa</h5>
                        <p class="card-text">(takes 5-20 gold)</p>
                        <form method=POST action="/">
                            <input type="hidden" name="location" value="spa">
                            <button class="btn btn-outline-dark ">Spend Gold!</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <h2>Activities:</h2>
                <div>
                    <div class=" p-3 mb-3 mb-md-0 mr-md-3 bg-light" 
                    style="border: solid 2px black; overflow-y: scroll; height: 200px; display: flex; flex-direction: column-reverse;">
                        <c:forEach items="${activities}" var="activity">
                            <p style="${activity.contains(" lost") ? "color: red" :"color: green"}";">${activity}</p>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </body>

        </html>