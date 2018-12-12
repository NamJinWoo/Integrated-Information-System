package example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SelSubjectDAO {
    DBBean logon = DBBean.getInstance();

    public String registerSelSubjects(int lectureId,String studentId){
        int eduSemester = 0;
        String selectQuery = "select EXISTS ( select * from selsubjects where lectureId = ? and studentId = ?)";
        String getSemesterQuery = "select semester from student where studentId = ?";
        String updateQuery = "insert into selsubjects(studentId, lectureId, eduSemester) values ( ?, ?, ?) ";
        String updateSubject = "update subject set presentStudent = presentStudent+1 where lectureId = ?";
        SelSubject selsubject = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1,lectureId);
            pstmt.setString(2,studentId);

            rs = pstmt.executeQuery();
            if(rs.next()){
                if (rs.getInt(1) == 1){
                    return "이미 신청한 과목입니다.";
                }else{
                    pstmt = conn.prepareStatement(getSemesterQuery);
                    pstmt.setString(1,studentId);
                    rs = pstmt.executeQuery();
                    if(rs.next())
                        eduSemester = rs.getInt(1);

                    pstmt = conn.prepareStatement(updateQuery);
                    pstmt.setString(1,studentId);
                    pstmt.setInt(2,lectureId);
                    pstmt.setInt(3,eduSemester);
                    pstmt.executeUpdate();

                    pstmt = conn.prepareStatement(updateSubject);
                    pstmt.setInt(1,lectureId);
                    pstmt.executeUpdate();
                    return "신청이 완료되었습니다.";
                }
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return null;
    }
    public List<SelSubject> lookupSelSubjects(String studentId, int eduSemester){
        String getSemesterQuery = "select semester from student where studentId = ?";
        List<SelSubject> subjectArray = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = logon.getConnection();
            if( eduSemester == 0) {
                pstmt = conn.prepareStatement(
                        getSemesterQuery);
                pstmt.setString(1, studentId);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    eduSemester = rs.getInt(1);
                }
            }

            if( eduSemester == -1) {
                pstmt = conn.prepareStatement("select subject.*, gradePoint, eduSemester from selsubjects INNER JOIN subject where selsubjects.lectureId = subject.lectureId and studentId = ? order by eduSemester");
            }else{
                pstmt = conn.prepareStatement("select subject.*, gradePoint, eduSemester from selsubjects INNER JOIN subject where selsubjects.lectureId = subject.lectureId and studentId = ? and eduSemester = ?");
                pstmt.setInt(2,eduSemester);
            }
            pstmt.setString(1,studentId);
            rs = pstmt.executeQuery();
            while(rs.next()) {

                SelSubject selSubject;
                selSubject = new SelSubject(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getInt(6),rs.getInt(9),rs.getString(10),rs.getString(11), rs.getDouble(13),  rs.getInt(14));
                subjectArray.add(selSubject);
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return subjectArray;
    }

    public double getAvgGrade(String studentId, int semester){
        double average=0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select AVG(gradePoint) from selsubjects where studentId = ? and eduSemester = ?");
            pstmt.setString(1,studentId);
            pstmt.setInt(2,semester);
            rs =  pstmt.executeQuery();
            if(rs.next()){
                average = rs.getDouble(1);
            }

        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return average;
    }

    public void updateGradePoints(String studentId, int semester, List<SelSubject> selSubjectList) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            System.out.println(selSubjectList.size());
            for (SelSubject selsubject: selSubjectList) {
                System.out.println(selsubject.getLectureId());

                pstmt = conn.prepareStatement(
                        "update selsubjects set gradePoint=? where studentId= ? and eduSemester=? and lectureId=?");
                pstmt.setDouble(1,selsubject.getGradePoint());
                pstmt.setString(2, studentId);
                pstmt.setInt(3, semester);
                pstmt.setInt(4, selsubject.getLectureId());
                pstmt.executeUpdate();
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }
}
