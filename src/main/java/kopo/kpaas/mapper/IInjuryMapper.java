package kopo.kpaas.mapper;

import kopo.kpaas.dto.InjuryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IInjuryMapper {

    // Get the next available INJURY_SEQ for a specific USER_ID
    Integer getNextInjurySeq(String userId);

    // Insert injury data
    void insertInjury(InjuryDTO pDTO);

    // Get all injuries
    List<InjuryDTO> getAllInjuries();

    // Get the latest injury (ordering by INJURY_SEQ)
    InjuryDTO getLatestInjury(String userId);
}