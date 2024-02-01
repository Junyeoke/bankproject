package com.tenco.bank.repository.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;

import com.tenco.bank.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomHistoryEntity {
	
	private Integer id;
	private Long amount;
	private Long balance;
	private String sender;
	private String receiver;
	private Timestamp createdAt;
	
	
	// 날짜 포맷팅
	public String formatCreatedAt() {
		
		return TimeUtils.timestampToString(createdAt);
	}
	
	// 금액 포맷팅
	public String formatBalance() {
		DecimalFormat df = new DecimalFormat("#,###");
		String formatNumber = df.format(balance);
		return formatNumber + "원";
	}
	
	
	// 금액 포맷팅
	public String formatAmount() {
		DecimalFormat df = new DecimalFormat("#,###");
		String formatNumber = df.format(amount);
		return formatNumber + "원";
	}
	
}
