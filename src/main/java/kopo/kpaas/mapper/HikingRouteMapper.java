package kopo.kpaas.mapper;

import kopo.kpaas.dto.HikingRouteDTO;
import kopo.kpaas.dto.PolygonPointsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface HikingRouteMapper {

    // Insert a hiking route into the database
    void insertHikingRoute(HikingRouteDTO hikingRoute);

    // Find all saved hiking routes
    List<HikingRouteDTO> findAllRoutes();

    // Fetch the polygon points from the database
    PolygonPointsDTO getPolygonPoints();  // This is the method you're missing
}
