package example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {
    DBBean logon = DBBean.getInstance();

    public List<Subject> lookupSubject() {
        List<Subject> subjectArray = new ArrayList<Subject>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select * from subject");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(1));
                Subject subject = null;
                subject = new Subject(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11),rs.getInt(12));
                subjectArray.add(subject);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException ex) {
            }
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
        return subjectArray;
    }

    public void insertSubject(String lectureName, String profName, String classroomNum, String classTime, int gradeValue, int eduYear, int maxStudents, int lectureKind, String lectureMajor, String lecturePlan) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "insert into subject(lectureName, profName, classroomNum, classTime, gradeValue, eduYear, maxStudents, lectureKind, lectureMajor, lecturePlan) values (?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, lectureName);
            pstmt.setString(2, profName);
            pstmt.setString(3, classroomNum);
            pstmt.setString(4, classTime);
            pstmt.setInt(5, gradeValue);
            pstmt.setInt(6, eduYear);
            pstmt.setInt(7, maxStudents);
            pstmt.setInt(8, lectureKind);
            pstmt.setString(9, lectureMajor);
            pstmt.setString(10, lecturePlan);
            pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException ex) {
            }
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }

    public void deleteSubjectIndo(String lectureId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "delete from subject where lectureId = ?");
            pstmt.setString(1, lectureId);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }

    public Subject lookupSubjectInfo(String lectureId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Subject subject = null;
        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select * from subject where lectureId = ?");
            pstmt.setString(1, lectureId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                subject = new Subject(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11),rs.getInt(12));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException ex) {
            }
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
        return subject;
    }

    public void updateSubjectInfo(Subject subject) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "update subject set classroomNum=?, classTime=?, maxStudents=?, lecturePlan=? where lectureId = ?");
            pstmt.setString(1, subject.getClassroomNum());
            pstmt.setString(2, subject.getClassTime());
            pstmt.setInt(3, subject.getMaxStudents());
            pstmt.setString(4, subject.getLecturePlan());
            pstmt.setInt(5, subject.getLectureId());
            pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }

}
