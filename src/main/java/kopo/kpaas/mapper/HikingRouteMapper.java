package kopo.kpaas.mapper;

import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.RoutePropertiesDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HikingRouteMapper {

    // Fetch the polygon points
    PolygonPointsDTO getPolygonPoints(String userId);

    // Check if the user has any saved route data
    int countRoutesByUserId(String userId);

    // Delete the user's route data by userId
    void deleteRoutesByUserId(String userId);

    // Insert new route data using RoutePropertiesDTO
    void insertRouteProperties(RoutePropertiesDTO routeProperties);

    // Retrieve hiking route data for a given user
    List<RoutePropertiesDTO> findRoutesByUserId(String userId);
}
