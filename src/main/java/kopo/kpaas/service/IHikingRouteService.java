package kopo.kpaas.service;


import kopo.kpaas.dto.RoutePropertiesDTO;

import java.util.List;
import java.util.Map;

public interface IHikingRouteService {

    // Method to fetch hiking routes and save them to the database
    Map<String, Object> getAndSaveHikingRoutes(String userId);

    // Method to retrieve hiking routes for display without saving
    List<RoutePropertiesDTO> getHikingRoutesByUserId(String userId);
}
