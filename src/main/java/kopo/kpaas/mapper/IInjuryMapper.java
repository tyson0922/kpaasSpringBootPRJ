package kopo.kpaas.mapper;

import kopo.kpaas.dto.InjuryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IInjuryMapper {

    void insertInjury(InjuryDTO pDTO);  // pDTO as parameter

    List<InjuryDTO> getAllInjuries();  // rDTO will be used as the return type

    InjuryDTO getLatestInjury();  // Query for the most recent injury

}