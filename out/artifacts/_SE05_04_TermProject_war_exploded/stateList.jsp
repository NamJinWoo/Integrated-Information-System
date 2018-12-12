<%@ page import="example.StudentDAO" %>
<%@ page import="example.Student" %>
<%@ page import="example.StateDAO" %>
<%@ page import="example.State" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 05/12/2018
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = "";
    try{
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(int i =0; i<cookies.length;i++){
                if(cookies[i].getName().equals("studentId")){
                    studentId = cookies[i].getValue();
                }
            }
            if(studentId.equals("")){
                response.sendRedirect("loginForm.jsp");
            }
        }else{
            response.sendRedirect("loginForm.jsp");
        }
    }catch(Exception e){

    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        StateDAO StaDAO = new StateDAO();
        List<State> stateList = StaDAO.lookupStatesInfo(studentId);

       if(stateList.size() == 0){%>
            <script>
                    alert("변동내역이 없습니다.");
            history.go(-1);
    </script>
        <%}%>
    <table>
        <tr>
        <th>연도</th>
        <th>학기</th>
        <th>학적 정보</th>
        </tr>
        <% for (State state: stateList) { %>
            <tr>
                <td><%=state.getYear()%></td>
                <td><%=state.getSemester()%></td>
                <td><%=state.isState()? "재학" : "휴학"%></td>
            </tr>
        <%}%>
    </table>

    <a href="StudentMain.jsp">메인으로</a>
</body>
</html>
