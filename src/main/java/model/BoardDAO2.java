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

	// 전체 게시글 가져오는 메소드
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

	// 하나의 게시글을 저장하는 메소드 호출
	public void insertBoard(BoardBean bean) {
		getCon();

		int ref = 0;
		// 새글이기에 = 부모글이기에
		int re_step = 1;
		int re_level = 1;

		try {
			String refsql = "SELECT MAX(REF) FROM BOARD";
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			// 쿼리 실행후 결과를 리턴
			if (rs.next()) {
				ref = rs.getInt(1) + 1; // 가장큰값에 1더하기
			}

			String sql = "INSERT INTO BOARD(WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, RE_STEP, RE_LEVEL, READCOUNT, CONTENT)"
					+ " VALUES(?, ?, ?, ?, NOW(), ?, ?, ?, 0, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//하나의 게시글을 읽어오는 메소드
	public BoardBean getOneBoard(int num) {
		getCon();
		BoardBean bean = null;
		try {
			String countsql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?";
			pstmt = con.prepareStatement(countsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "SELECT * FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new BoardBean();
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
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//답변글을 저장하는 메소드
	public void reInsertBoard(BoardBean bean) {
		getCon();

		int ref = bean.getRef();
		// 새글이기에 = 부모글이기에
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		try {
			//핵심코드 restep +1 relevel부모보다 높으면 +1
			String levelsql = "UPDATE BOARD SET RE_LEVEL = RE_LEVEL + 1 WHERE REF=? AND RE_LEVEL > ? "; 
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			
			pstmt.executeUpdate();
			
			String sql = "INSERT INTO BOARD(WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, RE_STEP, RE_LEVEL, READCOUNT, CONTENT)"
					+ " VALUES(?, ?, ?, ?, NOW(), ?, ?, ?, 0, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1); //기본부모글의 스탭보다 +1
			pstmt.setInt(7, re_level + 1); //기존 부모글의 레벨보다 +1
			pstmt.setString(8, bean.getContent());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//조회수 증가하지 않는 하나의 게시글 리턴 메소드
	public BoardBean getOneUpdateBoard(int num) {
		getCon();
		BoardBean bean = null;
		try {
			String sql = "SELECT * FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new BoardBean();
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
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//업데이트하기
	public void UpdateBoard(int num, String subject, String content) {
		getCon();
		try {
			String sql = "UPDATE BOARD SET SUBJECT = ?, CONTENT = ? WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
