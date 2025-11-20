<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nomad Atelier | Travel Operating System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css'/>">
</head>
<body>
<section class="hero">
    <div>
        <p class="pill">Quiz 3 Final · JSP + Servlets</p>
        <h1>Design once, scale everywhere.<br/>Travel like a creative director.</h1>
        <p>Nomad Atelier is a bespoke travel operating system where destinations,
            curated packages, and moodboards sync across your creative studio.</p>
        <div style="display:flex; gap:1rem; justify-content:center; flex-wrap:wrap;">
            <a href="<c:url value='/destinations'/>" class="btn">Manage Destinations →</a>
            <a href="<c:url value='/packages'/>" class="btn" style="background:linear-gradient(135deg,#20c997,#82c7ff); box-shadow:0 15px 30px rgba(32,201,151,.3);">
                Curate Packages ✦
            </a>
        </div>
    </div>
</section>

<main class="layout">
    <div class="grid">
        <div class="card">
            <h3>Signature Destinations <span class="pill"><c:out value="${fn:length(destinations)}"/> spots</span></h3>
            <c:if test="${not empty destinations}">
                <c:forEach var="destination" items="${destinations}">
                    <article class="stack">
                        <div style="display:flex; justify-content:space-between; align-items:center;">
                            <h4 style="margin:0;"><c:out value="${destination.name}"/></h4>
                            <span class="chip"><c:out value="${destination.country}"/></span>
                        </div>
                        <p style="margin:0; color:var(--ink-light);"><c:out value="${destination.description}"/></p>
                        <small style="color:var(--mint); font-weight:600;">☆ <c:out value="${destination.rating}"/> ·
                            <c:out value="${destination.season}"/></small>
                    </article>
                    <hr style="border:none; border-top:1px dashed rgba(13,19,33,0.15); margin:1.5rem 0;">
                </c:forEach>
            </c:if>
            <c:if test="${empty destinations}">
                <p>No destinations yet. Start by adding your first dreamscape.</p>
            </c:if>
        </div>

        <div class="card">
            <h3>Curated Packages <span class="pill"><c:out value="${fn:length(packages)}"/> live</span></h3>
            <c:if test="${not empty packages}">
                <c:forEach var="pkg" items="${packages}">
                    <article class="stack">
                        <div>
                            <h4 style="margin:0;"><c:out value="${pkg.title}"/></h4>
                            <p class="package-price">$<c:out value="${pkg.price}"/> · <c:out value="${pkg.durationDays}"/> days</p>
                        </div>
                        <ul style="padding-left:1rem; margin:0;">
                            <c:forEach var="highlight" items="${pkg.highlights}">
                                <li><c:out value="${highlight}"/></li>
                            </c:forEach>
                        </ul>
                    </article>
                    <hr style="border:none; border-top:1px dashed rgba(13,19,33,0.15); margin:1.5rem 0;">
                </c:forEach>
            </c:if>
            <c:if test="${empty packages}">
                <p>No packages yet. Craft one in seconds with the builder.</p>
            </c:if>
        </div>
    </div>
</main>
<footer>
    Crafted with ❤️ using Jakarta EE, JSP, and obsessive design energy.
</footer>
</body>
</html>

