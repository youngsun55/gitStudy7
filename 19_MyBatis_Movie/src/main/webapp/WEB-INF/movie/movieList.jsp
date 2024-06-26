<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!-- movieList.jsp<br> -->
<style>
	table {
		border-collapse: collapse;
		width: 800px;
	}
</style>
<script type="text/javascript">
	function insert() {
		location.href = "insert.mv";
	}
	
	function update(num, whatColumn, keyword, pageNumber) {
		location.href = "update.mv?num=" + num + "&whatColumn=" + whatColumn + "&keyword=" + keyword + "&pageNumber=" + pageNumber;
	}
</script>

<center>
<form action="list.mv">
	<h2>영화 정보 리스트 화면</h2>
	<select name="whatColumn">
		<option value="all">전체 검색</option>
		<option value="genre">장르</option>
		<option value="grade">등급</option>
		<option value="actor">출연배우</option>
	</select>
	<input type="text" name="keyword"> 
	<input type="submit" value="검색"> 
</form>	
</center>

<table border=1 align="center">
	<tr align="right" height="30px">
		<td colspan=9><input type="button" value="추가하기" onclick="insert()"></td>
	</tr>
	<tr bgcolor="#DCD6F7" height="35px">
		<th>번호</th>
		<th>제목</th>
		<th>대륙</th>
		<th>제작국가</th>
		<th>장르</th>
		<th>등급</th>
		<th>출연배우</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	
	<c:forEach var="movie" items="${lists}">
		<tr align="center" height="30px">
			<td>${movie.num}</td>
			<td><a href="detail.mv?num=${movie.num}&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${pageInfo.pageNumber}">${movie.title}</a></td>
			<td>${movie.continent}</td>
			<td>${movie.nation}</td>
			<td>${movie.genre}</td>
			<td>${movie.grade}</td>
			<td>${movie.actor}</td>
			<td><input type="button" value="수정" onclick="update('${movie.num}', '${param.whatColumn}', '${param.keyword}', '${pageInfo.pageNumber}')"></td>
			<td><a href="delete.mv?num=${movie.num}&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
		</tr>
	</c:forEach>
</table>

<center>
	${pageInfo.pagingHtml}
</center>