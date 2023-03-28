package db;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class RentcarDAO {

	Connection con;
	PreparedStatement psmt;
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

}
