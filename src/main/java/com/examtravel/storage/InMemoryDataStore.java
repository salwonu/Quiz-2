package com.examtravel.storage;

import com.examtravel.model.Destination;
import com.examtravel.model.TravelPackage;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public final class InMemoryDataStore {
    private static final List<Destination> DESTINATIONS = new ArrayList<>();
    private static final List<TravelPackage> PACKAGES = new ArrayList<>();
    private static final AtomicInteger DESTINATION_SEQ = new AtomicInteger(100);
    private static final AtomicInteger PACKAGE_SEQ = new AtomicInteger(400);

    static {
        seedData();
    }

    private InMemoryDataStore() {
    }

    private static void seedData() {
        Destination bali = new Destination(nextDestinationId(), "Bali Escape", "Indonesia", "Dry Season",
                "Iconic tropical escape with surf-ready beaches and soulful temples.",
                "https://images.unsplash.com/photo-1507525428034-b723cf961d3e", 4.9);
        Destination kyoto = new Destination(nextDestinationId(), "Kyoto Bloom", "Japan", "Spring",
                "Historic shrines beneath ethereal cherry blossoms.",
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb", 4.8);
        Destination reykjavik = new Destination(nextDestinationId(), "Nordic Lights", "Iceland", "Winter",
                "Chase auroras, soak in blue lagoons, and road-trip volcanoes.",
                "https://images.unsplash.com/photo-1469474968028-56623f02e42e", 4.7);

        DESTINATIONS.addAll(List.of(bali, kyoto, reykjavik));

        PACKAGES.add(new TravelPackage(nextPackageId(), "Bali Creative Retreat", bali.getId(), 1299, 6,
                List.of("Boutique eco-villa stay", "Sunrise Mount Batur hike", "Balinese culinary lab"),
                "https://images.unsplash.com/photo-1501117716987-c8e1ecb210cc"));
        PACKAGES.add(new TravelPackage(nextPackageId(), "Kyoto Slow Craft Journey", kyoto.getId(), 1890, 8,
                List.of("Private tea ceremony", "Bike through Arashiyama", "Indigo dyeing workshop"),
                "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df"));
        PACKAGES.add(new TravelPackage(nextPackageId(), "Arctic Aurora Sprint", reykjavik.getId(), 2150, 5,
                List.of("Super-jeep glacier day", "Northern lights chase", "Secret lagoon evening"),
                "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee"));
    }

    private static int nextDestinationId() {
        return DESTINATION_SEQ.incrementAndGet();
    }

    private static int nextPackageId() {
        return PACKAGE_SEQ.incrementAndGet();
    }

    // Destination CRUD
    public static List<Destination> listDestinations() {
        return DESTINATIONS.stream()
                .sorted(Comparator.comparing(Destination::getName))
                .toList();
    }

    public static Optional<Destination> findDestination(int id) {
        return DESTINATIONS.stream().filter(d -> d.getId() == id).findFirst();
    }

    public static Destination createDestination(Destination destination) {
        destination.setId(nextDestinationId());
        DESTINATIONS.add(destination);
        return destination;
    }

    public static boolean updateDestination(Destination updated) {
        return findDestination(updated.getId())
                .map(existing -> {
                    existing.setName(updated.getName());
                    existing.setCountry(updated.getCountry());
                    existing.setSeason(updated.getSeason());
                    existing.setDescription(updated.getDescription());
                    existing.setHeroImage(updated.getHeroImage());
                    existing.setRating(updated.getRating());
                    return true;
                }).orElse(false);
    }

    public static boolean deleteDestination(int id) {
        PACKAGES.removeIf(pkg -> pkg.getDestinationId() == id);
        return DESTINATIONS.removeIf(d -> d.getId() == id);
    }

    // Package CRUD
    public static List<TravelPackage> listPackages() {
        return PACKAGES.stream()
                .sorted(Comparator.comparing(TravelPackage::getTitle))
                .toList();
    }

    public static Optional<TravelPackage> findPackage(int id) {
        return PACKAGES.stream().filter(p -> p.getId() == id).findFirst();
    }

    public static TravelPackage createPackage(TravelPackage travelPackage) {
        travelPackage.setId(nextPackageId());
        PACKAGES.add(travelPackage);
        return travelPackage;
    }

    public static boolean updatePackage(TravelPackage updated) {
        return findPackage(updated.getId())
                .map(existing -> {
                    existing.setTitle(updated.getTitle());
                    existing.setDestinationId(updated.getDestinationId());
                    existing.setPrice(updated.getPrice());
                    existing.setDurationDays(updated.getDurationDays());
                    existing.setHighlights(updated.getHighlights());
                    existing.setCoverImage(updated.getCoverImage());
                    return true;
                }).orElse(false);
    }

    public static boolean deletePackage(int id) {
        return PACKAGES.removeIf(pkg -> pkg.getId() == id);
    }
}


