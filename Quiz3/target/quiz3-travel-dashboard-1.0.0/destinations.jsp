<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nomad Atelier | Destinations</title>
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
                        <a class="nav-link active" aria-current="page" href="<c:url value='/destinations'/>">Destinations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/packages'/>">Packages</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class="container text-center py-5">
    <p class="badge bg-primary text-white">Destination Studio</p>
    <h1 class="display-5 my-3">Design iconic places once.<br/>Deploy them across every itinerary.</h1>
    <p class="lead">Every destination holds mood, texture, and story. Shape them with intent.</p>
    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mt-4">
        <a class="btn btn-outline-secondary" href="<c:url value='/dashboard'/>">← Back to Dashboard</a>
        <a class="btn btn-primary" href="<c:url value='/packages'/>">Curate Packages ✦</a>
    </div>
</section>

<c:if test="${not empty destinations}">
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-4">
                <p class="badge bg-secondary">Moodboard-ready</p>
                <h2><c:out value="${fn:length(destinations)}"/> destinations live</h2>
                <p>Spotlighting the latest scenes your studio is rallying behind.</p>
            </div>
            <div class="row">
                <c:forEach var="destination" items="${destinations}" end="2">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <c:set var="heroImage" value="${empty destination.heroImage ? 'https://images.unsplash.com/photo-1469474968028-56623f02e42e' : destination.heroImage}"/>
                            <img src="${heroImage}" class="card-img-top" alt="<c:out value="${destination.name}"/>" style="height: 200px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="badge bg-info"><c:out value="${destination.country}"/></span>
                                    <span class="text-warning">☆ <c:out value="${destination.rating}"/></span>
                                </div>
                                <h5 class="card-title mt-2"><c:out value="${destination.name}"/></h5>
                                <p class="card-text text-muted small"><c:out value="${destination.description}"/></p>
                                <div class="mt-auto">
                                    <span class="badge bg-success-subtle text-success-emphasis rounded-pill"><c:out value="${destination.season}"/> seasonality</span>
                                </div>
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
        <p class="badge bg-secondary">Create + Manage</p>
        <h2>Destination Library</h2>
        <p>Capture sensory narratives, ratings, and launch-ready imagery.</p>
    </div>
    <div class="row g-5">
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title mb-3">Add a Fresh Destination</h3>
                    <form method="post" action="<c:url value='/destinations'/>">
                        <input type="hidden" name="action" value="create">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" id="name" name="name" class="form-control" required placeholder="e.g., Atlas Haven">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="country" class="form-label">Country</label>
                                <input type="text" id="country" name="country" class="form-control" required placeholder="e.g., Morocco">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="season" class="form-label">Best Season</label>
                                <input type="text" id="season" name="season" class="form-control" placeholder="e.g., Sep - Nov">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="rating" class="form-label">Rating (1-5)</label>
                            <input type="number" id="rating" step="0.1" min="1" max="5" name="rating" class="form-control" value="4.8">
                        </div>
                        <div class="mb-3">
                            <label for="heroImage" class="form-label">Hero Image URL</label>
                            <input type="url" id="heroImage" name="heroImage" class="form-control" placeholder="https://images.unsplash.com/...">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Narrative</label>
                            <textarea id="description" name="description" class="form-control" rows="3" placeholder="Why does this place feel alive?"></textarea>
                        </div>
                        <button class="btn btn-primary w-100" type="submit">Create Destination ✦</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Destination Library</h3>
                    <c:if test="${empty destinations}">
                        <p class="text-muted">No destinations yet. Add your first one using the form.</p>
                    </c:if>
                    <c:if test="${not empty destinations}">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Country</th>
                                    <th>Rating</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="destination" items="${destinations}">
                                    <tr>
                                        <td>
                                            <strong><c:out value="${destination.name}"/></strong><br>
                                            <small class="text-muted"><c:out value="${destination.season}"/></small>
                                        </td>
                                        <td><c:out value="${destination.country}"/></td>
                                        <td><span class="badge bg-warning-subtle text-warning-emphasis">☆ <c:out value="${destination.rating}"/></span></td>
                                        <td>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#editCollapse-${destination.id}">Edit</button>
                                                <form method="post" action="<c:url value='/destinations'/>" onsubmit="return confirm('Delete this destination and its packages?');" class="ms-1">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="id" value="${destination.id}">
                                                    <button class="btn btn-sm btn-outline-danger" type="submit">Delete</button>
                                                </form>
                                            </div>
                                            <div class="collapse mt-3" id="editCollapse-${destination.id}">
                                                <div class="card card-body">
                                                    <h5>Edit: <c:out value="${destination.name}"/></h5>
                                                    <form method="post" action="<c:url value='/destinations'/>">
                                                        <input type="hidden" name="action" value="update">
                                                        <input type="hidden" name="id" value="${destination.id}">
                                                        <div class="mb-2">
                                                            <label class="form-label">Name</label>
                                                            <input type="text" name="name" class="form-control" value="${destination.name}">
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 mb-2"><label>Country</label><input type="text" name="country" class="form-control" value="${destination.country}"></div>
                                                            <div class="col-md-4 mb-2"><label>Season</label><input type="text" name="season" class="form-control" value="${destination.season}"></div>
                                                            <div class="col-md-4 mb-2"><label>Rating</label><input type="number" step="0.1" name="rating" class="form-control" value="${destination.rating}"></div>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label class="form-label">Image URL</label>
                                                            <input type="url" name="heroImage" class="form-control" value="${destination.heroImage}">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Narrative</label>
                                                            <textarea name="description" class="form-control" rows="2"><c:out value="${destination.description}"/></textarea>
                                                        </div>
                                                        <button class="btn btn-primary w-100" type="submit">Save Changes</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
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

