package org.audioshop.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MemberTests {

	// 비밀번호를 단방향으로 암호화 처리
	@Autowired
	private PasswordEncoder pwencoder;

	// 데이터베이스 연결
	@Autowired
	private DataSource ds;
  
	@Test
	public void testInsertMember() throws SQLException {

		String sql = "insert into member(mmId, username, password, name, email, grade, regDate)" 
				+ " values (mm_seq.nextval, ?, ?, ?, ?, ?, sysdate)";

		// 반복문을 사용하여 100명의 사용자를 등록처리
		for (int i = 1; i <= 100; i++) { 
			Connection con = null;
			PreparedStatement pstmt = null; 
			try { 
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);  
				pstmt.setString(2, pwencoder.encode("pw" + i)); 
				
				if (i <= 80) {
					pstmt.setString(1, "user" + i); 
					pstmt.setString(3, "일반사용자" + i);
					pstmt.setString(4, "user" + i + "@naver.com");
					pstmt.setInt(5, 1);
				} else if (i <= 90) {
					pstmt.setString(1, "manager" + i); 
					pstmt.setString(3, "운영자" + i);
					pstmt.setString(4, "manager" + i + "@naver.com");
					pstmt.setInt(5, 9);
				} else {
					pstmt.setString(1, "admin" + i); 
					pstmt.setString(3, "관리자" + i);
					pstmt.setString(4, "admin" + i + "@gmail.com");
					pstmt.setInt(5, 10);
				} 
				pstmt.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			}
		}
	} 
	
		@Ignore
		public void testInsertAuth() throws SQLException {
			
		String sql = "insert into member_auth(userId, auth) values (?,?)";
 
		for (int i = 1; i <= 100; i++) { 
			Connection con = null;
			PreparedStatement pstmt = null; 
			try { 
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql); 
				//user1 ~ user80 =>  ROLE_USER
				//manager81 ~ manager90 => ROLE_MANAGER
				//admin91 ~ admin100 => ROLE_ADMIN 
				if (i <= 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if (i <= 90) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MANAGER");
				} else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				} 
				pstmt.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			}
		}

	}
}
