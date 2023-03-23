package model;

import java.sql.*;
import java.util.*;

//데이터 베이스에 연결하고 SELECT INSERT UPDATE DELETE작업을 해주는 클래스
public class MemberDAO {

	// 오라클에 접속하는 소스
	String dbID = "chun"; // 접속아이디 비밀번호
	String dbPwd = "1234";
	String dbURL = "jdbc:mysql://localhost:3306/jspshop"; // 접속url

	Connection con; // DB에 연결하는 객체
	PreparedStatement pstmt; // 데이터베이스에서 쿼리 실행시켜주는 객체
	ResultSet rs; // 데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체

	// DB접근할 수 있도록 도와주는 메소드 생성
	public void getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 데이터 베이스에 한사람의 회원정보를 저장해주는 메소드
	public void insertMember(MemberBean mbean) {
		getCon();

		try {
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 모든 정보의 정보를 리턴해주는 메소드
	public Vector<MemberBean> allSelcetMember() {
		Vector<MemberBean> v = new Vector<>();
		return v;
	}
}
