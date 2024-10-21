package kopo.kpaas.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class MountainNameDTO {
    private String mountainName; // final because of @RequiredArgsConstructor
}