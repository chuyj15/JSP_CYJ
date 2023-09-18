<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//로그인 유효성 검사
	function checkLogin() {
		let form=document.loginForm 	// name이 loginForm인 폼 요소를 가져옴
		//입력 여부 검증
		if (form.id.value == ""){
			alert('아이디를 입력해주세요')
			form.id.focus()
			return false
		}
		
		//아이디 글자 수 검증
		if (form.id.value.length <6 || form.id.value.length >20 ){
			alert("아이디는 6~20자 이내로 입력 가능합니다.")
			form.id.select()
			//select()는 드래그를 하는 메소드에용 
			return false
		}
		if (form.pw.value == ""){
			alert('비밀번호를 입력해주세요')
			form.pw.focus()
			return false
		}
		if (form.pw.value.length <6){
			alert("비밀번호는 6글자 이상으로 입력해야 합니다.")
			form.pw.select()
			return false	
		}
		//form.submit()    // input type="button" 태그에 onclick속성을 사용할 때  
		return true			// form 태그에 onsubmit속성을 사용할 때 (return도 같이 써줌)
	}
	
</script>
</head>
<body>
	<!-- form태그에서 onsubmit으로 해놓으면 버튼을 submit으로 해도 됨.  -->
	<form name="loginForm" onsubmit="return checkLogin()" action="validation01_pro.jsp" method="post">
		<p>아이디 : <input type="text" name="id"/> </p>
		<!-- maxlength="5" : 5글자로 제한함.  -->
		<p>비밀번호 : <input type="text" name="pw"/> </p>
		<p><input type="submit" value="로그인" /> </p>
		<!--  type=submmit으로 하고 온클릭하면 서브밋도 되고 온클릭도 됨.. -->
	</form>
</body>
</html>