package model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class BoardDAO2 {
	// 커넥션 설정
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 데이터 베이스의 커넥션풀을 사용하도록 설정하는 메소드
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
	
	//전체 게시글 가져오는 메소드
	public int getAllCount() {
		getCon();
		int count = 0;
		try {
			String sql = "SELECT COUNT(NUM) COUNT FROM BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	// 모든 화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드
	public List<BoardBean> getAllBoard(int start, int end) {
		// 리턴할 객체 선언
		List<BoardBean> list = Collections.synchronizedList(new ArrayList<>());

		getCon();

		try {
			String sql = "SELECT * FROM BOARD ORDER BY REF DESC, RE_STEP ASC limit ?, ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
