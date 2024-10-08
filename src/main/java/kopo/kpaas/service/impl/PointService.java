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
        int existingRowsCount = pointMapper.countRows();

        if (existingRowsCount == 0) {
            // Insert new row if none exists
            pointMapper.insertPoints(points);
        } else {
            // Update existing row with the latest points
            pointMapper.updatePoints(points);
        }
    }

    @Override
    public PolygonPointsDTO getPoints() {
        return pointMapper.selectPoints();
    }
}
