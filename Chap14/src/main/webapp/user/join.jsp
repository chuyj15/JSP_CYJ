<!-- chap14 -->
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
<% String root = request.getContextPath(); %>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원가입</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">회원가입</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<%-- <a href="<%= request.getContextPath() %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a> --%>
				<a href="<%= root%>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button>
			</div>
		</div>
	</div>
	
	<!-- 회원 가입 입력 -->
	<div class="container mb-5">
		<form action="join_pro.jsp" name="joinForm" method="post">
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">아이디</label>
				<input type="text" class="form-control col-md-10" name="id" placeholder="아이디를 입력해주세요" required>
				<!-- required 하면 이 입력란을 작성해달라고 뜸 -->
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">비밀번호</label>
				<input type="password" class="form-control col-md-10" name="pw" placeholder="비밀번호를 입력해주세요" required>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">비밀번호 확인</label>
				<input type="password" class="form-control col-md-10" name="pw_confirm" placeholder="비밀번호를 다시한번 입력해주세요" required>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이름</label>
				<input type="text" class="form-control col-md-10" name="name" placeholder="이름을 입력해주세요" required>
			</div>
			
			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text" id="">성별</label>
				</div>
				<div class="col-md-10 d-flex align-items-center">
					<div class="radio-box d-flex ">
						<div class="radio-item">
							<input type="radio" class="form-check-input" name="gender" value="여" id="gender-female"> 
							<label for="gender-female">여자</label>
						</div>

						<div class="radio-item mx-4">
							<input type="radio" class="form-check-input " name="gender" value="남" id="gender-male"> 
							<label for="gender-male">남자</label>
						</div>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text" id="">생일</label>
				</div>
				<div class="col-md-10 d-flex align-items-center">
					<div class="row">
						<div class="col-3 mx-2  px-0">
						<!--  size="4" : 연도는 4자리로 입력 -->
							<input type="text" class="form-control" name="year" placeholder="출생년도" size="10">
						</div>

						<div class="col-4">
						<!-- class="h-100" 높이를 100퍼센트로 -->
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
							<input type="text" class="form-control" name="day" placeholder="일자" size="4">
						</div>
						
						
						
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이메일</label>
				
				<div class="row col-md-10 align-items-center">
					<div class="col-3 px-0">
						<input type="text" class="form-control col-md-10" name="email1" placeholder="이메일을 입력해주세요">
					</div>
					<div class="col-auto">
						@
					</div>
					<div class="col-3 px-0">
						<select name="email2" class="form-select">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">전화번호</label>
				<input type="text" class="form-control col-md-10" name="phone" placeholder="전화번호를 입력해주세요">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">주소</label>
				<input type="text" class="form-control col-md-10" name="address" placeholder="주소를 입력해주세요">
			</div>
			
			<!-- 버튼 -->
			<div class="d-flex justify-content-center mt-5">
				<input type="submit" class="btn btn-lg btn-primary" value="가입" />
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary">가입취소</a>
				<!-- javascript: history.back()" : 뒤로가기 -->
			</div>
			
		</form>
	
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





