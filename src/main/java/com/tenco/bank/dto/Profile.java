
package com.tenco.bank.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Profile {

	private String nickname;
	private String thumbnailImageUrl;
	private String profileImageUrl;
	private Boolean isDefaultImage;

}
