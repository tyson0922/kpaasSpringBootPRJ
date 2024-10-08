package kopo.kpaas.dto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PolygonPointsDTO {
    private Double firstPointLat;
    private Double firstPointLng;
    private Double secondPointLat;
    private Double secondPointLng;
    private Double thirdPointLat;
    private Double thirdPointLng;
    private Double fourthPointLat;
    private Double fourthPointLng;
    private Double centroidLat;
    private Double centroidLng;
}
