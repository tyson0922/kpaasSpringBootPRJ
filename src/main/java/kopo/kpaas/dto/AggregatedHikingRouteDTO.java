package kopo.kpaas.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AggregatedHikingRouteDTO {
    private String userId;                      // User ID for reference
    private List<String> geometries;
    private List<String> uniqueCatNam;         // List of unique difficulties (하, 중, 상)
    private String totalSecLen;                // Total section length
    private String totalUpMin;                 // Total uphill time
    private String totalDownMin;               // Total downhill time
    private List<String> distinctMountainName; // List of unique mountain names
}