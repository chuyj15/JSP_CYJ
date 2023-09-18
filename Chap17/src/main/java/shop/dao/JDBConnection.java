package shop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnection {
	public Connection con;		//연결된 드라이버에 SQL을 요청할 객체를 생성하는 클래스
	public Statement stmt;		//SQL 실행 요청을 하는 클래스
	public PreparedStatement psmt;		//Statement에서 ? 파라미터 확장기능을 추가로 제공하는 클래스
	public ResultSet rs;				//SQL 실행 결과를 받아오는 클래스
	
	//기본 생성자
	public JDBConnection() {
		//JDBC 드라이버 로드
		//MySQL
		try {
			//mysql-connector-j.xxx.jar 드라이버의 클래스를 로드한다. 
			Class.forName("com.mysql.cj.jdbc.Driver");		//그중에 com.mysql.cj.jdbc.패키지안에 Driver 클래스를 가져오는 거임. 
			
			//DB에 연결
			// - 연결에 필요한 정보 : URL, id, pw
			//URL : jdbc:mysql://도메인:[PORT]/[스키마]?옵션파라미터
			//			도메인: 아이피주소임 / localhost: 내 pc의 ip주소임 /  127.0.0.1로 표기하기도 함. 
			//			3306포트: MYSQL 데이터베이스의 기본 포트 / 일반적인 웹개발서버포트: 8080
			//			스키마: joeun / Workbench에서 확인 가능. 
//			String url = "jdbc:mysql://192.168.30.119:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String url = "jdbc:mysql://localhost:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String id = "joeun";
			String pw = "123456";
			
			//자바 프로그램에서 JDBC드라이버를 연결시켜주는 클래스
			//getConnection()메소드로 DB에 연결요청하고, 생성된 Connection 객체를 반환받는다.
			con = DriverManager.getConnection(url, id, pw);		//실제로 들어온 것: new Connection()
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.err.println("DB 연결 실패");
			e.printStackTrace();
		}
		
		
	}
//	public static void main(String[] args) {
//		JDBConnection jdbc = new JDBConnection();
//	}
	
	
}
