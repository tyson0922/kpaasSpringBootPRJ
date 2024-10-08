package kopo.kpaas.mapper;

import kopo.kpaas.dto.PolygonPointsDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPointMapper {
    PolygonPointsDTO selectPoints();

    void insertPoints(PolygonPointsDTO points);

    void updatePoints(PolygonPointsDTO points);

    int countRows();
}
