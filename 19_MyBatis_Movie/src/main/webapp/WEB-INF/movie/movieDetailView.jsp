<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
movieDetailView.jsp<br>
<style>
	th {
		background-color: #EEF1FF;
	}
</style>
<center>
<h2>영화 상세 화면</h2>

<table border=1 width="350" height="300">
	<tr>
		<th>번호</th>
		<td>${mb.num}</td>
	</tr>
	<tr>
		<th>영화제목</th>
		<td>${mb.title}</td>
	</tr>
	<tr>
		<th>제작국가</th>
		<td>${mb.nation}</td>
	</tr>
	<tr>
		<th>장르</th>
		<td>${mb.genre}</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${mb.grade}</td>
	</tr>
	<tr>
		<th>배우</th>
		<td>${mb.actor}</td>
	</tr>
	<tr align="center" bgcolor="#F9F5F6">
		<td colspan=2><a href="list.mv?&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${pageNumber}">영화 리스트 화면으로 돌아감</a></td>
		<!-- model로 설정한 값을 param으로 받을 수도 있음 -->
	</tr>
</table>
</center>