<%@page import="java.util.List"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<%
	String root = request.getContextPath();
	String loginId = (String) session.getAttribute("loginId");
	UserRepository userDAO = new UserRepository();
	User user = userDAO.getUserById(loginId);
	String id = user.getId();
	String pw = user.getPassword();
	String name = user.getName();
	String gender = user.getGender();
	String birth = user.getBirth();
	String[] birthlist = birth.split("/");
	String year = birthlist[0];
	String month = birthlist[1];
	String day = birthlist[2];
	String email = user.getMail();
	String[] emaillist = email.split("@");
	String email1 = emaillist[0];
	String email2 = emaillist[1];
	String phone = user.getPhone();
	String address = user.getAddress();
	String registday = user.getRegistDay();
	%>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원정보 수정</h1>
	</div>

	<!-- 회원 가입 입력 -->
	<div class="container mb-5">
		<form action="./update_pro.jsp" name="userUpdateForm" method="post">

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">아이디</label> <input
					type="text" class="form-control col-md-10" name="id"
					value="<%=id%>" readonly>
				<!-- required 하면 이 입력란을 작성해달라고 뜸 -->
			</div>
			<div class="input-group mb-3 row">
				<!-- 만약에 입력값이 없으면 기존 비밀번호 그대로 사용하고, 입력값이 있으면 새 비밀번호로 db 업뎃해줘야 함.  -->
				<label class="input-group-text col-md-2" id="">비밀번호 수정</label> <input
					type="password" class="form-control col-md-10" name="pw">
			</div>

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이름</label> <input
					type="text" class="form-control col-md-10" name="name"
					value="<%=name%>">
			</div>

			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text" id="">성별</label>
				</div>

				<%
				//만약에 여자면 여자라디오 미리 체크되어있기 . 아니면 남자로. 
				if (gender.equals("여")) {
				%>
				<div class="col-md-10 d-flex align-items-center">
					<div class="radio-box d-flex ">
						<div class="radio-item">
							<input type="radio" class="form-check-input" name="gender"
								value="여" id="gender-female" checked> <label
								for="gender-female">여자</label>
						</div>

						<div class="radio-item mx-4">
							<input type="radio" class="form-check-input " name="gender"
								value="남" id="gender-male"> <label for="gender-male">남자</label>
						</div>
					</div>
				</div>


				<%
				} else {
				%>
				<div class="col-md-10 d-flex align-items-center">
					<div class="radio-box d-flex ">
						<div class="radio-item">
							<input type="radio" class="form-check-input" name="gender"
								value="여" id="gender-female"> <label for="gender-female">여자</label>
						</div>

						<div class="radio-item mx-4">
							<input type="radio" class="form-check-input " name="gender"
								value="남" id="gender-male" checked> <label
								for="gender-male">남자</label>
						</div>
					</div>
				</div>


				<%
				}
				%>
			</div>


			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text" id="">생일</label>
				</div>
				<div class="col-md-10 d-flex align-items-center">
					<div class="row">
						<div class="col-3 mx-2  px-0">
							<!--  size="4" : 연도는 4자리로 입력 -->
							<input type="text" class="form-control" name="year"
								value="<%=year%>" size="10">
						</div>

						<div class="col-4">
							<!-- class="h-100" 높이를 100퍼센트로 -->
							<!-- 월이 미리 체크되어있게 하고 싶은데 그러면 코드가 너무 커질 것 같아서 엄두를 못내겠음.  -->
							<select name="month" class="h-100 form-select">
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
						<div class="col-4 mx-2">
							<input type="text" class="form-control" name="day"
								value="<%=day%>" size="4">
						</div>
					</div>
				</div>
			</div>

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이메일</label>

				<div class="row col-md-10 align-items-center">
					<div class="col-3 px-0">
						<input type="text" class="form-control col-md-10" name="email1"
							value="<%=email1%>">
					</div>
					<div class="col-auto">@</div>
					<div class="col-3 px-0">
						<select name="email2" class="form-select">
							<!-- email2 속성값에 따라 미리 선택되어 있게 만들어주기.  -->
							<%
							if (email2.equals("kakao.com")) {
							%>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com" selected>kakao.com</option>
							<%
							} else if (email2.equals("gmail.com")) {
							%>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com" selected>gmail.com</option>
							<option value="kakao.com">kakao.com</option>
							<%
							} else {
							%>
							<option value="naver.com" selected>naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com">kakao.com</option>
							<%
							}
							%>
						</select>
					</div>
				</div>
			</div>

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">전화번호</label> <input
					type="text" class="form-control col-md-10" name="phone"
					value="<%=phone%>">
			</div>

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">주소</label> <input
					type="text" class="form-control col-md-10" name="address"
					value="<%=address%>">
			</div>

			<!-- 버튼 -->
			<div class="d-flex justify-content-center mt-5">
				<input type="submit" class="btn btn-lg btn-primary mx-5" value="회원정보 수정" />
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary  mx-5">취소</a>
				<!-- javascript: history.back()" : 뒤로가기 -->
				<a href="javascript: ;" onclick="alertDel()" class="btn btn-lg btn-danger mx-5" >회원 탈퇴</a>
			</div>
		</form>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	
<script>
<%-- 
function alertDel(){
	if(confirm("정말로 회원탈퇴 할거에요..?")){
		location.href = "remove.jsp?id=<%=id %>";
	}
}
 --%>
 function alertDel() {

		let form = document.updateForm

		let check = confirm('정말 탈퇴하시겠습니까?')

		if( check ) {
			form.action = 'remove.jsp'
			form.submit()
		}

	}
 
</script>
</body>
</html>





