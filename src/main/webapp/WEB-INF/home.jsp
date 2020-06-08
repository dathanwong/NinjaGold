<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row my-3">
                <div class="col-3">
                    <h1>Your Gold:</h1>
                </div>
                <div class="col-2 border border-dark">
                    <h1><c:out value="${gold}"/></h1>
                </div>
                <div class="col-2">
                    <a class="btn btn-primary" href="/reset">Reset</a>
                </div>
            </div>
            <div class="row my-3 justify-content-between">
                <div class="col-2 text-center border border-dark py-5">
                    <div class="row justify-content-center"><h1>Farm</h1></div>
                    <div class="row justify-content-center">(earns 10-20 gold)</div>
                    <div class="row my-2">
                        <div class="col">
                            <a class="btn btn-primary" href="/farm">Find Gold!</a>
                        </div>
                    </div>
                </div>
                <div class="col-2 text-center border border-dark py-5">
                    <div class="row justify-content-center"><h1>Cave</h1></div>
                    <div class="row justify-content-center">(earns 5-10 gold)</div>
                    <div class="row my-2">
                        <div class="col">
                            <a class="btn btn-primary" href="/cave">Find Gold!</a>
                        </div>
                    </div>
                </div>
                <div class="col-2 text-center border border-dark py-5">
                    <div class="row justify-content-center"><h1>House</h1></div>
                    <div class="row justify-content-center">(earns 2-5 gold)</div>
                    <div class="row my-2">
                        <div class="col">
                            <a class="btn btn-primary" href="/house">Find Gold!</a>
                        </div>
                    </div>
                </div>
                <div class="col-2 text-center border border-dark py-5">
                    <div class="row justify-content-center"><h1>Casino!</h1></div>
                    <div class="row justify-content-center">(earns/takes 0-50 gold)</div>
                    <div class="row my-2">
                        <div class="col">
                            <a class="btn btn-primary" href="/casino">Find Gold!</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <h3>Activities:</h3>
            </div>
            <div class="row h-25 border border-dark">
                <ul style="overflow-y: scroll; height: 200px;">
                	<c:forEach items="${events}" var="event">
                		<li <c:if test="${event.contains('lost')}">class="text-danger"</c:if><c:if test="${event.contains('earned')}">class="text-success"</c:if>><c:out value="${event}"/></li>
                	</c:forEach>
                </ul>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>