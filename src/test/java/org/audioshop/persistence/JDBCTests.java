package org.audioshop.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			//오라클 jdbc 드라이버에 메모리에 업로드.
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:fintech";	//sid 
		String userId = "audio";		//사용자 이름
		String userPw = "audio1234";		//비밀번호
		
		//데이터베이스 연결
		try(Connection con = DriverManager.getConnection(url,userId,userPw)) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
