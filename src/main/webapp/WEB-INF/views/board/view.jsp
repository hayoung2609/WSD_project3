<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 12. 7.
  Time: 오후 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 상세보기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script>
    function delete_ok(id) {
      if(confirm("정말 삭제하시겠습니까?")) {
        location.href = '../deleteok/' + id;
      }
    }
  </script>
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="card">
    <div class="card-header">게시글 상세보기</div>
    <div class="card-body">
      <h5 class="card-title">[${u.category}] ${u.title}</h5>
      <p class="card-text text-muted">
        작성자: ${u.writer} |
        작성일: <fmt:formatDate value="${u.regdate}" pattern="yyyy-MM-dd HH:mm"/> |
        조회수: ${u.cnt} |
        이메일: ${u.email}
      </p>
      <hr>
      <p class="card-text">${u.content}</p>

      <div class="mt-4 text-end">
        <a href="../list" class="btn btn-secondary">목록</a>
        <a href="../editform/${u.id}" class="btn btn-warning">수정</a>
        <a href="javascript:delete_ok('${u.id}')" class="btn btn-danger">삭제</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>
