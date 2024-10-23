package kopo.kpaas.service;

import kopo.kpaas.dto.InjuryDTO;

import java.util.List;

public interface IInjuryService {

    // Insert a new injury record
    void saveInjury(InjuryDTO pDTO) throws Exception;

    // Get all injuries
    List<InjuryDTO> getInjuries() throws Exception;

    // Get the latest injury
    InjuryDTO getLatestInjury(String userId) throws Exception;
}