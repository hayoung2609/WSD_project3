<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 12. 7.
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>새 글 작성</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="card">
    <div class="card-header">새 글 작성</div>
    <div class="card-body">
      <form action="addok" method="post">
        <div class="mb-3">
          <label class="form-label">제목</label>
          <input type="text" name="title" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">작성자</label>
          <input type="text" name="writer" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">이메일</label>
          <input type="email" name="email" class="form-control">
        </div>
        <div class="mb-3">
          <label class="form-label">비밀번호</label>
          <input type="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">카테고리</label>
          <select name="category" class="form-select">
            <option value="공지">공지</option>
            <option value="질문">질문</option>
            <option value="잡담">잡담</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">내용</label>
          <textarea name="content" rows="5" class="form-control" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">저장</button>
        <a href="list" class="btn btn-secondary">목록</a>
      </form>
    </div>
  </div>
</div>

</body>
</html>
