package kopo.kpaas.service;

import kopo.kpaas.dto.InjuryDTO;

import java.util.List;

public interface IInjuryService {
    void saveInjury(InjuryDTO pDTO);

    List<InjuryDTO> getInjuries();

    InjuryDTO getLatestInjury();  // Method to get the most recent injury

}
