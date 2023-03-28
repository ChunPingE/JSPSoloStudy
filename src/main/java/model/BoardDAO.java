package model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class BoardDAO {
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
			// datasource에서 값가져오기
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean) {
		getCon();
		// 빈클래스에 넘어오지 않았던 데이터를 초기화
		int ref = 0; // 글 그룹 의미 = 퀴리에서 가장 큰 ref값 가져오고 +1
		int re_step = 1; // 새글이기에 = 부모글이기에
		int re_level = 1;

		try {
			// 가장 큰 ref값을 읽어오는 쿼리준비
			String refsql = "SELECT MAX(REF) FROM BOARD";
			// 쿼리실행
			pstmt = con.prepareStatement(refsql);
			// 쿼리실행후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1; // 최대값에 1을 더해서 글그룹 설정
			}

			// 실제로 게시글 전체 값에 테이블 저장
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

	// 모든 게시글을 리턴해주는 메소드 작성
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

	// BoardInfo 하나의 게시글을 리턴하는 메소드
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();

		try {
			// 조회수 증가 쿼리
			String readSql = "UPDATE BOARD SET READCOUNT = READCOUNT+1 WHERE NUM = ?";
			pstmt = con.prepareStatement(readSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			String sql = "SELECT * FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
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

	// 답변글이 저장되는 메소드
	public void reWriteBoard(BoardBean bean) {
		// 부모 글 그룹과 글레벨 글 스탭을 읽어들임
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		getCon();

		try {
			/////// 핵심코드////////
			// 부모 글보다 큰 re_level 의 값을 전부 1씩 증가
			String levelsql = "UPDATE BOARD SET RE_LEVEL = RE_LEVEL+1 WHERE REF=? AND RE_LEVEL > ?";

			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref); // 부모 1
			pstmt.setInt(2, re_level); // 부모 1보다 큰거
			pstmt.executeUpdate();

			// 답변글 데이터를 저장
			String sql = "INSERT INTO BOARD(WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, RE_STEP, RE_LEVEL, READCOUNT, CONTENT)"
					+ " VALUES(?, ?, ?, ?, NOW(), ?, ?, ?, 0, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1);
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Boardupdate용 글 가져오기
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();

		try {
			String sql = "SELECT * FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
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

	// upsate와 delete시 필요한 패스워드 값을 리턴해주는 메소드
	public String getPass(int num) {
		String pass = "";

		getCon();
		try {
			String sql = "SELECT PASSWORD FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}

	public void updateBoard(BoardBean bean) {
		getCon();

		try {
			String sql = "UPDATE BOARD SET SUBJECT=?, CONTENT=? WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());

			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 하나의 게시글 삭제
	public void deleteBoard(int num) {
		getCon();

		try {
			String sql = "DELETE FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

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
}
