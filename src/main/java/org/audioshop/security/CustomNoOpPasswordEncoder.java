package org.audioshop.security;

import org.springframework.security.crypto.password.PasswordEncoder;

//PasswordEncoder?
//비밀번호를 암호화 처리하는 인터페이스		
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

	//비밀번호를 단방향으로 암호화처리를 하는 메서드
	@Override
	public String encode(CharSequence rawPassword) {
		
		//암호화 처리된 비밀번호를 리턴
		return rawPassword.toString();
	}

	//암호화된 비밀번호와 원래 비밀번호가 동일한지 여부를 체크하는
	//메서드
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		//암호화 된 비밀번호와 원래 비밀번호가 동일하면 true
		//아니면 false 리턴
		return rawPassword.toString().equals(encodedPassword);
	}

	
}
