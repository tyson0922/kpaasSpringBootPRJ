package kopo.kpaas.mapper;

import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.RouteGeometryDTO;
import kopo.kpaas.dto.RoutePropertiesDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HikingRouteMapper {

    // Fetch the polygon points from the database
    PolygonPointsDTO getPolygonPoints();

    // Check if a route with the given ID exists
    Integer countRouteById(String id);

    // Fetch existing route properties by ID
    RoutePropertiesDTO getRoutePropertiesById(String id);

    // Insert new route properties
    void insertRouteProperties(RoutePropertiesDTO routeProperties);

    // Update existing route properties
    void updateRouteProperties(RoutePropertiesDTO routeProperties);

    // Fetch existing route geometry by ID
    RouteGeometryDTO getRouteGeometryById(String id);

    // Insert new route geometry
    void insertRouteGeometry(RouteGeometryDTO routeGeometry);

    // Update existing route geometry
    void updateRouteGeometry(RouteGeometryDTO routeGeometry);
}
