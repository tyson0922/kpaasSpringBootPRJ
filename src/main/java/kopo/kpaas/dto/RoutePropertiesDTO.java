package kopo.kpaas.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@RequiredArgsConstructor
public class RoutePropertiesDTO {
    private final String userId;      // for USER_ID
    private final String routeId;     // for ROUTE_ID
    private Integer page;             // for page
    private final String secLen;      // for SEC_LEN
    private final String upMin;       // for UP_MIN
    private final String downMin;     // for DOWN_MIN
    private final String catNam;      // for CAT_NAM
    private final String mntnNm;      // for MNTN_NM
    private final String geometry;    // for GEOMETRY (MULTILINESTRING)

    private String regId;             // for REG_ID
    private LocalDateTime regDt;      // for REG_DT
    private String chgId;             // for CHG_ID
    private LocalDateTime chgDt;      // for CHG_DT
}