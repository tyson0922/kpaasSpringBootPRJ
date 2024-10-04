package kopo.kpaas.service;

import kopo.kpaas.dto.MailDTO;

public interface IMailService {

    //메일 발송
    int doSendMail(MailDTO pDTO);
}
