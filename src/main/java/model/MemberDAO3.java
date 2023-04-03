package model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class MemberDAO3 {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// DB접근할 수 있도록 도와주는 메소드 생성
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 한사람 저장 메소드
	public void insertMember(MemberBean bean) {

		getCon();

		try {
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getHobby());
			pstmt.setString(6, bean.getJob());
			pstmt.setString(7, bean.getAge());
			pstmt.setString(8, bean.getInfo());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 모든 회원 정보 리턴하는 메소드 작성
	public List<MemberBean> getAllMember() {
		List<MemberBean> list = new ArrayList<>();

		getCon();

		try {
			String sql = "SELECT * FROM MEMBER";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
