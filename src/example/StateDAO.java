package example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StateDAO {
    DBBean logon = DBBean.getInstance();

    public List<State> lookupStatesInfo(String studentId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<State> stateList = new ArrayList<>();

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "select * from states where studentId = ?");
            pstmt.setString(1,studentId);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                stateList.add(new State(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getBoolean(5)));
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(rs != null) try{rs.close();}catch(SQLException ex) {}
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
        return stateList;
    }

    public void updateState(String studentId, boolean state) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = logon.getConnection();
            pstmt = conn.prepareStatement(
                    "update states set state=? where  stateId = ( select * from ( select max(stateId)  from states where studentId=?) as X )");
            pstmt.setBoolean(1,state);
            pstmt.setString(2,studentId);
            pstmt.executeUpdate();
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
            if(conn != null) try{conn.close();}catch(SQLException ex){}
        }
    }
}
