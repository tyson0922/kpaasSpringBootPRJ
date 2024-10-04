package kopo.kpaas.service;

import kopo.kpaas.dto.NoticeDTO;

import java.util.List;

public interface INoticeService {

    /**
     * 공지사항 리스트
     *
     * @return
     * @throws Exception
     */
    List<NoticeDTO> getNoticeList() throws Exception;

    /**
     *
     * @param pDTO 상세내용 조회할 noticeSeq 값
     * @param type 조회수 증가여부(수정보기는 조회수 증가하지 않음
     * @return 조회 결과
     * @throws Exception
     */
    NoticeDTO getNoticeInfo(NoticeDTO pDTO, boolean type) throws Exception;

    /**
     * 공지사항 등록
     *
     * @param pDTO 화면에서 입력된 공지사항 입력된 값들
     * @throws Exception
     */
    void insertNoticeInfo(NoticeDTO pDTO) throws Exception;

    /**
     * 공지사항 삭제
     *
     * @param pDTO 삭제할 noticeSeq 값
     * @throws Exception
     */
    void updateNoticeInfo(NoticeDTO pDTO) throws Exception;

    /**
     * 공지사항 삭제
     *
     * @param pDTO 삭제할 noticeSeq 값
     * @throws Exception
     */
    void deleteNoticeInfo(NoticeDTO pDTO) throws Exception;
}
