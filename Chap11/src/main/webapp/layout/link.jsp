<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- 상대경로 -->
<!-- <script src="../static/js/validation.js"></script> -->
<!-- 절대경로 -->
<!-- <script src="/Chap08/static/js/validation.js"></script> -->

<!-- 서버로 요청보내는 거임. 요청경로가 매핑되어있어야 한다. 서블릿에서 요청하는 경로가 매핑되어있어야 한다.  -->



	<!-- bootstrap lib -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/static/css/style.css" rel="stylesheet">