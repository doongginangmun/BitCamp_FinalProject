package com.project.shop.member;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.shop.member.impl.MemberDAO;

import lombok.AllArgsConstructor;

@Service("mailService")
@AllArgsConstructor
public class SendEmailService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private JavaMailSender mailSender;

	private static final String FROM_ADDRESS = "leeyoung778811@gmail.com";
	// 위에 본인의 이메일 주소 입력!! 이렇게 설정 안 해주면 디폴트 값이 mail-context.xml에 작성한 username이 들어감

	public MailDto createMailAndChangePassword(String member_id, String email) {
		String str = getTempPassword();
		MailDto dto = new MailDto();
		dto.setAddress(email);
		dto.setTitle("[쩝쩝박사] 임시 비밀번호 안내 이메일 입니다.");
		
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
 		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
 		sb.append("<a href='https://ifh.cc/v-nQFY3g' target='_blank'><img src='https://ifh.cc/g/nQFY3g.png' border='0'></a>");
 		sb.append("<h3 style=\"text-align: center;\">"+""+"<h3><br>");
 		sb.append("</body></html>");
 		
		dto.setMessage(sb +
				"안녕하세요. [쩝쩝박사] 임시 비밀번호 안내 관련 이메일입니다.<br>" + 
		"아이디가  " + member_id + " 인 회원님의 임시 비밀번호는 " + str + "입니다.");
		

		//DB이메일 비밀번호 수정
		updatePassword(str, member_id);
		return dto;
	}

	public void mailSend(MailDto mailDto) {
		System.out.println("이메일 전송 완료!");
		 MimeMessage message = mailSender.createMimeMessage();
	      try {
			MimeMessageHelper messageHelper = 
			new MimeMessageHelper(message, true, "UTF-8");
			//messageHelper.setCc("zzzzzz@naver.com"); //메일을 참조할 수 있는 참조자 메일 입력
			messageHelper.setFrom(SendEmailService.FROM_ADDRESS,"쩝쩝박사"); //메일 보내는 사람의 주소 
			messageHelper.setTo(mailDto.getAddress()); 
			messageHelper.setSubject(mailDto.getTitle());
			messageHelper.setText(mailDto.getMessage(),true);
			mailSender.send(message);  
	      }catch(Exception e){
			e.printStackTrace();
		  }
	}
	
	
	// 비밀번호 수정
	 public void updatePassword(String str,String id){
		 	System.out.println("이 비밀번호 수정 메세지가 확인이 안 되는 건가요??ㅠㅠ");
	        String password = str;
	        String member_id = memberDAO.findEmailInfo(id).getMember_id();
	        HashMap<String,String> map = new HashMap<String, String>();
	        map.put("password",password);
	        map.put("member_id",member_id);	   
	        System.out.println("비밀번호 가 왜 mapper에 안 들어가는 거냐고!!=====패스워드====== "+ map.get("password"));
			System.out.println("비밀번호가 왜 mapper에  안 들어가는 거냑ㅎ!!=====아이디====== "+ map.get("member_id"));
	        memberDAO.updateUserPassword(map);
	 }

	// 10자리의 랜덤난수를 생성하는 메소드
	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}
	
	public MailDto sendEmailAdvertise(String email) {
		MailDto dto = new MailDto();
		dto.setAddress(email);
		dto.setTitle("[쩝쩝박사] 할인 정보 안내 이메일 입니다.");
		
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
 		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
 		sb.append("<a href='https://ifh.cc/v-nQFY3g' target='_blank'><img src='https://ifh.cc/g/nQFY3g.png' border='0'></a>");
 		sb.append("<h3 style=\"text-align: center;\">"+""+"<h3><br>");
 		sb.append("</body></html>");
 		
		dto.setMessage(sb +
				"안녕하세요. [쩝쩝박사] 할인 정보 안내 관련 이메일입니다.<br>" + 
		 "감사합니다.");
		
		return dto;
	}
	
}
