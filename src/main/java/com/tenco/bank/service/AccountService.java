package com.tenco.bank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.bank.dto.AccountSaveFormDto;
import com.tenco.bank.dto.DepositFormDto;
import com.tenco.bank.dto.TransferFormDto;
import com.tenco.bank.dto.WithdrawFormDto;
import com.tenco.bank.handler.exception.CustomRestfulException;
import com.tenco.bank.repository.entity.Account;
import com.tenco.bank.repository.entity.CustomHistoryEntity;
import com.tenco.bank.repository.entity.History;
import com.tenco.bank.repository.interfaces.AccountRepository;
import com.tenco.bank.repository.interfaces.HistoryRepository;
import com.tenco.bank.utils.Define;

@Service // IoC의 대상 + 싱글톤으로 관리됨!
public class AccountService {

	// SOLID 원칙 중 - OCP 원칙
	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private HistoryRepository historyRepository;

	// todo : 계좌 번호 중복 확인 예정
	@Transactional
	public void createAccount(AccountSaveFormDto dto, Integer principalId) {

		// 계좌번호 중복 확인
		if (readAccount(dto.getNumber()) != null) {
			throw new CustomRestfulException(Define.EXIST_ACCOUNT, HttpStatus.BAD_REQUEST);
		}

		Account account = new Account();
		account.setNumber(dto.getNumber());
		account.setPassword(dto.getPassword());
		account.setBalance(dto.getBalance());
		account.setUserId(principalId);

		int resultRowCount = accountRepository.insert(account);
		if (resultRowCount != 1) {
			throw new CustomRestfulException(Define.FAIL_TO_CREATE_ACCOUNT, HttpStatus.INTERNAL_SERVER_ERROR);

		}

	}

	// 단일 계좌 검색 기능
	public Account readAccount(String number) {

		return accountRepository.findByNumber(number.trim());
	}

	// 계좌 목록 보기 기능
	public List<Account> readAccountListByUserId(Integer principalId) {
		// select --> 0 이거나 aa, a, ... 예외처리 X
		return accountRepository.findAllByUserId(principalId);
	}
	
	// 총 자산 보기
	public Account findAllByAssets(Integer userId) {
        return accountRepository.findAllByAssets(userId);
    }

