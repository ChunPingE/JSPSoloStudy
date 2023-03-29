package db;

import java.beans.beancontext.*;
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
				//3개만 저장
				count++;
				if (count > 2) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
