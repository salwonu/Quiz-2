
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Operating System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css'/>">
</head>
<body>
<header class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <span class="brand-mark">✦</span>
                
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value='/dashboard'/>">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/destinations'/>">Destinations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/packages'/>">Packages</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<main class="container my-5">
    <section class="hero-home text-center">
        <div class="hero-content">
            <p class="badge bg-primary text-white">Quiz 3 Final · JSP + Servlets</p>
            <h1 class="display-4 my-3">Design once, scale everywhere.<br/>Travel like a creative director.</h1>
            <p class="lead">Nomad Atelier is a bespoke travel operating system where destinations,
                curated packages, and moodboards sync across your creative studio.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center my-4">
                <a href="<c:url value='/destinations'/>" class="btn btn-primary btn-lg">Manage Destinations →</a>
                <a href="<c:url value='/packages'/>" class="btn btn-outline-secondary btn-lg">Curate Packages ✦</a>
            </div>
        </div>
    </section>

    <section class="my-5">
        <div class="row text-center">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="card-title"><c:out value="${fn:length(destinations)}"/></h2>
                        <p class="card-text">Signature destinations</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="card-title"><c:out value="${fn:length(packages)}"/></h2>
                        <p class="card-text">Live experiential drops</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <c:set var="playbooks" value="${fn:length(destinations) + fn:length(packages)}"/>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="card-title"><c:out value="${playbooks}"/></h2>
                        <p class="card-text">Playbooks synced</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <c:if test="${not empty destinations or not empty packages}">
        <section class="gallery-section my-5">
            <div class="text-center mb-4">
                <p class="badge bg-secondary">Live preview</p>
                <h2>Signature destinations & curated capsules</h2>
                <p>Rich visuals keep your team aligned on mood, texture, and story.</p>
            </div>
            <div class="row">
                <c:forEach var="destination" items="${destinations}" end="2">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <c:set var="heroImage" value="${empty destination.heroImage ? 'https://images.unsplash.com/photo-1506744038136-46273834b3fb' : destination.heroImage}"/>
                            <img src="${heroImage}" class="card-img-top" alt="<c:out value="${destination.name}"/>">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="badge bg-info"><c:out value="${destination.country}"/></span>
                                    <span>☆ <c:out value="${destination.rating}"/></span>
                                </div>
                                <h5 class="card-title mt-2"><c:out value="${destination.name}"/></h5>
                                <p class="card-text"><c:out value="${destination.description}"/></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="pkg" items="${packages}" end="2">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <c:set var="coverImage" value="${empty pkg.coverImage ? 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee' : pkg.coverImage}"/>
                            <img src="${coverImage}" class="card-img-top" alt="<c:out value="${pkg.title}"/>">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="badge bg-success">Package</span>
                                    <span>$<c:out value="${pkg.price}"/></span>
                                </div>
                                <h5 class="card-title mt-2"><c:out value="${pkg.title}"/></h5>
                                <p class="card-text">Duration: <c:out value="${pkg.durationDays}"/> days</p>
                                <c:if test="${not empty pkg.highlights}">
                                    <ul class="list-unstyled">
                                        <c:forEach var="highlight" items="${pkg.highlights}" end="1">
                                            <li><c:out value="${highlight}"/></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </c:if>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Signature Destinations <span class="badge bg-primary"><c:out value="${fn:length(destinations)}"/> spots</span></h3>
                </div>
                <ul class="list-group list-group-flush">
                    <c:if test="${not empty destinations}">
                        <c:forEach var="destination" items="${destinations}">
                            <li class="list-group-item">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="mb-1"><c:out value="${destination.name}"/></h5>
                                    <span class="badge bg-info"><c:out value="${destination.country}"/></span>
                                </div>
                                <p class="mb-1"><c:out value="${destination.description}"/></p>
                                <small class="text-muted">☆ <c:out value="${destination.rating}"/> · <c:out value="${destination.season}"/></small>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty destinations}">
                        <li class="list-group-item">No destinations yet. Start by adding your first dreamscape.</li>
                    </c:if>
                </ul>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Curated Packages <span class="badge bg-success"><c:out value="${fn:length(packages)}"/> live</span></h3>
                </div>
                <ul class="list-group list-group-flush">
                    <c:if test="${not empty packages}">
                        <c:forEach var="pkg" items="${packages}">
                            <li class="list-group-item">
                                <div>
                                    <h5 class="mb-1"><c:out value="${pkg.title}"/></h5>
                                    <p class="mb-1 text-muted">$<c:out value="${pkg.price}"/> · <c:out value="${pkg.durationDays}"/> days</p>
                                </div>
                                <ul class="list-unstyled mt-2">
                                    <c:forEach var="highlight" items="${pkg.highlights}">
                                        <li><c:out value="${highlight}"/></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty packages}">
                        <li class="list-group-item">No packages yet. Craft one in seconds with the builder.</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</main>
<footer class="text-center py-4 bg-light mt-5">
    Crafted by 112, 125, 220 students.
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


