package db;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class RentcarDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 커넥션 풀을 이용한 데이터베이스 연결
	public void getCon() {
		try {
			Context initct = new InitialContext();
			Context envctx = (Context) initct.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");

			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<CarListBean> getSelectCar() {
		List<CarListBean> list = new ArrayList<>();
		getCon();
		try {
			String sql = "SELECT * FROM RENTCAR ORDER BY NO DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			int count = 0;
			while (rs.next()) {
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				list.add(bean);
				// 3개만 저장
				count++;
				if (count > 2) {
					break;
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<CarListBean> getCategoryCar(int category) {
		List<CarListBean> list = new ArrayList<>();
		// 데이터를 저장할 빈 클래스 선언
		CarListBean bean = null;

		getCon();

		try {
			String sql = "SELECT * FROM RENTCAR WHERE CATEGORY = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 모든 차량을 검색하는 메소드
	public List<CarListBean> getAllCar() {
		List<CarListBean> list = new ArrayList<>();
		// 데이터를 저장할 빈 클래스 선언
		CarListBean bean = null;

		getCon();

		try {
			String sql = "SELECT * FROM RENTCAR";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 한대의 차량 가져오기
	public CarListBean getOneCar(int no) {
		CarListBean bean = new CarListBean();

		getCon();

		try {
			String sql = "SELECT * FROM RENTCAR WHERE NO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public int getMember(String id, String pass) {
		int result = 0; // 회원없음

		getCon();

		try {
			String sql = "SELECT COUNT(ID) FROM MEMBER WHERE ID = ? AND PASS1 = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 하나의 예약번호를 저장하는 메소드
	public void setReserveCar(CarReserveBean bean) {
		getCon();

		try {
			String sql = "INSERT INTO carreserve(ID, NO, QTY, DDAY, RDAY, USEIN, USEWIFI, USENAVI, USESEAT) "
					+ "VALUES(?, ? , ?, ?, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setInt(2, bean.getNo());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getDday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getUsein());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUsenavi());
			pstmt.setInt(9, bean.getUseseat());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<CarViewBean> getAllReserve(String id) {
		List<CarViewBean> list = new ArrayList<>();

		getCon();

		try {
			String sql = "SELECT * FROM RENTCAR NATURAL JOIN carreserve WHERE date_format(RDAY, '%Y-%m-%d' ) > NOW() AND ID= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CarViewBean bean = new CarViewBean();
				bean.setName(rs.getString("NAME"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setImg(rs.getString("IMG"));
				bean.setQty(rs.getInt("QTY"));
				bean.setDday(rs.getInt("DDAY"));
				bean.setRday(rs.getString("RDAY"));
				bean.setUsein(rs.getInt("USEIN"));
				bean.setUsewifi(rs.getInt("USEWIFI"));
				bean.setUsenavi(rs.getInt("USENAVI"));
				bean.setUseseat(rs.getInt("USESEAT"));
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
