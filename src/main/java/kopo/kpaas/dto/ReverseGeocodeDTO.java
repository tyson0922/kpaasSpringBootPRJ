package kopo.kpaas.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class ReverseGeocodeDTO {
    private final String longitude;
    private final String latitude;
}