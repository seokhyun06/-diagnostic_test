package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
public static Connection getConnection() {
	Connection conn = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "system";
	String pw = "1234";
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		System.out.println("DB 연결 성공");
		
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("DB 연결 실패");
		}
	return conn;
	}

}
