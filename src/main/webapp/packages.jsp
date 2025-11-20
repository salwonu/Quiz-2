<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nomad Atelier | Travel Packages</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css'/>">
</head>
<body>
<section class="hero" style="min-height:40vh;">
    <div>
        <p class="pill">Package Lab</p>
        <h1>Turn destination moodboards into ready-to-sell journeys.</h1>
        <p>Each package is a modular experience with price, duration, and hero imagery dialed in.</p>
        <a class="btn" href="<c:url value='/dashboard'/>">← Back to Dashboard</a>
    </div>
</section>

<main class="layout">
    <div class="grid">
        <div class="card form-card">
            <h3>Compose a package</h3>
            <form method="post" action="<c:url value='/packages'/>" class="stack">
                <input type="hidden" name="action" value="create">
                <label>
                    Title
                    <input type="text" name="title" required placeholder="Sunrise & Sound Healing">
                </label>
                <div class="form-row">
                    <label>
                        Destination
                        <select name="destinationId" required>
                            <option value="">— Choose —</option>
                            <c:forEach var="destination" items="${destinations}">
                                <option value="${destination.id}"><c:out value="${destination.name}"/></option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>
                        Duration (days)
                        <input type="number" min="1" name="durationDays" value="5">
                    </label>
                    <label>
                        Price (USD)
                        <input type="number" step="0.01" min="0" name="price" value="1500">
                    </label>
                </div>
                <label>
                    Cover Image URL
                    <input type="url" name="coverImage" placeholder="https://images.unsplash.com/...">
                </label>
                <label>
                    Highlights (one per line)
                    <textarea name="highlights" placeholder="Private sunrise cruise&#10;Chef table dinner&#10;Immersive workshop"></textarea>
                </label>
                <button class="btn" type="submit">Publish package</button>
            </form>
        </div>

        <div class="card">
            <h3>Active packages</h3>
            <c:if test="${empty packages}">
                <p>No packages yet. Stitch the first story on the left.</p>
            </c:if>
            <c:forEach var="pkg" items="${packages}">
                <article class="stack" style="border-bottom:1px dashed rgba(13,19,33,0.15); padding-bottom:1.5rem; margin-bottom:1.5rem;">
                    <div style="display:flex; justify-content:space-between; flex-wrap:wrap; gap:0.5rem;">
                        <div>
                            <h3 style="margin:0;"><c:out value="${pkg.title}"/></h3>
                            <p class="package-price">$<c:out value="${pkg.price}"/> · <c:out value="${pkg.durationDays}"/> days</p>
                        </div>
                        <div>
                            <span class="chip">
                                <c:forEach var="destination" items="${destinations}">
                                    <c:if test="${destination.id == pkg.destinationId}">
                                        <c:out value="${destination.name}"/>
                                    </c:if>
                                </c:forEach>
                            </span>
                        </div>
                    </div>
                    <c:if test="${not empty pkg.highlights}">
                        <ul style="padding-left:1rem; margin:0;">
                            <c:forEach var="highlight" items="${pkg.highlights}">
                                <li><c:out value="${highlight}"/></li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <details>
                        <summary class="ghost-btn" style="display:inline-flex; margin-top:1rem; cursor:pointer;">Edit Package</summary>
                        <form method="post" action="<c:url value='/packages'/>" class="stack" style="margin-top:1rem;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${pkg.id}">
                            <label>
                                Title
                                <input type="text" name="title" value="${pkg.title}">
                            </label>
                            <div class="form-row">
                                <label>
                                    Destination
                                    <select name="destinationId">
                                        <c:forEach var="destination" items="${destinations}">
                                            <option value="${destination.id}" <c:if test="${destination.id == pkg.destinationId}">selected</c:if>>
                                                <c:out value="${destination.name}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </label>
                                <label>
                                    Duration
                                    <input type="number" name="durationDays" value="${pkg.durationDays}">
                                </label>
                                <label>
                                    Price
                                    <input type="number" step="0.01" name="price" value="${pkg.price}">
                                </label>
                            </div>
                            <label>
                                Cover Image URL
                                <input type="url" name="coverImage" value="${pkg.coverImage}">
                            </label>
                            <label>
                                Highlights (one per line)
                                <textarea name="highlights"><c:forEach var="highlight" items="${pkg.highlights}"><c:out value="${highlight}"/>&#10;</c:forEach></textarea>
                            </label>
                            <button class="btn" type="submit">Save changes</button>
                        </form>
                        <form method="post" action="<c:url value='/packages'/>" onsubmit="return confirm('Remove this package?');" style="margin-top:0.5rem;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${pkg.id}">
                            <button class="ghost-btn danger" type="submit">Delete Package</button>
                        </form>
                    </details>
                </article>
            </c:forEach>
        </div>
    </div>
</main>
<footer>
    8 CRUD flows, one cohesive creative OS.
</footer>
</body>
</html>


