package kopo.kpaas.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class RoutePropertiesDTO {
    private final String id;
    private final String secLen;
    private final String upMin;
    private final String downMin;
    private final String catNam;
    private final String mntnNm;
}
