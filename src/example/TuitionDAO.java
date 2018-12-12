package example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TuitionDAO {
    DBBean logon = DBBean.getInstance();

    public List<Tuition> lookupBills(String studentId){
        List<Tuition> tuitionList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select * from tuition where studentId = ?");
            pstmt.setString(1,studentId);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Tuition tuition = new Tuition(rs.getString(1),rs.getInt(2),rs.getInt(3),rs.getInt(4));
                tuitionList.add(tuition);
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return tuitionList;
    }

    public void updateScholarship(String studentId, int semester) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();

            pstmt = conn.prepareStatement(
                    "update tuition set scholarship=1000000 where studentId= ? and semester=?");
            pstmt.setString(1,studentId);
            pstmt.setInt(2,semester);
            pstmt.executeUpdate();

        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }
}
