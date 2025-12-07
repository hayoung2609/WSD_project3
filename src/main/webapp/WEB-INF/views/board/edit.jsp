<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 12. 7.
  Time: 오후 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>글 수정</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="card">
    <div class="card-header">글 수정</div>
    <div class="card-body">
      <form action="../editok" method="post">
        <input type="hidden" name="id" value="${u.id}">

        <div class="mb-3">
          <label class="form-label">제목</label>
          <input type="text" name="title" class="form-control" value="${u.title}" required>
        </div>
        <div class="mb-3">
          <label class="form-label">작성자</label>
          <input type="text" name="writer" class="form-control" value="${u.writer}" required>
        </div>
        <div class="mb-3">
          <label class="form-label">이메일</label>
          <input type="email" name="email" class="form-control" value="${u.email}">
        </div>
        <div class="mb-3">
          <label class="form-label">비밀번호</label>
          <input type="password" name="password" class="form-control">
        </div>
        <div class="mb-3">
          <label class="form-label">카테고리</label>
          <select name="category" class="form-select">
            <option value="공지" <c:if test="${u.category == '공지'}">selected</c:if>>공지</option>
            <option value="질문" <c:if test="${u.category == '질문'}">selected</c:if>>질문</option>
            <option value="잡담" <c:if test="${u.category == '잡담'}">selected</c:if>>잡담</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">내용</label>
          <textarea name="content" class="form-control" rows="5" required>${u.content}</textarea>
        </div>

        <button type="submit" class="btn btn-primary">수정 완료</button>
        <a href="../view/${u.id}" class="btn btn-secondary">취소</a>
      </form>
    </div>
  </div>
</div>

</body>
</html>
