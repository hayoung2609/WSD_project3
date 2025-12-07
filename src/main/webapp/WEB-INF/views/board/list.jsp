<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 12. 4.
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<img src="img/list.png" width="300" />

<h1>${title}</h1>

<c:forEach var="name" items="${classlist}" varStatus="status">
    <p>${status.count} : ${name}</p>
</c:forEach>
</body>

</html>
