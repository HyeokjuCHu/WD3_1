<%@ page import="org.example.springcrudpro.SubjectVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<jsp:include page="top.jsp" />

<div class="container">
  <h2>과목 목록</h2>

  <form action="list" method="get">
    <input type="text" name="search" placeholder="검색어 입력" />
    <input type="submit" value="검색" />
  </form>

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
      <th class="wide-cell">Actions</th>
    </tr>
    </thead>
    <tbody>
      <%
      List<SubjectVO> subjects = (List<SubjectVO>) request.getAttribute("subjects");

      if (subjects != null && !subjects.isEmpty()) {
        for (SubjectVO vo : subjects) {
    %>
    <tr>
      <td><%= vo.getId() %></td>
      <td>
        <img
                src="<%= request.getContextPath() + "/img/" + vo.getProfP() %>"
                alt="교수님 사진"
                style="width:50px; height:50px;"
        />

      </td>
      <td><%= vo.getCategory() %></td>
      <td><%= vo.getCode() %></td>
      <td><%= vo.getName() %></td>
      <td><%= vo.getEnglishRatio() %></td>
      <td><%= vo.getCredits() %></td>
      <td><%= vo.getClassNum() %></td>
      <td><%= vo.getProfessor() %></td>
      <td><%= vo.getClassTime() %></td>
      <td><%= vo.getClassRoom() %></td>
      <td><%= vo.getGrade() %></td>
      <td>
        <a href="view?id=<%= vo.getId() %>">보기</a>
        <a href="edit?id=<%= vo.getId() %>">수정</a>
        <a href="javascript:void(0);" onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='delete_ok?id=<%= vo.getId() %>' }">삭제</a>
      </td>

    </tr>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="12">등록된 과목이 없습니다.</td>
      </tr>
      <%
        }
      %>
    </tbody>
  </table>
</div>

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

  h1 {
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
  .wide-cell{
    width:30px;
  }

  .search-form {
    margin-bottom: 20px;
    text-align: center;
  }

  .search-form input[type="text"] {
    padding: 10px;
    width: 300px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }

  .search-form input[type="submit"] {
    padding: 10px 15px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  .search-form input[type="submit"]:hover {
    background-color: #0056b3;
  }

  .sort-form {
    margin-bottom: 20px;
    text-align: center;
  }

  .sort-form select {
    padding: 10px;
    width: 150px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-right: 10px;
    cursor: pointer;
  }

  .sort-form input[type="submit"] {
    padding: 10px 15px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  @media (max-width: 768px) {
    table, thead, tbody, th, td, tr {
      display: block;
    }

    thead tr {
      position: absolute;
      top: -9999px;
      left: -9999px;
    }

    tr {
      margin-bottom: 15px;
    }

    td {
      text-align: right;
      padding-left: 50%;
      position: relative;
    }

    td::before {
      content: attr(data-label);
      position: absolute;
      left: 10px;
      width: 50%;
      padding-left: 10px;
      text-align: left;
      font-weight: bold;
    }
  }
</style>


<jsp:include page="bottom.jsp" />
