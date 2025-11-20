<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Packages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css'/>">
</head>
<body>

<header class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="<c:url value='/dashboard'/>">
                <span class="brand-mark">✦</span> Nomad Atelier
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/dashboard'/>">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/destinations'/>">Destinations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value='/packages'/>">Packages</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class="container text-center py-5">
    <p class="badge bg-primary text-white">Package Lab</p>
    <h1 class="display-5 my-3">Turn destination moodboards into ready-to-sell journeys.</h1>
    <p class="lead">Each package is a modular experience with price, duration, and hero imagery dialed in.</p>
    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mt-4">
        <a class="btn btn-outline-secondary" href="<c:url value='/dashboard'/>">← Back to Dashboard</a>
        <a class="btn btn-primary" href="<c:url value='/destinations'/>">Update Destinations ✦</a>
    </div>
</section>

<c:if test="${not empty packages}">
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-4">
                <p class="badge bg-secondary">Spotlight Journeys</p>
                <h2><c:out value="${fn:length(packages)}"/> live experiences</h2>
                <p>Visualize the current drops across your studio.</p>
            </div>
            <div class="row">
                <c:forEach var="pkg" items="${packages}" end="2">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <c:set var="coverImage" value="${empty pkg.coverImage ? 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df' : pkg.coverImage}"/>
                            <img src="${coverImage}" class="card-img-top" alt="<c:out value="${pkg.title}"/>" style="height: 200px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="badge bg-info">Duration: <c:out value="${pkg.durationDays}"/>d</span>
                                    <span class="text-success fw-bold">$<c:out value="${pkg.price}"/></span>
                                </div>
                                <h5 class="card-title mt-2"><c:out value="${pkg.title}"/></h5>
                                <c:if test="${not empty pkg.highlights}">
                                    <ul class="list-unstyled text-muted small">
                                        <c:forEach var="highlight" items="${pkg.highlights}" end="1">
                                            <li>✓ <c:out value="${highlight}"/></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:if>

<main class="container py-5">
    <div class="text-center mb-5">
        <p class="badge bg-secondary">Compose + Iterate</p>
        <h2>Active Packages</h2>
        <p>Layer pricing, duration, and narrative in one fluid canvas.</p>
    </div>
    <div class="row g-5">
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title mb-3">Compose a Package</h3>
                    <form method="post" action="<c:url value='/packages'/>">
                        <input type="hidden" name="action" value="create">
                        <div class="mb-3">
                            <label for="title" class="form-label">Title</label>
                            <input type="text" id="title" name="title" class="form-control" required placeholder="e.g., Sunrise & Sound Healing">
                        </div>
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label for="destinationId" class="form-label">Destination</label>
                                <select id="destinationId" name="destinationId" class="form-select" required>
                                    <option value="">— Choose a destination —</option>
                                    <c:forEach var="destination" items="${destinations}">
                                        <option value="${destination.id}"><c:out value="${destination.name}"/></option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="durationDays" class="form-label">Duration (days)</label>
                                <input type="number" id="durationDays" min="1" name="durationDays" class="form-control" value="5">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="price" class="form-label">Price (USD)</label>
                                <input type="number" id="price" step="0.01" min="0" name="price" class="form-control" value="1500">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="coverImage" class="form-label">Cover Image URL</label>
                            <input type="url" id="coverImage" name="coverImage" class="form-control" placeholder="https://images.unsplash.com/...">
                        </div>
                        <div class="mb-3">
                            <label for="highlights" class="form-label">Highlights (one per line)</label>
                            <textarea id="highlights" name="highlights" class="form-control" rows="3" placeholder="Private sunrise cruise&#10;Chef table dinner&#10;Immersive workshop"></textarea>
                        </div>
                        <button class="btn btn-primary w-100" type="submit">Publish Package</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Active Packages</h3>
                    <c:if test="${empty packages}">
                        <p class="text-muted">No packages yet. Stitch the first story using the form.</p>
                    </c:if>
                    <div class="list-group">
                        <c:forEach var="pkg" items="${packages}">
                            <div class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1"><c:out value="${pkg.title}"/></h5>
                                    <small class="text-success fw-bold">$<c:out value="${pkg.price}"/></small>
                                </div>
                                <p class="mb-1">
                                    <c:forEach var="destination" items="${destinations}">
                                        <c:if test="${destination.id == pkg.destinationId}">
                                            <span class="badge bg-info"><c:out value="${destination.name}"/></span>
                                        </c:if>
                                    </c:forEach>
                                    <span class="badge bg-secondary"><c:out value="${pkg.durationDays}"/> days</span>
                                </p>
                                <c:if test="${not empty pkg.highlights}">
                                    <ul class="list-unstyled small mt-2">
                                        <c:forEach var="highlight" items="${pkg.highlights}">
                                            <li>✓ <c:out value="${highlight}"/></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                                <div class="mt-3">
                                    <button class="btn btn-sm btn-outline-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#editPackage-${pkg.id}">
                                        Edit
                                    </button>
                                    <form method="post" action="<c:url value='/packages'/>" onsubmit="return confirm('Remove this package?');" class="d-inline ms-1">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${pkg.id}">
                                        <button class="btn btn-sm btn-outline-danger" type="submit">Delete</button>
                                    </form>
                                </div>
                                <div class="collapse mt-3" id="editPackage-${pkg.id}">
                                    <div class="card card-body">
                                        <form method="post" action="<c:url value='/packages'/>">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="id" value="${pkg.id}">
                                            <div class="mb-2">
                                                <label class="form-label">Title</label>
                                                <input type="text" name="title" class="form-control" value="${pkg.title}">
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 mb-2"><label>Destination</label>
                                                    <select name="destinationId" class="form-select">
                                                        <c:forEach var="destination" items="${destinations}">
                                                            <option value="${destination.id}" <c:if test="${destination.id == pkg.destinationId}">selected</c:if>>
                                                                <c:out value="${destination.name}"/>
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4 mb-2"><label>Duration</label><input type="number" name="durationDays" class="form-control" value="${pkg.durationDays}"></div>
                                                <div class="col-md-4 mb-2"><label>Price</label><input type="number" step="0.01" name="price" class="form-control" value="${pkg.price}"></div>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Cover Image URL</label>
                                                <input type="url" name="coverImage" class="form-control" value="${pkg.coverImage}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Highlights (one per line)</label>
                                                <textarea name="highlights" class="form-control" rows="2"><c:forEach var="highlight" items="${pkg.highlights}"><c:out value="${highlight}"/>&#10;</c:forEach></textarea>
                                            </div>
                                            <button class="btn btn-primary w-100" type="submit">Save Changes</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
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


