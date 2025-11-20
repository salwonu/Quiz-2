package com.examtravel.web;

import com.examtravel.storage.InMemoryDataStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "dashboardServlet", urlPatterns = {"/", "/dashboard"})
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("destinations", InMemoryDataStore.listDestinations());
        req.setAttribute("packages", InMemoryDataStore.listPackages());
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}


