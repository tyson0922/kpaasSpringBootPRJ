package kopo.kpaas.dto;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
public class InjuryDTO {
    private Integer injurySeq;  // for INJURY_SEQ
    private String userId;  // for USER_ID
    private String injuryClass;  // for INJURY_CLASS
    private BigDecimal confidenceLevel;  // for CONFIDENCE_LEVEL
    private String regId;  // for REG_ID
    private LocalDateTime regDt;  // for REG_DT
    private String chgId;
    private LocalDateTime chgDt;
}
