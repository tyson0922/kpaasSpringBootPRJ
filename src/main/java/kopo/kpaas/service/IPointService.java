package kopo.kpaas.service;

import kopo.kpaas.dto.PolygonPointsDTO;

public interface IPointService {

    // Save polygon points (delete existing and insert new points)
    void savePoints(PolygonPointsDTO points);

    // Get polygon points for a user
    PolygonPointsDTO getPoints(String userId);
}