	// 출금 기능 만들기
	// 1. 계좌 존재 여부 확인 -- select
	// 2. 계좌가 존재 -> 본인 계좌여부 확인 -- 객체에서 확인 처리
	// 3. 계좌 비밀번호 확인
	// 4. 잔액 여부 확인
	// 5. 출금 처리 --> update
	// 6. 거래 내역 등록 -- insert(history)
	// 7. 트랜잭션 처리
	@Transactional
	public void updateAccountWithdraw(WithdrawFormDto dto, Integer principalId) {

		// 1. 계좌 존재 여부 확인
		Account accountEntity = accountRepository.findByNumber(dto.getWAccountNumber());
		if (accountEntity == null) {
			throw new CustomRestfulException(Define.NOT_EXIST_ACCOUNT, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 2. 본인 계좌여부 확인
		accountEntity.checkOwner(principalId);

		// 3. 계좌 비밀번호 확인
		// String -> equals로 비교
		accountEntity.checkPassword(dto.getWAccountPassword());

		// 4. 잔액 여부 확인
		accountEntity.checkBalance(dto.getAmount());

		// 5. 출금 처리 (Account) --> 현재 생성된 객체 상태값 변경
		accountEntity.withdraw(dto.getAmount());
		accountRepository.updateById(accountEntity);

		// 6. history에 거래내역 등록
		History history = new History();
		history.setAmount(dto.getAmount());
		history.setWBalance(accountEntity.getBalance()); // 출금 계좌의 잔액을 가져와야하기 때문에
		history.setDBalance(null);
		history.setWAccountId(accountEntity.getId());
		history.setDAccountId(null);

		int rowResultCount = historyRepository.insert(history);
		if (rowResultCount != 1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 입금 기능 만들기
	// 1. 계좌 존재여부 확인
	// 2. 계좌 존재? -> 본인 계좌 여부 확인
	// 3. 입금 처리
	// 4. 거래 내역 등록
	// 5. 트랜잭션 처리
	@Transactional
	public void updateAccountDeposit(DepositFormDto dto, Integer principalId) {
		// 1. 계좌 존재 여부 확인

		Account accountEntity = accountRepository.findByNumber(dto.getDAccountNumber());
		if (accountEntity == null) {
			throw new CustomRestfulException(Define.NOT_EXIST_ACCOUNT, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 2. 본인 계좌 여부 확인

		accountEntity.checkOwner(principalId);

		// 3. 입금처리
		accountEntity.deposit(dto.getAmount());
		accountRepository.updateById(accountEntity);

		// 6. history에 거래내역 등록
		History history = new History();
		history.setAmount(dto.getAmount());
		history.setWBalance(null); 
		history.setDBalance(accountEntity.getBalance());
		history.setWAccountId(null);
		history.setDAccountId(accountEntity.getId());

		int rowResultCount = historyRepository.insert(history);
		if (rowResultCount != 1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 이체 기능 만들기
	//	1. 출금 계좌 존재여부 - select
	//	2. 입금 계좌 존재여부 - select
	//	3. 출금 계좌 본인 소유 확인
	//	4. 본인소유가 맞다면 → 출금 계좌 비번 확인
	//	5. 출금 계좌 잔액 확인 - O
	//	6. 출금 계좌 잔액 수정 - U
	//	7. 입금 계좌 잔액 수정 - U
	//	8. 거래 내역 등록 처리 (이체 내역 쿼리 테스트) - I
	//	9. 트랜잭션 처리
	@Transactional
	public void updateAccountTransfer(TransferFormDto dto, Integer principalId) {
		
		// 1. 출금 계좌 존재여부
		Account WithdrawAccountEntity = accountRepository.findByNumber(dto.getWAccountNumber());
		if (WithdrawAccountEntity == null) {
			throw new CustomRestfulException(Define.NOT_EXIST_ACCOUNT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 2. 입금 계좌 존재여부
		Account DepositAccountEntity = accountRepository.findByNumber(dto.getDAccountNumber());
		if (DepositAccountEntity == null) {
			throw new CustomRestfulException(Define.NOT_EXIST_ACCOUNT, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 3. 출금 계좌 본인 소유 확인
		WithdrawAccountEntity.checkOwner(principalId);
		
		// 4. 출금 계좌 비번 확인
		WithdrawAccountEntity.checkPassword(dto.getPassword());
		
		// 5. 출금 계좌 잔액 확인
		WithdrawAccountEntity.checkBalance(dto.getAmount());
		
		// 6. 출금 계좌 잔액 수정
		WithdrawAccountEntity.withdraw(dto.getAmount());
		int resultRowCountWithdraw = accountRepository.updateById(WithdrawAccountEntity);
		
		// 7. 입금 계좌 잔액 수정
		DepositAccountEntity.deposit(dto.getAmount());
		int resultRowCountDeposit = accountRepository.updateById(DepositAccountEntity);
		
		if(resultRowCountWithdraw != 1 && resultRowCountDeposit != 1) {
			throw new CustomRestfulException("정상 처리되지 않았습니다." , HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 8. 거래 내역 등록 처리
		History history = new History();
		history.setAmount(dto.getAmount());
		history.setWBalance(WithdrawAccountEntity.getBalance());
		history.setDBalance(DepositAccountEntity.getBalance());
		history.setWAccountId(WithdrawAccountEntity.getId());
		history.setDAccountId(DepositAccountEntity.getId());

		int rowResultCount = historyRepository.insert(history);
		if (rowResultCount != 1) {
			throw new CustomRestfulException("정상 처리 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	/**
	 * 단일 계좌 거래 내역 검색(전체, 입금, 출금)
	 * @param type = [all, deposit, withdraw]
	 * @param id (account_id)
	 * @return 동적 쿼리 - list
	 */
	public List<CustomHistoryEntity> readHistoryListByAccount(String type, Integer id) {
		
		
		return historyRepository.findByIdHistoryType(type, id);
		
	}
	
	// 단일 계좌 조회 - AccountById
	public Account readByAccountId(Integer id) {
		return accountRepository.findByAccountId(id);
	}

}
