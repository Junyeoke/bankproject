package com.tenco.bank.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.bank.dto.FindUserInfoDto;
import com.tenco.bank.dto.MailDto;
import com.tenco.bank.dto.SendMailDto;
import com.tenco.bank.dto.SignInFormDto;
import com.tenco.bank.dto.SignUpFormDto;
import com.tenco.bank.handler.exception.CustomRestfulException;
import com.tenco.bank.handler.exception.UnAuthorizedException;
import com.tenco.bank.repository.entity.User;
import com.tenco.bank.repository.interfaces.UserRepository;
import com.tenco.bank.utils.Define;


@Service // IoC 대상
public class UserService {
	
	// DB 접근
	// 생성자 의존 주입 DI
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	/**
	 * 회원 가입 로직 처리 
	 * @param SignUpFormDto
	 * return void
	 */
	@Transactional 
	public void createUser(SignUpFormDto dto) {
		
		// 추가 개념 : 암호화 처리
		
		
		User user = User.builder()
				.username(dto.getUsername())
				.password(passwordEncoder.encode(dto.getPassword()))
				.fullname(dto.getFullname())
				.email(dto.getEmail())
				.originFileName(dto.getOriginFileName())
				.uploadFileName(dto.getUploadFileName())
				.build();
		
		int result = userRepository.insert(user);
		if(result != 1) {
			throw new CustomRestfulException(Define.FAIL_TO_CREATE_ACCOUNT, 
									HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/**
	 * 로그인 처리
	 * @param SignInFormDto
	 * @return User
	 */
	public User readUser(SignInFormDto dto) {
		
		// 사용자의 username만 받아서 정보를 추출
		User userEntity = userRepository.findByUsername(dto.getUsername());
		
		if(userEntity == null) {
			throw new CustomRestfulException("존재하지 않는 계정입니다.", 
					HttpStatus.BAD_REQUEST);
		}
		
		// 
		
		boolean isPwdMatched = passwordEncoder.matches(dto.getPassword(), 
										userEntity.getPassword());
		
		
		if(isPwdMatched == false) {
			throw new CustomRestfulException("비밀번호가 잘못 되었습니다.", 
					HttpStatus.BAD_REQUEST);
		}
		
		return userEntity;
	}
	
	
	// 이름으로 이메일 조회
	public String nameToEmail(FindUserInfoDto findUserInfoDTO){
		return this.userRepository.findByNameToEmail(findUserInfoDTO.getUsername());
	}
	
	// 회원 이름, 전화번호를 이용해서 이메일 찾기
		public String userEmail(@RequestParam String username){

			String userEmail = this.userRepository.findByMail(username);

			if (userEmail == null){
				throw new CustomRestfulException("이메일이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
			}

			return userEmail;
		}
	

	//랜덤함수로 임시비밀번호 만들기
	public String tempPassword(){
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
				'W', 'X', 'Y', 'Z' };
		String password = "";
		// 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		int j = 0;
		for (int i = 0; i < 10; i++) {
			j = (int) (charSet.length * Math.random());
			password += charSet[j];
		}
		return password;
	}
	
	// 회원 이메일 이용해서 username 찾기
		public String userName(@RequestParam String email){

			String userName = this.userRepository.findByMail(email);

			if (userName == null){
				throw new CustomRestfulException("이메일이 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
			}

			return userName;
		}
		
		
		
		// 이메일 보내기 (이메일 작성 후 ~ 임시 비밀번호로 회원 비밀번호 업데이트)
		public MailDto sendEmail(SendMailDto sendEmailDto){
			String pw = tempPassword(); // 임시 비밀번호 생성
			MailDto maildto = new MailDto();
			maildto.setAddress(sendEmailDto.getEmail());
			maildto.setTitle("[ indiefliker ] 임시비밀번호 안내 이메일 입니다.");
			maildto.setMessage("안녕하세요. indiefliker 임시비밀번호 안내 관련 이메일 입니다." +
					           " 회원님의 임시 비밀번호는 " + pw + " 입니다." +
					           " 로그인 후에 비밀번호를 변경을 해주세요!");

			this.userRepository.tempPasswordUpdate(pw, sendEmailDto.getEmail());

			return maildto;
		}

		// 실제 이메일 보내기
		public void mailSend(MailDto mailDto) {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(mailDto.getAddress());
			message.setSubject(mailDto.getTitle());
			message.setText(mailDto.getMessage());
			message.setFrom("indiefliker@gmail.com");
			message.setReplyTo("indiefliker@gmail.com");
			javaMailSender.send(message);
		}

		// 입력한 이메일로 DB에 저장된 이메일 찾기
		public String emailSearch(String userEmail){
			String email = this.userRepository.findByMail(userEmail);
			return email;
		}

	
}
