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
		} catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
}
