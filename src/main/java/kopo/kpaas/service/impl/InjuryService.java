package kopo.kpaas.service.impl;

import kopo.kpaas.dto.InjuryDTO;
import kopo.kpaas.mapper.IInjuryMapper;
import kopo.kpaas.service.IInjuryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class InjuryService implements IInjuryService {

    private final IInjuryMapper injuryMapper;  // Injected via constructor due to @RequiredArgsConstructor

    @Override
    public void saveInjury(InjuryDTO pDTO) {
        log.info("Saving injury: Class = {}, Confidence = {}", pDTO.getInjuryClass(), pDTO.getConfidenceLevel());
        try {
            injuryMapper.insertInjury(pDTO);
            log.info("Injury saved successfully in the database.");
        } catch (Exception e) {
            log.error("Error saving injury to the database: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public List<InjuryDTO> getInjuries() {
        log.info("Fetching all injuries from the database.");
        try {
            List<InjuryDTO> rDTO = injuryMapper.getAllInjuries();
            log.info("Injuries fetched successfully, count: {}", rDTO.size());
            return rDTO;
        } catch (Exception e) {
            log.error("Error fetching injuries from the database: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public InjuryDTO getLatestInjury() {
        return injuryMapper.getLatestInjury();
    }
}
