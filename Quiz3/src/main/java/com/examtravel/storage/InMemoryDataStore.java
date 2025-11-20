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
        Destination bali = new Destination(nextDestinationId(), "Bali", "Indonesia", "All Time",
                "Iconic tropical escape with surf-ready beaches and soulful temples.",
                "https://www.rentalmobilbali.net/wp-content/uploads/2019/12/Sunset-Pura-Tanah-Lot-Bali-Feature-Image.jpg",5.0);
        Destination kyoto = new Destination(nextDestinationId(), "Kyoto", "Japan", "Spring",
                "Historic shrines beneath ethereal cherry blossoms.",
                "https://www.pelago.com/img/products/JP-Japan/sagano-romantic-train-one-way-ticket/b5f0662e-7704-475d-a820-9e20c795f026_sagano-romantic-train-one-way-ticket-medium.webp", 4.5);
        Destination jakarta = new Destination(nextDestinationId(), "Jakarta", "Indonesia", "all time",
                "Jakarta,[b] officially the Special Capital Region of Jakarta,[c][12] is the capital and largest city of Indonesia and an autonomous region at the provincial level.",
                "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/Jakarta_Indonesia_National-Monument-02.jpg/500px-Jakarta_Indonesia_National-Monument-02.jpg", 3.2);

        DESTINATIONS.addAll(List.of(bali, kyoto, jakarta));

        PACKAGES.add(new TravelPackage(nextPackageId(), "Bali Mountainside", bali.getId(), 1299, 6,
                List.of("Boutique eco-villa stay", "Sunrise Mount Batur hike", "Balinese culinary lab"),
                "https://bali.com/wp-content/uploads/2021/07/bali-mount-agung-covid.jpg"));
        PACKAGES.add(new TravelPackage(nextPackageId(), "Kyoto Journey", kyoto.getId(), 1890, 8,
                List.of("Private tea ceremony", "Bike through Arashiyama", "Indigo dyeing workshop"),
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Kyoto%2C_Japan_%28Unsplash_UIN-pFfJ7c%29.jpg/500px-Kyoto%2C_Japan_%28Unsplash_UIN-pFfJ7c%29.jpg"));
        PACKAGES.add(new TravelPackage(nextPackageId(), "DPR Adventure", jakarta.getId(), 1000000, 365,
                List.of("Rats Hunting", "Finding Syahroni", "Catch the Bahlil"),
                "https://akcdn.detik.net.id/community/media/visual/2022/11/19/kubah-hijau-gedung-dprmpr-senayan-jakarta_169.png?w=700&q=90"));
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


