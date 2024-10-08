package kopo.kpaas.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeDTO {
    private String noticeSeq; //기본키, 순번

    private String title; //제목

    private String noticeYn; //공지글 여부

    private String contents; //글 내용

    private String userId; // 작성자

    private String readCnt; //조회수

    private String regId; // 등록자 아이디

    private String regDt; //등록일

    private String chgDt; //수정일

    private String userName; //수정일
}
