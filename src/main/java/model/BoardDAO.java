package model;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class BoardDAO {
	//커넥션 설정
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//데이터 베이스의 커넥션풀을 사용하도록 설정하는 메소드
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			//datasource에서 값가져오기
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
