<%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <button onclick="javascript:lookup();">장학생 현황 보기</button>
    <script>
        function lookup(){

            var url = "updateScholarship.jsp";
            opener.window.location=url;
            close();
        }
    </script>
</body>
</html>
