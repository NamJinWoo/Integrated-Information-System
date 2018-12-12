package example;

import java.sql.*;

public class DBBean {
  public static DBBean instance = new DBBean();

  public static DBBean getInstance() {
    System.out.println("durkdl");
    return instance;
  }

  public DBBean(){}

  public Connection getConnection() throws Exception{
    Connection conn = null;

    String server = "localhost:3306"; // MySQL 서버 주소
    String database = "SETermProject"; // MySQL DATABASE 이름
    String user_name = "root"; //  MySQL 서버 아이디
    String password = "ska960221"; // MySQL 서버 비밀번호
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      System.err.println(" !! <JDBC 오류> Driver load 오류: " + e.getMessage());
      e.printStackTrace();
    }
    conn = DriverManager.getConnection("jdbc:mysql://localhost/SETermProject", user_name, password);
    System.out.println("정상적으로 연결었습니다.");

    return conn;
  }
  public int userCheck(String id, String passwd) throws Exception{
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String dbpasswd ="";
    int x = -1;
    try {
      conn = getConnection();

      pstmt = conn.prepareStatement(
              "select password from student where studentId = ?");
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      if(rs.next()) {
        dbpasswd = rs.getString("password");
        if(dbpasswd.equals(passwd))
          x=1;
        else
          x=0;
      }else
        x=-1;
    }catch(Exception ex) {
      ex.printStackTrace();
    }finally {
      if(rs != null) try{rs.close();}catch(SQLException ex) {}
      if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
      if(conn != null) try{conn.close();}catch(SQLException ex){}
    }
    return x;
  }


}
