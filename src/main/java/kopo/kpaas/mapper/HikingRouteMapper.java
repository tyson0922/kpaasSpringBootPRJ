package kopo.kpaas.mapper;

import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.dto.RouteGeometryDTO;
import kopo.kpaas.dto.RoutePropertiesDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HikingRouteMapper {

    // Fetch polygon points from the database
    PolygonPointsDTO getPolygonPoints();

    // Insert route properties into the RouteProperties table
    void insertRouteProperties(RoutePropertiesDTO routeProperties);

    // Insert route geometry into the RouteGeometry table
    void insertRouteGeometry(RouteGeometryDTO routeGeometry);

    // Update route geometry if ID exists and geometry is null
    void updateRouteGeometry(RouteGeometryDTO routeGeometry);

    // Check if a RouteProperties record exists by ID
    int countRoutePropertiesById(String id);

    // Check if a RouteGeometry record exists by ID
    int countRouteGeometryById(String id);
}
