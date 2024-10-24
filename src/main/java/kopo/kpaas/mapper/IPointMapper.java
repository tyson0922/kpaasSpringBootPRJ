package kopo.kpaas.mapper;

import kopo.kpaas.dto.PolygonPointsDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPointMapper {

    // Select points by user_id
    PolygonPointsDTO selectPoints(String userId);

    // Insert new polygon points for a user
    void insertPoints(PolygonPointsDTO polygonPointsDTO);

    // Delete points for a user before inserting new data
    void deleteByUserId(String userId);

    // Count rows for a specific user_id
    int countRows(String userId);
}