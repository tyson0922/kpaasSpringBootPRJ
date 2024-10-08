package kopo.kpaas.service;

import kopo.kpaas.dto.PolygonPointsDTO;

public interface IPointService {
    void savePoints(PolygonPointsDTO points);
    PolygonPointsDTO getPoints();
}
