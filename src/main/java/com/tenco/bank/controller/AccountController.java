package com.tenco.bank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.bank.dto.AccountSaveFormDto;
import com.tenco.bank.dto.WithdrawFormDto;
import com.tenco.bank.handler.exception.CustomRestfulException;
import com.tenco.bank.handler.exception.UnAuthorizedException;
import com.tenco.bank.repository.entity.Account;
import com.tenco.bank.repository.entity.User;
import com.tenco.bank.service.AccountService;
import com.tenco.bank.utils.Define;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired // 가독성
	private HttpSession session; // final 키워드를 사용하면 메모리 성능효율이 좋음

	@Autowired
	private AccountService accountService;

	// 페이지 요청기능
	// http://localhost:80/account/save
	/**
	 * 계좌 생성 페이지 요청
	 * 
	 * @return saveForm.jsp
	 */
	@GetMapping("/save")
	public String savePage() {
		// 인증검사
		User principal = (User) session.getAttribute(Define.PRINCIPAL); // 다운 캐스팅
		if (principal == null) {
			throw new UnAuthorizedException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}

		return "account/saveForm";
	}

	/**
	 * 계좌 생성 처리 로직
	 * 
	 * @param dto
	 * @return list.jsp
	 */
	@PostMapping("/save") // body --> String --> 파싱(DTO)
	public String saveProc(AccountSaveFormDto dto) {

		// 1. 인증 검사
		User principal = (User) session.getAttribute(Define.PRINCIPAL); // 다운 캐스팅
		if (principal == null) {
			throw new UnAuthorizedException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}
		// 2. 유효성 검사
		if (dto.getNumber() == null || dto.getNumber().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_ACCOUNT_NUMBER, HttpStatus.BAD_REQUEST);
		}
		if (dto.getPassword() == null || dto.getPassword().isEmpty()) {
			throw new CustomRestfulException(Define.ENTER_YOUR_PASSWORD, HttpStatus.BAD_REQUEST);
		}
		if (dto.getBalance() == null || dto.getBalance() < 0) {
			throw new CustomRestfulException(Define.ENTER_YOUR_BALANCE, HttpStatus.BAD_REQUEST);
		}
		// 3. 서비스 호출
		accountService.createAccount(dto, principal.getId());

		// todo 수정예정
		return "redirect:/account/list";
	}

	/**
	 * 계좌 목록 페이지
	 * 
	 * @param model - accountList
	 * @return list.jsp
	 */
	@GetMapping({ "/list", "/" })
	public String listPage(Model model) {
		// 1. 인증 검사
		User principal = (User) session.getAttribute(Define.PRINCIPAL); // 다운 캐스팅
		if (principal == null) {
			throw new UnAuthorizedException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}

		// 경우의 수 유, 무
		List<Account> accountList = accountService.readAccountListByUserId(principal.getId());

		if (accountList.isEmpty()) {
			model.addAttribute("accountList", null);
		} else {
			model.addAttribute("accountList", accountList);
		}
		return "account/list";
	}

	// 출금페이지 요청
	@GetMapping("/withdraw")
	public String withdrawPage() {
		// 1. 인증 검사
		User principal = (User) session.getAttribute(Define.PRINCIPAL); // 다운 캐스팅
		if (principal == null) {
			throw new UnAuthorizedException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}

		return "account/withdraw";
	}

	// 출금 요청 로직 만들기
	@PostMapping("/withdraw")
	public String withdrawProc(WithdrawFormDto dto) {
		// 1. 인증 검사
		User principal = (User) session.getAttribute(Define.PRINCIPAL); // 다운 캐스팅
		if (principal == null) {
			throw new UnAuthorizedException(Define.ENTER_YOUR_LOGIN, HttpStatus.UNAUTHORIZED);
		}
		// 2. 유효성 검사
		if (dto.getAmount() == null) {
			throw new CustomRestfulException("금액을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		// <=0
		if (dto.getAmount().longValue() <= 0) {
			throw new CustomRestfulException("출금 금액이 0원 이하일 수 없습니다.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getWAccountNumber() == null || dto.getWAccountNumber().isEmpty()) {
			throw new CustomRestfulException("계좌번호를 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		if (dto.getWAccountPassword() == null || dto.getWAccountPassword().isEmpty()) {
			throw new CustomRestfulException("비밀번호를 입력하세요.", HttpStatus.BAD_REQUEST);
		}
		
		// 서비스 호출
		accountService.updateAccountWithdraw(dto, principal.getId());
		
		return "redirect:/account/list";
	}

}
