package kopo.kpaas.service;


import java.util.Map;

public interface IHikingRouteService {

    // Method to fetch hiking routes and save them to the database
    Map<String, Object> getAndSaveHikingRoutes();
}
