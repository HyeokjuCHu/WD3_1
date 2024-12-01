<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="org.example.springcrudpro.SubjectVO" %>
<%@ page import="java.util.List" %>
<jsp:include page="top.jsp" />

<%
    // SubjectVO 객체는 컨트롤러에서 모델로 전달됨
    SubjectVO subject = (SubjectVO) request.getAttribute("subject");
%>

<div class="container">
    <h2>과목 수정하기</h2>
    <form action="edit_ok" method="post" accept-charset="utf-8">
        <input type="hidden" name="id" value="<%= subject.getId() %>" />
        <table>
            <tr>
                <th>이수구분</th>
                <td><input type="text" name="category" value="<%= subject.getCategory() %>" required /></td>
            </tr>
            <tr>
                <th>과목코드</th>
                <td><input type="text" name="code" value="<%= subject.getCode() %>" required /></td>
            </tr>
            <tr>
                <th>과목명</th>
                <td><input type="text" name="name" value="<%= subject.getName() %>" required /></td>
            </tr>
            <tr>
                <th>영어비율</th>
                <td><input type="number" name="englishRatio" value="<%= subject.getEnglishRatio() %>" required /></td>
            </tr>
            <tr>
                <th>학점</th>
                <td><input type="number" name="credits" value="<%= subject.getCredits() %>" required /></td>
            </tr>
            <tr>
                <th>분반</th>
                <td><input type="text" name="classNum" value="<%= subject.getClassNum() %>" required /></td>
            </tr>
            <tr>
                <th>담당교수</th>
                <td><input type="text" name="professor" value="<%= subject.getProfessor() %>" required /></td>
            </tr>
            <tr>
                <th>수업시간</th>
                <td><input type="text" name="classTime" value="<%= subject.getClassTime() %>" required /></td>
            </tr>
            <tr>
                <th>강의실</th>
                <td><input type="text" name="classRoom" value="<%= subject.getClassRoom() %>" required /></td>
            </tr>
            <tr>
                <th>유형</th>
                <td><input type="text" name="grade" value="<%= subject.getGrade() %>" required /></td>
            </tr>
            <tr>
                <th>교수님 사진</th>
                <td><input type="file" name="profP" accept="image/*" /></td>
            </tr>
        </table>
        <input type="submit" value="수정" />
    </form>
    <a href="list">목록으로 돌아가기</a>
</div>

<jsp:include page="bottom.jsp" />
