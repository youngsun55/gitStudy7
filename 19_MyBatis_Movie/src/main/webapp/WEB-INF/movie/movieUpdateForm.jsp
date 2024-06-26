<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %> 
movieUpdateForm.jsp<br>

<style>
	table {
		border-collapse: collapse;
	}
	th {
		text-align: left;
		height: 25px;
	}
	.err {
		color: red;
		font-size: 12px;
		font-weight: bold;
		font-style: italic;
	}
</style>

<script>
   var f_selbox = new Array('아시아','아프리카','유럽','아메리카','오세아니아');
   
   var s_selbox = new Array();
   s_selbox[0] = new Array('한국','중국','베트남','네팔');
   s_selbox[1] = new Array('케냐', '가나', '세네갈');
   s_selbox[2] = new Array('스페인', '영국','덴마크','러시아','체코');
   s_selbox[3] = new Array('미국', '캐나다'); 
   s_selbox[4] = new Array('뉴질랜드','오스트레일리아');
   
   var selectContinent;
   
   function init(mc, mn) {
	  //alert('init');
	  //alert(mc +"/" + mn); // 아프리카/ 세네갈
      document.myform.first.options[0] = new Option("대륙 선택하세요",""); // text, value
      document.myform.second.options[0] = new Option("나라 선택하세요",""); // text, value
      for(i=0; i<f_selbox.length; i++) {
         document.myform.first.options[i+1] = new Option(f_selbox[i],f_selbox[i]);
         if(document.myform.first.options[i+1].value == mc){
        	 document.myform.first.options[i+1].selected = true;
        	 selectContinent = i; // 아프리카:1
         }
      }//for
      
      for(var j=0;j<s_selbox[selectContinent].length;j++){
    	  document.myform.second.options[j+1] = new Option(s_selbox[selectContinent][j]);
    	  if(document.myform.second.options[j+1].value == mn){
         	 document.myform.second.options[j+1].selected = true;
          }
      }//for
   }//init
   
   function firstChange() {
      var index = document.myform.first.selectedIndex; // 아프리카:2
      
      for(i=document.myform.second.length-1; i>0; i--) {
         document.myform.second.options[i] = null;
      } 
      
      for(i=0; i<s_selbox[index-1].length; i++) {
         document.myform.second.options[i+1] = new Option(s_selbox[index-1][i]);
      }  
   } //firstChange

</script>
<%
	String[] continentList = {"아시아", "아프리카", "유럽", "아메리카", "오세아니아"};
	String[][] nationList = {
			   						{"한국","중국","베트남","네팔"},
			   						{"케냐", "가나", "세네갈"}, 
			   						{"스페인", "영국","덴마크","러시아","체코"}, 
			   						{"미국", "캐나다"}, 
			   						{"뉴질랜드","오스트레일리아"}
			   					};
	String[] genre = {"액션", "스릴러", "코미디", "판타지", "애니메이션"};
	String[] grade = {"19", "15", "12", "7"};
%>
<c:set var="cList" value="<%=continentList%>"/>
<c:set var="nList" value="<%=nationList%>"/>
<%-- <body onLoad="init('${movie.continent}', '${movie.nation}')"> --%>
	<form:form commandName="movie" name="myform" action="update.mv" method="post">
	<input type="hidden" name="num" value="${movie.num}">
	<input type="hidden" name="whatColumn" value="${param.whatColumn}">
	<input type="hidden" name="keyword" value="${param.keyword}">
	<input type="hidden" name="pageNumber" value="${param.pageNumber}">
	
	<h2>영화 정보 수정 화면</h2>
	<table border=1>
	<tr>
		<th>영화 제목</th>
		<td>
			<input type="text" name="title" value="${movie.title}">
			<form:errors path="title" cssClass="err"/>
		</td>
	</tr>
	<tr>
		<th>대륙</th>
		<td>
			<select id="first" name="continent" onChange="firstChange()" style="width: 100px">
				<option value="">대륙 선택하세요</option>
				<c:forEach var="i" begin="0" end="${fn:length(cList)-1}">
					<option value="${cList[i]}" <c:if test="${movie.continent eq cList[i]}">selected</c:if>>${cList[i]}</option>
				</c:forEach>
			</select>
			<form:errors path="continent" cssClass="err" />
		</td>
	</tr>
	<tr>
		<th>나라</th>
		<td>
			<select id="second" name="nation" onChange="secondChange()" style="width: 100px">
				<option value="">나라 선택하세요</option>
				<c:forEach var="i" begin="0" end="${fn:length(cList)-1}">
					<c:if test="${movie.continent eq cList[i]}">
					<c:forEach var="j" begin="0" end="${fn:length(nList)-1}">
						<option value="${nList[i][j]}" <c:if test="${movie.nation eq nList[i][j]}">selected</c:if>>${nList[i][j]}</option>
					</c:forEach>
					</c:if>
				</c:forEach>
			</select>
		<form:errors path="nation" cssClass="err"/>
		</td>
	</tr>
	<tr>
		<th>장르</th>
		<td>
			<input type="checkbox" name="genre" value="액션" <c:if test="${fn:contains(movie.genre,'액션')}">checked</c:if>>액션
			<input type="checkbox" name="genre" value="스릴러" <c:if test="${fn:contains(movie.genre,'스릴러')}">checked</c:if>>스릴러
			<input type="checkbox" name="genre" value="코미디" <c:if test="${fn:contains(movie.genre,'코미디')}">checked</c:if>>코미디
			<input type="checkbox" name="genre" value="판타지" <c:if test="${fn:contains(movie.genre,'판타지')}">checked</c:if>>판타지
			<input type="checkbox" name="genre" value="애니메이션" <c:if test="${fn:contains(movie.genre,'애니메이션')}">checked</c:if>>애니메이션
			<form:errors path="genre" cssClass="err"/>
		</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>
			<input type="radio" name="grade" value="19" <c:if test="${fn:contains(movie.grade,'19')}">checked</c:if>>19
			<input type="radio" name="grade" value="15" <c:if test="${fn:contains(movie.grade,'15')}">checked</c:if>>15
			<input type="radio" name="grade" value="12" <c:if test="${fn:contains(movie.grade,'12')}">checked</c:if>>12
			<input type="radio" name="grade" value="7" <c:if test="${fn:contains(movie.grade,'7')}">checked</c:if>>7
			<form:errors path="grade" cssClass="err"/>
		</td>
	</tr>
	<tr>
		<th>출연배우</th>
		<td>
			<input type="text" name="actor" value="${movie.actor}">
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="submit" value="수정하기">
		</td>
	</tr>
	</table>
	</form:form>
<!-- </body> -->