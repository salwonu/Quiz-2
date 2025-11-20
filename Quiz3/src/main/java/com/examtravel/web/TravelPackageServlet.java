package com.examtravel.web;

import com.examtravel.model.TravelPackage;
import com.examtravel.storage.InMemoryDataStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "travelPackageServlet", urlPatterns = "/packages")
public class TravelPackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("destinations", InMemoryDataStore.listDestinations());
        req.setAttribute("packages", InMemoryDataStore.listPackages());
        req.getRequestDispatcher("/packages.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            InMemoryDataStore.createPackage(buildPackage(req, false));
        } else if ("update".equals(action)) {
            InMemoryDataStore.updatePackage(buildPackage(req, true));
        } else if ("delete".equals(action)) {
            int id = parseInt(req.getParameter("id"));
            InMemoryDataStore.deletePackage(id);
        }
        resp.sendRedirect(req.getContextPath() + "/packages");
    }

    private TravelPackage buildPackage(HttpServletRequest req, boolean includeId) {
        TravelPackage travelPackage = new TravelPackage();
        if (includeId) {
            travelPackage.setId(parseInt(req.getParameter("id")));
        }
        travelPackage.setTitle(req.getParameter("title"));
        travelPackage.setDestinationId(parseInt(req.getParameter("destinationId")));
        travelPackage.setPrice(parseDouble(req.getParameter("price"), 0));
        travelPackage.setDurationDays(parseInt(req.getParameter("durationDays")));
        travelPackage.setCoverImage(req.getParameter("coverImage"));
        String[] highlightValues = req.getParameterValues("highlights");
        List<String> highlights = List.of();
        if (highlightValues != null) {
            highlights = Arrays.stream(highlightValues)
                    .flatMap(raw -> Arrays.stream(raw.split("\\r?\\n")))
                    .map(String::trim)
                    .filter(line -> !line.isEmpty())
                    .toList();
        }
        travelPackage.setHighlights(highlights);
        return travelPackage;
    }

    private int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            return -1;
        }
    }

    private double parseDouble(String value, double fallback) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException ex) {
            return fallback;
        }
    }
}

