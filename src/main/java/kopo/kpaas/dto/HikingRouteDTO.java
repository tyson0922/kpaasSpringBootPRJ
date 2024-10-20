package kopo.kpaas.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HikingRouteDTO {
    private String routeId;
    private String routeGeometry;  // LINESTRING geometry as a string
    private Double secLen;
    private Integer upMin;
    private Integer downMin;
    private String catNam;
    private String mntnNm;
    private Boolean agGeom;

    // Getters and Setters
}
