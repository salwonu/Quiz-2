<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nomad Atelier | Destinations</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css'/>">
</head>
<body>
<section class="hero" style="min-height:40vh;">
    <div>
        <p class="pill">Destination Studio</p>
        <h1>Design iconic places once.<br/>Deploy them across every itinerary.</h1>
        <p>Every destination holds mood, texture, and story. Shape them with intent.</p>
        <a class="btn" href="<c:url value='/dashboard'/>">← Back to Dashboard</a>
    </div>
</section>

<main class="layout">
    <div class="grid">
        <div class="card form-card">
            <h3>Add a fresh destination</h3>
            <form method="post" action="<c:url value='/destinations'/>" class="stack">
                <input type="hidden" name="action" value="create">
                <div class="form-row">
                    <label>
                        Name
                        <input type="text" name="name" required placeholder="Atlas Haven">
                    </label>
                    <label>
                        Country
                        <input type="text" name="country" required placeholder="Morocco">
                    </label>
                    <label>
                        Season sweet-spot
                        <input type="text" name="season" placeholder="September - November">
                    </label>
                </div>
                <label>
                    Rating (1 - 5)
                    <input type="number" step="0.1" min="1" max="5" name="rating" value="4.8">
                </label>
                <label>
                    Hero Image URL
                    <input type="url" name="heroImage" placeholder="https://images.unsplash.com/...">
                </label>
                <label>
                    Narrative
                    <textarea name="description" placeholder="Why does this place feel alive?"></textarea>
                </label>
                <button class="btn" type="submit">Create destination ✦</button>
            </form>
        </div>

        <div class="card">
            <h3>Destination library</h3>
            <c:if test="${empty destinations}">
                <p>No destinations yet. Add your first above.</p>
            </c:if>
            <c:if test="${not empty destinations}">
                <table>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Country</th>
                        <th>Season</th>
                        <th>Rating</th>
                        <th>Description</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="destination" items="${destinations}">
                        <tr>
                            <td><c:out value="${destination.name}"/></td>
                            <td><c:out value="${destination.country}"/></td>
                            <td><c:out value="${destination.season}"/></td>
                            <td><c:out value="${destination.rating}"/></td>
                            <td style="max-width:240px;"><c:out value="${destination.description}"/></td>
                            <td>
                                <div class="table-actions">
                                    <details style="width:100%;">
                                        <summary class="ghost-btn" style="cursor:pointer;">Edit</summary>
                                        <form method="post" action="<c:url value='/destinations'/>" class="stack" style="margin-top:0.5rem;">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="id" value="${destination.id}">
                                            <label>
                                                Name
                                                <input type="text" name="name" value="${destination.name}">
                                            </label>
                                            <div class="form-row">
                                                <label>Country
                                                    <input type="text" name="country" value="${destination.country}">
                                                </label>
                                                <label>Season
                                                    <input type="text" name="season" value="${destination.season}">
                                                </label>
                                                <label>Rating
                                                    <input type="number" step="0.1" min="1" max="5" name="rating" value="${destination.rating}">
                                                </label>
                                            </div>
                        <label>
                            Hero Image URL
                            <input type="url" name="heroImage" value="${destination.heroImage}">
                        </label>
                                            <label>
                                                Narrative
                                                <textarea name="description"><c:out value="${destination.description}"/></textarea>
                                            </label>
                                            <button class="btn" type="submit" style="width:100%;">Save changes</button>
                                        </form>
                                    </details>
                                    <form method="post" action="<c:url value='/destinations'/>" onsubmit="return confirm('Delete this destination and its packages?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${destination.id}">
                                        <button class="ghost-btn danger" type="submit">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</main>
<footer>
    Crafted for Quiz 3 · Every CRUD action optimized for flow.
</footer>
</body>
</html>

