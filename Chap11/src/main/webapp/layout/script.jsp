<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- 상대경로 -->
<!-- <script src="../static/js/validation.js"></script> -->
<!-- 절대경로 -->
<!-- <script src="/Chap08/static/js/validation.js"></script> -->
<script src="/<%= request.getContextPath() %>/static/js/validation.js"></script>
<!-- 서버로 요청보내는 거임. 요청경로가 매핑되어있어야 한다. 서블릿에서 요청하는 경로가 매핑되어있어야 한다.  -->
<%-- <script src="http://localhost:8080/<%= request.getContextPath() %>/static/js/validation.js"></script> --%>