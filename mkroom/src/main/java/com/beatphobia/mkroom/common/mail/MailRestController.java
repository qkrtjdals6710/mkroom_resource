package com.beatphobia.mkroom.common.mail;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.service.member.MemberService;

@RestController
public class MailRestController {
	
	private MemberService memberService;
	
	public MailRestController(MemberService memberService) {
		this.memberService = memberService;
	}
	@PostMapping("/sendEmail")
	public ResponseEntity<String> sendEmail(@RequestBody Map<String, String> data) {
		
		String username = "contactMkroom@gmail.com";
		String password = "zdfcxiegwpofdoam";
		// refer : https://stackoverflow.com/questions/10509699/must-issue-a-starttls-command-first
		// SMTP = smtp.gmail.com 
		// Port = 465
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");	
		prop.put("mail.smtp.socketFactory.port", "465");  
	    prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
	    prop.put("mail.smtp.socketFactory.fallback", "false");
		
		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
		});
		// Header 추가 설정
        HttpHeaders resHeaders = new HttpHeaders();
        resHeaders.add("Content-Type", "text/plain;charset=UTF-8");
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(data.get("email"), data.get("name"), "UTF-8"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
			message.setSubject(data.get("subject"));
			message.setText("이름: " + data.get("name") + "\n이메일: " + data.get("email") + "\n메시지: " + data.get("message"));
			Transport.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					             .headers(resHeaders)
					             .body("메일전송이 실패하였습니다");	
		}
		
		
		return ResponseEntity.status(HttpStatus.OK)
				             .headers(resHeaders)
				             .body("메일이 전송되었습니다");
	}
	
	@PostMapping("/sendEmailAfterPayment")
	public ResponseEntity<String> sendEmailAfterPayment(@RequestBody Map<String, String> data) {

	
		Member member = memberService.selectMember(data.get("userId"));
		String toEmail = member.getEmail();
		
		String username = "contactMkroom@gmail.com";
		String password = "zdfcxiegwpofdoam";
		// refer : https://stackoverflow.com/questions/10509699/must-issue-a-starttls-command-first
		// SMTP = smtp.gmail.com 
		// Port = 465
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");	
		prop.put("mail.smtp.socketFactory.port", "465");  
		prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
		prop.put("mail.smtp.socketFactory.fallback", "false");
		
		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		// Header 추가 설정
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "text/plain;charset=UTF-8");
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(data.get("email"), data.get("name"), "UTF-8"));
			// 실제 멤버이메일
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			// 개발용 테스트이메일
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("contactMkroom@gmail.com"));
			message.setSubject("mkroom: 예약확인이메일");
			
			
			StringBuilder htmlBody = new StringBuilder();
			htmlBody.append("<!DOCTYPE html>\r\n"
					+ "<html lang=\"ko\">\r\n"
					+ "<head>\r\n"
					+ "<title></title>\r\n"
					+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n"
					+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
					+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n"
					+ "<style type=\"text/css\">\r\n"
					+ "\r\n"
					+ "body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }\r\n"
					+ "table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }\r\n"
					+ "img { -ms-interpolation-mode: bicubic; }\r\n"
					+ "\r\n"
					+ "img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }\r\n"
					+ "table { border-collapse: collapse !important; }\r\n"
					+ "body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "a[x-apple-data-detectors] {\r\n"
					+ "    color: inherit !important;\r\n"
					+ "    text-decoration: none !important;\r\n"
					+ "    font-size: inherit !important;\r\n"
					+ "    font-family: inherit !important;\r\n"
					+ "    font-weight: inherit !important;\r\n"
					+ "    line-height: inherit !important;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "@media screen and (max-width: 480px) {\r\n"
					+ "    .mobile-hide {\r\n"
					+ "        display: none !important;\r\n"
					+ "    }\r\n"
					+ "    .mobile-center {\r\n"
					+ "        text-align: center !important;\r\n"
					+ "    }\r\n"
					+ "}\r\n"
					+ "div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n"
					+ "</style>\r\n"
					+ "<body style=\"margin: 0 !important; padding: 0 !important; background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">\r\n"
					+ "For what reason would it be advisable for me to think about business content? That might be little bit risky to have crew member like them. \r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
					+ "    <tr>\r\n"
					+ "        <td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\r\n"
					+ "        \r\n"
					+ "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\r\n"
					+ "            <tr>\r\n"
					+ "                <td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 35px;\" bgcolor=\"#F44336\">\r\n"
					+ "               \r\n"
					+ "                <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">\r\n"
					+ "                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\r\n"
					+ "                        <tr>\r\n"
					+ "                            <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\" class=\"mobile-center\">\r\n"
					+ "                                <h1 style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">mkroom</h1>\r\n"
					+ "                            </td>\r\n"
					+ "                        </tr>\r\n"
					+ "                    </table>\r\n"
					+ "                </div>\r\n"
					+ "                \r\n"
					+ "                <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\" class=\"mobile-hide\">\r\n"
					+ "                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\r\n"
					+ "                        <tr>\r\n"
					+ "                            <td align=\"right\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\">\r\n"
					+ "                                <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"right\">\r\n"
					+ "                                    <tr>\r\n"
					+ "                                        <td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;\">\r\n"
					+ "                                            <a href=\"http://localhost:8080/mkroom/\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\"><img src=\"https://img.icons8.com/color/48/000000/small-business.png\" width=\"27\" height=\"23\" style=\"display: block; border: 0px;\"/></a>\r\n"
					+ "                                        </td>\r\n"
					+ "                                    </tr>\r\n"
					+ "                                </table>\r\n"
					+ "                            </td>\r\n"
					+ "                        </tr>\r\n"
					+ "                    </table>\r\n"
					+ "                </div>\r\n"
					+ "              \r\n"
					+ "                </td>\r\n"
					+ "            </tr>\r\n"
					+ "            <tr>\r\n"
					+ "                <td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\r\n"
					+ "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">\r\n"
					+ "                            <img src=\"https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" /><br>\r\n"
					+ "                            <h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\">\r\n"
					+ "                                예약해주셔서 감사합니다\r\n"
					+ "                            </h2>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td align=\"left\" style=\"padding-top: 20px;\">\r\n"
					+ "                            <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td width=\"75%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\r\n"
					+ "                                        예약자 아이디 \r\n"
					+ "                                    </td>\r\n"
					+ "                                    <td width=\"25%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\r\n"
					+											data.get("userId")
					+ "                                    </td>\r\n"
					+ "                                </tr>\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">\r\n"
					+ "                                        퀘스트\r\n"
					+ "                                    </td>\r\n"
					+ "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">\r\n"
					+ 											data.get("questName")
					+ "                                    </td>\r\n"
					+ "                                </tr>\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\r\n"
					+ "                                        지점\r\n"
					+ "                                    </td>\r\n"
					+ "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\r\n"
					+ 											data.get("branchLocation")
					+ "                                    </td>\r\n"
					+ "                                </tr>\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\r\n"
					+ "                                        선택시간\r\n"
					+ "                                    </td>\r\n"
					+ "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\r\n"
					+ 											data.get("selectTime")
					+ "                                    </td>\r\n"
					+ "                                </tr>\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\r\n"
					+ "                                        인원수\r\n"
					+ "                                    </td>\r\n"
					+ "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\">\r\n"
					+ 											data.get("teamMember")
					+ "                                    </td>\r\n"
					+ "                                </tr>\r\n"
					+ "                            </table>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td align=\"left\" style=\"padding-top: 20px;\">\r\n"
					+ "                            <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\r\n"
					+ "                                <tr>\r\n"
					+ "                                    <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">\r\n"
					+ "                                        결제금액\r\n"
					+ "                                    </td>\r\n"
					+ "                                    <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">\r\n"
					+ 											data.get("amount")
					+ "                                    </td>\r\n"
					+ "                                </tr>\r\n"
					+ "                            </table>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </table>\r\n"
					+ "                \r\n"
					+ "                </td>\r\n"
					+ "            </tr>\r\n"
					+ "             \r\n"
					+ "            \r\n"
					+ "            <tr>\r\n"
					+ "                <td align=\"center\" style=\"padding: 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\r\n"
					+ "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px; padding: 5px 0 10px 0;\">\r\n"
					+ "                            <p style=\"font-size: 14px; font-weight: 800; line-height: 18px; color: #333333;\">\r\n"
					+ "                                <br>\r\n"
					+ "                                <br>\r\n"
					+ "                            </p>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                    <tr>\r\n"
					+ "                        <td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;\">\r\n"
					+ "                            <p style=\"font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;\">\r\n"
					+ "                                예약확인 이메일을 차단하시려면 <a href=\"http://localhost:8080/mkroom/\" target=\"_blank\" style=\"color: #777777;\">구독해제</a>를 해주세요\r\n"
					+ "                            </p>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </table>\r\n"
					+ "                </td>\r\n"
					+ "            </tr>\r\n"
					+ "        </table>\r\n"
					+ "        </td>\r\n"
					+ "    </tr>\r\n"
					+ "</table>\r\n"
					+ "    \r\n"
					+ "</body>\r\n"
					+ "</html>\r\n"
					+ "");
			
			
			message.setContent(htmlBody.toString(), "text/html; charset=utf-8");
			Transport.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.headers(resHeaders)
					.body("메일전송이 실패하였습니다");	
		}
		
		
		return ResponseEntity.status(HttpStatus.OK)
				.headers(resHeaders)
				.body("메일이 전송되었습니다");
	}
}
