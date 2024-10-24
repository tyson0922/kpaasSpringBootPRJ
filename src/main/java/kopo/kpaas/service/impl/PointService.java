package kopo.kpaas.service.impl;

import kopo.kpaas.dto.PolygonPointsDTO;
import kopo.kpaas.mapper.IPointMapper;
import kopo.kpaas.service.IPointService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PointService implements IPointService {

    private final IPointMapper pointMapper;

    @Override
    public void savePoints(PolygonPointsDTO points) {
        // Delete existing points for the user
        pointMapper.deleteByUserId(points.getUserId());

        // Insert new points
        pointMapper.insertPoints(points);
    }

    @Override
    public PolygonPointsDTO getPoints(String userId) {
        return pointMapper.selectPoints(userId);
    }
}
