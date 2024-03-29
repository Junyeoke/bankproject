package com.tenco.bank.controller;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.time.zone.ZoneOffsetTransitionRule.TimeDefinition;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tenco.bank.dto.KakaoProfile;
import com.tenco.bank.dto.NaverProfile;
import com.tenco.bank.dto.OAuthToken;
import com.tenco.bank.dto.Profile;
import com.tenco.bank.dto.SignInFormDto;
import com.tenco.bank.dto.SignUpFormDto;
import com.tenco.bank.handler.exception.CustomRestfulException;
import com.tenco.bank.repository.entity.User;
import com.tenco.bank.service.UserService;
import com.tenco.bank.utils.Define;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired // DI 처리
	private UserService userService;

	@Autowired
	private HttpSession httpSession;

	/**
	 * 회원가입 페이지 요청
	 * 
	 * @return signUp.jsp 파일 리턴
	 */
	@GetMapping("/sign-up")
	public String signUpPage() {
		// prefix: /WEB-INF/view/
		// suffix: .jsp
		return "user/signUp";
	}

	/**
	 * 회원 가입 요청
	 * 
	 * @param dto
	 * @return 로그인 페이지(/sign-in)
	 */
	@PostMapping("/sign-up")
	public String signProc(SignUpFormDto dto) {

		System.out.println("dto : " + dto.toString());
		System.out.println(dto.getCustomFile().getOriginalFilename());
		// 1. 인증검사 x
		// 2. 유효성 검사
		if (dto.getUsername() == null || dto.getUsername().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_USERNAME, HttpStatus.BAD_REQUEST);
		}

		if (dto.getPassword() == null || dto.getPassword().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_PASSWORD, HttpStatus.BAD_REQUEST);
		}
		if (dto.getFullname() == null || dto.getFullname().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_FULLNAME, HttpStatus.BAD_REQUEST);
		}

		// 파일업로드 처리
		MultipartFile file = dto.getCustomFile();
		if (file.isEmpty() == false) {
			// 사용자가 이미지를 넣었다면 기능 구현
			// 파일 사이즈 체크
			// 20MB
			if (file.getSize() > Define.MAX_FILE_SIZE) {
				throw new CustomRestfulException("파일 크기는 20MB 이상 클 수 없습니다.", HttpStatus.BAD_REQUEST);
			}

			// 서버 컴퓨터에 파일을 넣을 디렉토리가 있는지 검사
			String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
			// 폴더가 없다면 오류 발생(파일생성시)
			File dir = new File(saveDirectory);
			if (dir.exists() == false) {
				dir.mkdir(); // 폴더가 없으면 폴더 생성
			}

			// 파일 이름 (중복처리 예방)
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();
			System.out.println("fileName : " + fileName);

			String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName;
			File destination = new File(uploadPath);

			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			// 객체 상태 변경(insert 처리)
			dto.setOriginFileName(file.getOriginalFilename()); // 사용자가 입력한 파일명
			dto.setUploadFileName(fileName);
		}

		userService.createUser(dto);
		return "redirect:/user/sign-in";
	}

	/**
	 * 로그인 페이지 요청
	 * 
	 * @return
	 */
	@GetMapping("/sign-in")
	public String signInPage() {
		return "user/signIn";
	}

	/**
	 * 로그인 요청 처리
	 * 
	 * @param SignInFormDto
	 * @return account/list.jsp
	 */
	@PostMapping("/sign-in")
	public String signInProc(SignInFormDto dto) {

		// 1. 유효성 검사
		if (dto.getUsername() == null || dto.getUsername().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_USERNAME, HttpStatus.BAD_REQUEST);
		}

		if (dto.getPassword() == null || dto.getPassword().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_PASSWORD, HttpStatus.BAD_REQUEST);
		}

		// 서비스 호출 예정
		User user = userService.readUser(dto);

		// 세션에 사용자 정보 저장: 로그인이 성공하면, httpSession 객체를 사용하여 세션에 사용자 정보를 저장합니다.
		// 여기서 "principal"이라는 이름으로 사용자 객체(user)를 저장함.
		httpSession.setAttribute(Define.PRINCIPAL, user);

		return "redirect:/account/list";
	}

	// 로그아웃 기능 만들기
	@GetMapping("/logout")
	public String logout() {
		httpSession.invalidate();
		return "redirect:/user/sign-in";
	}

	// 카카오 로그인
	// http://localhost:80/user/kakao-callback?code="xxxxxxxx"
	@GetMapping("/kakao-callback")
	public String kakaoCallback(@RequestParam String code) {
		// POST 방식, Header 구성, body 구성
		RestTemplate rt1 = new RestTemplate();
		// 헤더 구성
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// 바디 구성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "2c617de944e126184f4c77cab2d22c93");
		params.add("redirect_uri", "http://localhost/user/kakao-callback");
		params.add("code", code);

		// 헤더 + 바디 결합
		HttpEntity<MultiValueMap<String, String>> reqMsg = new HttpEntity<>(params, headers1);

		ResponseEntity<OAuthToken> response = rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				reqMsg, OAuthToken.class);

		// 다시 요청 -- 인증 토큰 -- 사용자 정보 요청
		RestTemplate rt2 = new RestTemplate();

		// 헤더
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 결합 --> 요청
		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);

		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoInfo, KakaoProfile.class);
		;

		System.out.println(response.getBody().getAccessToken());
		System.out.println(response2.getBody());

		KakaoProfile kakaoProfile = response2.getBody();

		// 최초 사용자 판단 여부 -- 사용자 이름(username)존재 여부 확인하기
		// 우리 사이트 --> 카카오
		SignUpFormDto dto = SignUpFormDto.builder().username("OAuth_" + kakaoProfile.getProperties().getNickname())
				.fullname("Kakao").password("asd1234") // 소셜 로그인 사용자는 패스워드를 받지 않음
				.build();

		User oldUser = userService.readUserByUserName(dto.getUsername());
		// null <--
		if (oldUser == null) {
			userService.createUser(dto);
			oldUser = new User();
			oldUser.setUsername(dto.getUsername());
			oldUser.setFullname(dto.getFullname());

		}
		oldUser.setPassword(null);

		// 사용자 이름이 있다면 - 로그인 처리
		httpSession.setAttribute(Define.PRINCIPAL, oldUser);

		// 단 최초 요청 사용자라면? => 회원가입 후 로그인 처리!

		return "redirect:/account/list";

	}

	// 네이버
	@GetMapping("/naver-callback")
	//@ResponseBody
	public String naverLogin(@RequestParam String code, @RequestParam String state) {

		RestTemplate rt = new RestTemplate();

		URI uri = UriComponentsBuilder.fromUriString("https://nid.naver.com").path("/oauth2.0/token")
				.queryParam("grant_type", "authorization_code").queryParam("client_id", "hVlPdCIutDDpu0e0tAA1")
				.queryParam("client_secret", "yIdO76MPi9").queryParam("code", code).queryParam("state", state).encode()
				.build().toUri();

		ResponseEntity<NaverProfile> response = rt.getForEntity(uri, NaverProfile.class);
		log.info(response.getBody().toString());
		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		
		String token = "AAAAO0tm52jusoNAYGpoNEeYNG2qDcOFaxVV1C7hTmIZS8_WewcIREaHuHUSlb2KMEZHONUSbi1SKOC5lW4A39X68U4";
		headers2.add("Authorization", "Bearer " + token);

		HttpEntity<MultiValueMap<String, String>> naverInfo = new HttpEntity<>(headers2);

		ResponseEntity<NaverProfile> response2 = rt2.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.POST,
				naverInfo, NaverProfile.class);

		NaverProfile naverProfile = response2.getBody();
		
		System.out.println(naverProfile.getResponse().getName());

		// 최초 사용자 판단 여부 -- 사용자 이름(username)존재 여부 확인하기
		// 우리 사이트 --> 네이버
		SignUpFormDto dto = SignUpFormDto.builder().username("Naver_" + naverProfile.getResponse().getName())
				.fullname("Naver").password("asd1234") // 소셜 로그인 사용자는 패스워드를 받지 않음
				.build();

		User oldUser = userService.readUserByUserName(dto.getUsername());
		// null <--
		if (oldUser == null) {
			userService.createUser(dto);
			oldUser = new User();
			oldUser.setUsername(dto.getUsername());
			oldUser.setFullname(dto.getFullname());

		}
		oldUser.setPassword(null);

		// 사용자 이름이 있다면 - 로그인 처리
		httpSession.setAttribute(Define.PRINCIPAL, oldUser);

		// 단 최초 요청 사용자라면? => 회원가입 후 로그인 처리!

		return "redirect:/account/list";
	}

}
