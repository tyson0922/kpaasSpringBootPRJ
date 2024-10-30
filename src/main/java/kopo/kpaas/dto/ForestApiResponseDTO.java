package kopo.kpaas.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class ForestApiResponseDTO {
    private String mountainName;       // Maps to mntnnm
    private String location;           // Maps to mntninfopoflc
    private double height;             // Maps to mntninfohght
    private String description;        // Maps to mntninfodscrt
    private String touristInfo;        // Maps to crcmrsghtnginfodscrt
    private String hikingCourses;      // Maps to crcmrsghtnginfoetcdscrt
    private String transportation;     // Maps to pbtrninfodscrt
    private String image;              // Maps to mntnattchimageseq or hndfmsmtnmapimageseq
}
