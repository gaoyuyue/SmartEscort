package cn.attackme.escort.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * Create on 2017/5/19 14:06
 *
 * @description: email服务
 * @author: 高语越 < gaoyuyue@outlook.com >
 */

@Service
public class MailService {
    @Autowired
    private JavaMailSenderImpl mailSender;

    public void sendMail(String from,String to,String title,String content) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
        mimeMessageHelper.setFrom(from);
        mimeMessageHelper.setTo(to);
        mimeMessageHelper.setSubject(title);
        mimeMessageHelper.setText(content);
        mailSender.send(mimeMessage);
    }
}
