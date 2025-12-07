<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"/>

<div class="container">
    <div class="row mb-3">
        <div class="col-md-6">
            <h3>게시판 목록</h3>
        </div>
        <div class="col-md-6 text-end">
            <form action="list" method="get" class="d-flex justify-content-end">
                <input type="text" name="keyword" class="form-control w-50 me-2" placeholder="제목 또는 작성자 검색" value="${param.keyword}">
                <button type="submit" class="btn btn-outline-primary">검색</button>
            </form>
        </div>
    </div>

    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>번호</th>
            <th>카테고리</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.id}</td>
                <td>${u.category}</td>
                <td><a href="view/${u.id}" class="text-decoration-none text-dark">${u.title}</a></td>
                <td>${u.writer}</td>
                <td><fmt:formatDate value="${u.regdate}" pattern="yyyy-MM-dd"/></td>
                <td>${u.cnt}</td>
            </tr>
        </c:forEach>

        <c:if test="${empty list}">
            <tr>
                <td colspan="6" class="text-center">등록된 게시글이 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <div class="text-end">
        <a href="add" class="btn btn-primary">새 글 작성</a>
    </div>
</div>

<jsp:include page="../footer.jsp"/>