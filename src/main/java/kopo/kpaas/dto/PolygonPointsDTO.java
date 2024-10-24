package kopo.kpaas.dto;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@RequiredArgsConstructor
public class PolygonPointsDTO {

    private String userId;           // USER_ID
    private double firstPointLat;     // FirstPointLat
    private double firstPointLng;     // FirstPointLng
    private double secondPointLat;    // SecondPointLat
    private double secondPointLng;    // SecondPointLng
    private double thirdPointLat;     // ThirdPointLat
    private double thirdPointLng;     // ThirdPointLng
    private double fourthPointLat;    // FourthPointLat
    private double fourthPointLng;    // FourthPointLng
    private double centroidLat;       // CentroidLat
    private double centroidLng;       // CentroidLng

    private String regId;             // REG_ID
    private String chgId;             // CHG_ID
    private LocalDateTime regDt;      // REG_DT
    private LocalDateTime chgDt;      // CHG_DT
}