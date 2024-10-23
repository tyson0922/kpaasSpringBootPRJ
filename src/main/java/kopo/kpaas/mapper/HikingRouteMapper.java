package kopo.kpaas.mapper;

import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.RouteGeometryDTO;
import kopo.kpaas.dto.RoutePropertiesDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HikingRouteMapper {

    // Check if the user has any saved route data
    int countRoutesByUserId(String userId);

    // Delete the user's route data by userId
    void deleteRoutesByUserId(String userId);

    // Insert new route data using RoutePropertiesDTO
    void insertRouteProperties(RoutePropertiesDTO routeProperties);
}
