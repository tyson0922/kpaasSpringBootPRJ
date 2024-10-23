package kopo.kpaas.service.impl;

import kopo.kpaas.dto.InjuryDTO;
import kopo.kpaas.mapper.IInjuryMapper;
import kopo.kpaas.service.IInjuryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class InjuryService implements IInjuryService {

    private final IInjuryMapper injuryMapper;

    @Override
    public void saveInjury(InjuryDTO pDTO) throws Exception {
        // Get the next available INJURY_SEQ for the given USER_ID
        Integer nextInjurySeq = injuryMapper.getNextInjurySeq(pDTO.getUserId());
        pDTO.setInjurySeq(nextInjurySeq);  // Set the generated injurySeq in DTO

        log.info("Saving injury: Class = {}, Confidence = {}, Injury Seq = {}, User ID = {}",
                pDTO.getInjuryClass(), pDTO.getConfidenceLevel(), nextInjurySeq, pDTO.getUserId());

        try {
            injuryMapper.insertInjury(pDTO);
            log.info("Injury saved successfully in the database.");
        } catch (Exception e) {
            log.error("Error saving injury to the database: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public List<InjuryDTO> getInjuries() throws Exception {
        return injuryMapper.getAllInjuries();
    }

    @Override
    public InjuryDTO getLatestInjury(String userId) throws Exception {
        return injuryMapper.getLatestInjury(userId);
    }
}