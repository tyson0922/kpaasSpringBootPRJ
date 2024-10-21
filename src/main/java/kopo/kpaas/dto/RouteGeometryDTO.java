package kopo.kpaas.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class RouteGeometryDTO {
    private final String id;
    private final String multiLineString;
}