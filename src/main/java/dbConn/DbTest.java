package dbConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbTest {
	public static Connection getConnection() {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jdbc";
		String password = "oracle";
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공 getConnection!");
			System.err.println(conn);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//테스트 연결
//	public static void main(String[] args) {
//		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user = "jdbc";
//		String password = "oracle";
//
//		Connection conn = null;
//
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, user, password);
//			System.out.println("DB 연결 성공 main");
//			System.err.println(conn);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//	}

}
