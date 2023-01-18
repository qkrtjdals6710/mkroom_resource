package mkroom;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.member.MemberAuthority;
import com.beatphobia.mkroom.service.member.MemberService;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class InsertMember {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder encoder;
	
//	@Test
	public void insertMember() {
		
		for (int i = 1; i <= 1000; i++) {
			Member member = new Member();
			member.setUserId("user" + i);
			member.setUserPw("pw" + i);
			member.setUserName("홍길동");
			member.setEmail("test" + i + "@test.com");
			member.setPhoneNumber("01022223333");
			List<MemberAuthority> authorities = new ArrayList<MemberAuthority>();
			authorities.add(new MemberAuthority(member.getUserId(), "ROLE_MEMBER"));
			member.setAuthorityList(authorities);
			member.setUserPw(encoder.encode(member.getUserPw()));
			memberService.insertMember(member);
		}
	}
	
	@Test
	public void insertManager() {
		
		Member member = new Member();
		member.setUserId("구로점관리자");
		member.setUserPw("pw");
		member.setUserName("구로점관리자");
		member.setEmail("guro" +"@test.com");
		member.setPhoneNumber("01022223333");
		member.setBranchLocation("구로점");
		List<MemberAuthority> authorities = new ArrayList<MemberAuthority>();
		authorities.add(new MemberAuthority(member.getUserId(), "ROLE_MEMBER"));
		authorities.add(new MemberAuthority(member.getUserId(), "ROLE_BMANAGER"));
		member.setAuthorityList(authorities);
		member.setUserPw(encoder.encode(member.getUserPw()));
		memberService.insertMember(member);
		
		Member member2 = new Member();
		member2.setUserId("신촌점관리자");
		member2.setUserPw("pw");
		member2.setUserName("신촌점관리자");
		member2.setEmail("sinchon" +"@test.com");
		member2.setPhoneNumber("01022223333");
		member2.setBranchLocation("신촌점");
		List<MemberAuthority> authorities2 = new ArrayList<MemberAuthority>();
		authorities2.add(new MemberAuthority(member2.getUserId(), "ROLE_MEMBER"));
		authorities2.add(new MemberAuthority(member2.getUserId(), "ROLE_BMANAGER"));
		member2.setAuthorityList(authorities2);
		member2.setUserPw(encoder.encode(member2.getUserPw()));
		memberService.insertMember(member2);
		
		Member member3 = new Member();
		member3.setUserId("신도림점관리자");
		member3.setUserPw("pw");
		member3.setUserName("신도림점관리자");
		member3.setEmail("sindorim" +"@test.com");
		member3.setPhoneNumber("01022223333");
		member3.setBranchLocation("신도림점");
		List<MemberAuthority> authorities3 = new ArrayList<MemberAuthority>();
		authorities3.add(new MemberAuthority(member3.getUserId(), "ROLE_MEMBER"));
		authorities3.add(new MemberAuthority(member3.getUserId(), "ROLE_BMANAGER"));
		member3.setAuthorityList(authorities3);
		member3.setUserPw(encoder.encode(member3.getUserPw()));
		memberService.insertMember(member3);
	}
}
