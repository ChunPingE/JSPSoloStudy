package model;

import java.sql.*;
import java.util.*;

//데이터 베이스에 연결하고 SELECT INSERT UPDATE DELETE작업을 해주는 클래스
public class MemberDAO2 {

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

			pstmt = con.prepareStatement(sql);

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
		// 가변길이로 저장
		Vector<MemberBean> v = new Vector<>();

		// 무조건 데이터 베이스는 예외처리 해줘야한다.

		try {
			// 커넥션 연결
			getCon();

			// 쿼리 준비
			String sql = "SELECT * FROM MEMBER";
			// 쿼리실행
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행 시킨 결과를 리턴해서 받아줌(테이블에 검색된 것을 자바 객체에 저장)
			rs = pstmt.executeQuery();
			// 반복문을 사용해서 rs에 저장한 데이터를 추출해야한다.
			while (rs.next()) {
				MemberBean mBean = new MemberBean(); // 컬럼으로 나뉘어진 데이터를 빈 클래스에 저장
				mBean.setId(rs.getString(1));
				mBean.setPass1(rs.getString(2));
				mBean.setEmail(rs.getString(3));
				mBean.setTel(rs.getString(4));
				mBean.setHobby(rs.getString(5));
				mBean.setJob(rs.getString(6));
				mBean.setAge(rs.getString(7));
				mBean.setInfo(rs.getString(8));
				// 패키징된 MemberBean을 벡터에 저장
				v.add(mBean); // 0번지부터 데이터를 순서대로 저장
			}
			// 자원반납
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// 한사람 정보 뱉어내기
	public MemberBean oneSelectMember(String id) {
		// 한사람만 정보리턴하기에 빈클래스 객체 생성
		MemberBean bean = new MemberBean();

		try {
			// 커넥션연결
			getCon();
			// 쿼리준비
			String sql = "SELECT * FROM MEMBER WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			// ?값에 매핑
			pstmt.setString(1, id);
			// 쿼리실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}

			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 한회원의 비밀번호
	public String getPass(String id) {
		String pass = "";
		try {
			getCon();
			String sql = "SELECT PASS1 FROM MEMBER WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1);
			}
			rs.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pass;
	}
	
	public void updateMember(MemberBean mBean) {
		getCon();
		
		try {
			String sql = "UPDATE MEMBER SET EMAIL=?, TEL=? WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getEmail());
			pstmt.setString(2, mBean.getTel());
			pstmt.setString(3, mBean.getId());
			pstmt.executeUpdate();
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//한회원을 삭제하는 메소드
	public void deleteMember(String id) {
		try {
			getCon();
			String sql = "DELETE FROM MEMBER WHERE id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
