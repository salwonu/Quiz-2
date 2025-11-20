package com.examtravel.web;

import com.examtravel.model.Destination;
import com.examtravel.storage.InMemoryDataStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "destinationServlet", urlPatterns = "/destinations")
public class DestinationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("destinations", InMemoryDataStore.listDestinations());
        req.getRequestDispatcher("/destinations.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            InMemoryDataStore.createDestination(buildDestination(req, false));
        } else if ("update".equals(action)) {
            InMemoryDataStore.updateDestination(buildDestination(req, true));
        } else if ("delete".equals(action)) {
            int id = parseInt(req.getParameter("id"));
            InMemoryDataStore.deleteDestination(id);
        }
        resp.sendRedirect(req.getContextPath() + "/destinations");
    }

    private Destination buildDestination(HttpServletRequest req, boolean includeId) {
        Destination destination = new Destination();
        if (includeId) {
            destination.setId(parseInt(req.getParameter("id")));
        }
        destination.setName(req.getParameter("name"));
        destination.setCountry(req.getParameter("country"));
        destination.setSeason(req.getParameter("season"));
        destination.setDescription(req.getParameter("description"));
        destination.setHeroImage(req.getParameter("heroImage"));
        destination.setRating(parseDouble(req.getParameter("rating"), 4.5));
        return destination;
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


