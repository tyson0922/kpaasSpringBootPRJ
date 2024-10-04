package kopo.kpaas.dto;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
public class InjuryDTO {
    private int INJURY_SEQ;  // Primary key
    private String injuryClass;
    private BigDecimal confidenceLevel;
    private LocalDateTime detectedAt;
}
