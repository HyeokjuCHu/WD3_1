<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="top.jsp" />

<html>
<head>
  <meta charset="utf-8">
  <title>과목 목록</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 1200px;
      margin: auto;
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #007BFF;
      color: white;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    a {
      color: #007BFF;
      text-decoration: none;
      margin-right: 10px;
    }

    a:hover {
      text-decoration: underline;
    }

    .search-container {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .search-container input {
      flex: 1;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    .search-container button {
      padding: 10px;
      background-color: #007BFF;
      color: white;
      border: none;
      border-radius: 4px;
      margin-left: 10px;
      cursor: pointer;
    }

    .search-container button:hover {
      background-color: #0056b3;
    }
  </style>
  <script>
    function searchSubjects() {
      const searchInput = document.getElementById('search').value.trim();
      if (searchInput) {
        location.href = "list?search=" + encodeURIComponent(searchInput);
      } else {
        location.href = "list";
      }
    }

  </script>
</head>
<body>
<div class="container">
  <h2>과목 목록</h2>
  <div class="search-container">
    <input type="text" id="search" placeholder="검색어 입력">
    <button onclick="searchSubjects()">검색</button>
  </div>
  <table border="1" cellpadding="10" cellspacing="0" style="width:100%; text-align:center;">
    <thead>
    <tr>
      <th>번호</th>
      <th>교수님 사진</th>
      <th>이수구분</th>
      <th>과목코드</th>
      <th>과목명</th>
      <th>영어 비율</th>
      <th>학점</th>
      <th>분반</th>
      <th>담당교수</th>
      <th>수업시간</th>
      <th>강의실</th>
      <th>학년</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty subjects}">
      <c:forEach var="u" items="${subjects}">
        <tr>
          <td>${u.id}</td>
          <td>
            <img src="${pageContext.request.contextPath}/img/${u.profP}" alt="교수님 사진" style="width:50px; height:50px;">
          </td>
          <td>${u.category}</td>
          <td>${u.code}</td>
          <td>${u.name}</td>
          <td>${u.englishRatio}</td>
          <td>${u.credits}</td>
          <td>${u.classNum}</td>
          <td>${u.professor}</td>
          <td>${u.classTime}</td>
          <td>${u.classRoom}</td>
          <td>${u.grade}</td>
          <td>
            <a href="${pageContext.request.contextPath}/view?id=${u.id}">보기</a>
            <a href="${pageContext.request.contextPath}/edit?id=${u.id}">수정</a>
            <a href="javascript:void(0);" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='${pageContext.request.contextPath}/delete_ok?id=${u.id}'">삭제</a>
          </td>
        </tr>
      </c:forEach>
    </c:if>
    <c:if test="${empty subjects}">
      <tr>
        <td colspan="13">등록된 과목이 없습니다.</td>
      </tr>
    </c:if>
    </tbody>
  </table>
</div>
</body>
</html>
<jsp:include page="bottom.jsp" />
