<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="org.example.springcrudpro.SubjectVO" %>
<jsp:include page="top.jsp" />

<div class="container">
    <h2>과목 수정하기</h2>

    <!-- Spring form tag to bind the form fields to the SubjectVO object -->
    <form:form method="POST" action="edit_ok" modelAttribute="subject">
        <!-- Hidden input field for subject ID -->
        <form:input path="id" type="hidden" />

        <table>
            <tr>
                <th>이수구분</th>
                <td><form:input path="category" required="true" /></td>
            </tr>
            <tr>
                <th>과목코드</th>
                <td><form:input path="code" required="true" /></td>
            </tr>
            <tr>
                <th>과목명</th>
                <td><form:input path="name" required="true" /></td>
            </tr>
            <tr>
                <th>영어비율</th>
                <td><form:input path="englishRatio" type="number" required="true" /></td>
            </tr>
            <tr>
                <th>학점</th>
                <td><form:input path="credits" type="number" required="true" /></td>
            </tr>
            <tr>
                <th>분반</th>
                <td><form:input path="classNum" required="true" /></td>
            </tr>
            <tr>
                <th>담당교수</th>
                <td><form:input path="professor" required="true" /></td>
            </tr>
            <tr>
                <th>수업시간</th>
                <td><form:input path="classTime" required="true" /></td>
            </tr>
            <tr>
                <th>강의실</th>
                <td><form:input path="classRoom" required="true" /></td>
            </tr>
            <tr>
                <th>유형</th>
                <td><form:input path="grade" required="true" /></td>
            </tr>
            <tr>
                <th>교수님 사진</th>
                <td><form:input path="profP" type="file" /></td>
            </tr>
        </table>
        <input type="submit" value="수정" />
    </form:form>

    <a href="list">목록으로 돌아가기</a>
</div>

<jsp:include page="bottom.jsp" />
