<%@ page import="org.example.springcrudpro.SubjectVO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:include page="top.jsp" />

<div class="container">
  <h2>과목 상세보기</h2>
  <%
    SubjectVO subject = (SubjectVO) request.getAttribute("subject");
  %>
  <p><strong>교수 이름:</strong> <%= subject.getProfessor() %></p>
  <p><strong>과목명:</strong> <%= subject.getName() %></p>
  <p><strong>이수구분:</strong> <%= subject.getCategory() %></p>
  <p><strong>과목코드:</strong> <%= subject.getCode() %></p>
  <p><strong>영어 비율:</strong> <%= subject.getEnglishRatio() %></p>
  <p><strong>학점:</strong> <%= subject.getCredits() %></p>
  <p><strong>분반:</strong> <%= subject.getClassNum() %></p>
  <p><strong>수업시간:</strong> <%= subject.getClassTime() %></p>
  <p><strong>강의실:</strong> <%= subject.getClassRoom() %></p>
  <p><strong>학년:</strong> <%= subject.getGrade() %></p>
  <p><strong>교수님 사진:</strong> <img src="<%= request.getContextPath() + "/img/" + subject.getProfP() %>" alt="교수님 사진" style="width:100px; height:100px;" /></p>
  <a href="list">목록으로 돌아가기</a>
</div>

<jsp:include page="bottom.jsp" />
