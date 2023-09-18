<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkForm(){
		let regExp = /Java/i		//Java라는문자열을 대소문자 구분없이 검사
		let str = document.form.title.value
		//let test = 'javajavaJAVA'
		let result = regExp.exec(str)
		//let result1 = regExp.exec(test)
		console.log(result)
		//console.log(result1[0])
		//console.log(result1[1])
		//exec()  : 정규표현식에 부합한 문자열 반환
		//regExp.test() : 정규표현식에 부합한지 여부를 반환(true/false)
		if (regExp.test(str)){
			
		alert(result[0])			
		}
		
		//return false
		//return값 안주면 true가 디폴트임
	}
</script>
</head>
<body>
	<form name="form" onsubmit="return checkForm()">
		<p>제목  : <input type="text" name="title"> </p>
		<p><input type="submit" name="" value="등록"> </p>
	</form>
</body>
</html>