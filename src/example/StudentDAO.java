package example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    DBBean logon = DBBean.getInstance();

    public void insertStudentInfo(String studentId, String studentName, String studentDepartment, String studentEmail){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "insert into student(studentId, studentName, major, email) values (?,?,?,?)");
            pstmt.setString(1,studentId);
            pstmt.setString(2,studentName);
            pstmt.setString(3,studentDepartment);
            pstmt.setString(4,studentEmail);
            pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
                    "insert into tuition(studentId, semester) values (?,?)");
            pstmt.setString(1,studentId);
            pstmt.setInt(2,1);
            pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
                    "insert into states(studentId, semester) values (?,?)");
            pstmt.setString(1,studentId);
            pstmt.setInt(2,1);
            pstmt.executeUpdate();
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }

    public Student lookupStudentInfo(String studentId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Student student = null;
        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select * from student where studentId = ?");
            pstmt.setString(1,studentId);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                student = new Student(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getBoolean(6), rs.getString(7), rs.getInt(8));
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return student;
    }

    public void updateState(String studentId, boolean state) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "update student set state = ? where studentId = ?");
            pstmt.setBoolean(1,state);
            pstmt.setString(2, studentId);
            pstmt.executeUpdate();

        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }

    public List<Student> lookupStudents() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Student> studentList = new ArrayList<>();
        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select * from student");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Student student = new Student(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getBoolean(6), rs.getString(7), rs.getInt(8));
                studentList.add(student);
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return studentList;
    }

    public void deleteStudnetInfo(String studentId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "delete from student where studentId = ?");
            pstmt.setString(1,studentId);
            pstmt.executeUpdate();

        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }

    public void updateStudentInfo(Student student) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "update student set password=?, studentAttr=?, major=?, state=?, email=?  where studentId = ?");
            pstmt.setString(1,student.getPassword());
            pstmt.setString(2, student.getStudentAttr());
            pstmt.setString(3, student.getMajor());
            pstmt.setBoolean(4, student.isState());
            pstmt.setString(5, student.getEmail());
            pstmt.setString(6, student.getStudentId());
            pstmt.executeUpdate();

        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }

    public void toNextSemester(List<Student> studentlist) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = logon.getConnection();
            for(Student student : studentlist){
                if( student.getSemester()>=1 && student.getSemester() < 8 && student.isState()){
                    pstmt = conn.prepareStatement("update student set semester = semester+1 where studentId=?");
                    pstmt.setString(1, student.getStudentId());
                    pstmt.executeUpdate();

                    pstmt = conn.prepareStatement(
                            "insert into tuition(studentId, semester) values (?,?)");
                    pstmt.setString(1,student.getStudentId());
                    pstmt.setInt(2,student.getSemester()+1);
                    pstmt.executeUpdate();

                    pstmt = conn.prepareStatement(
                            "insert into states(studentId, semester) values (?,?)");
                    pstmt.setString(1,student.getStudentId());
                    pstmt.setInt(2,student.getSemester()+1);
                    pstmt.executeUpdate();
                }
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }

    }
}
