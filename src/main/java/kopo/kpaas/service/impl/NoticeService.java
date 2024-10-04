package kopo.kpaas.service.impl;

import kopo.kpaas.dto.NoticeDTO;
import kopo.kpaas.mapper.INoticeMapper;
import kopo.kpaas.service.INoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class NoticeService implements INoticeService {

    //RequiredArgConstructor 어노테이셔으로 생성자를 자동 생성함
    //notionMapper 변수에 이비 메모리에 올라간 INoticeMapper 객체를 넣어줌
    //예전에는 autowired 어노테이션를 통해 설정했었지만, 이젠 생성자를 통해 객체 주입함
    private final INoticeMapper noticeMapper;

    @Override
    public List<NoticeDTO> getNoticeList() throws Exception {

        log.info("{}.getNoticeList() start!", this.getClass().getName());

        return noticeMapper.getNoticeList();
    }

    @Transactional
    @Override
    public NoticeDTO getNoticeInfo(NoticeDTO pDTO, boolean type) throws Exception {

        log.info("{}.getNoticeInfo strart!", this.getClass().getName());

        //상세보기할 때마다, 조회수 증가하기(수정보기는 제외)
        //조회수 증가에 따라 트랜젝션 필요
        if (type) {
            log.info("Update ReadCNT");
            noticeMapper.updateNoticeReadCnt(pDTO);
        }

        //Mapper 호출(SQL 호출)
        return noticeMapper.getNoticeInfo(pDTO);

    }

    @Transactional
    @Override
    public void insertNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info("{}.insertNoticeInfo Start!", this.getClass().getName());

        noticeMapper.insertNoticeInfo(pDTO);

    }

    @Transactional
    @Override
    public void updateNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info("{}.updateNoticeInfo Start!", this.getClass().getName());

        noticeMapper.deleteNoticeInfo(pDTO);

    }
    @Transactional
    @Override
    public void deleteNoticeInfo(NoticeDTO pDTO) throws Exception {

        log.info("{}.deleteNoticeInfo Start!", this.getClass().getName());

        noticeMapper.deleteNoticeInfo(pDTO);
    }

}
