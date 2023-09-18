<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//로그인 유효성 검사
	function checkJoin() {
		let form=document.joinForm 	// name이 joinForm인 폼 요소를 가져옴
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
		
		//[이름]
		if (form.name.value == ""){
			alert('이름을 입력해주세요')
			form.name.focus()
			return false
		}
		//이름 검증 - 이름 첫글자는 숫자로 사용 불가
		if ( ! isNaN( form.name.value.substr(0,1) ) ){
			alert('이름은 숫자로 시작할 수 없습니다.')
			form.name.select()
			return false
		}
		//form.submit()    // input type="button" 태그에 onclick속성을 사용할 때  
		return true			// form 태그에 onsubmit속성을 사용할 때 (return도 같이 써줌)
	}
	
	//숫자 키 입력 검증
	function checkNumber() {
		let form=document.joinForm
		console.log(event.keyCode)	
		//근데 한글로 하면 228인가로만 나오는 듯함. ... 로그 찍어보니까
		//숫자가 아닌 경우(48~57키코드아 아닌 경우)
		if (!(event.keyCode >= 48 && event.keyCode <=57) ){
			//alert("나이는 숫자만 입력 가능합니당~")
			event.returnValue = false //입력반환값 여부
			form.age.value = ''
		}
		
		
	}
	
</script>
</head>
<body>
	<!-- form태그에서 onsubmit으로 해놓으면 버튼을 submit으로 해도 됨.  -->
	<form name="joinForm" onsubmit="return checkJoin()" action="validation02_pro.jsp" method="post">
		<p>아이디 : <input type="text" name="id"/> </p>
		<!-- maxlength="5" : 5글자로 제한함.  -->
		<p>비밀번호 : <input type="text" name="pw"/> </p>
		<p>이름 : <input type="text" name="name"/> </p>
		<p>나이 : <input type="text" name="age" onkeyup="checkNumber()"/> </p>
		
		<p><input type="submit" value="로그인" /> </p>
		<!-- 
		 <p><input type="submit" value="로그인" onclick="checkJoin()" /> </p>		
		 <p><input type="button" value="로그인" onclick="checkJoin()" /> </p>		
		 -->
		<!--  type=submmit으로 하고 온클릭하면 서브밋도 되고 온클릭도 됨.. -->
	</form>
</body>
</html>