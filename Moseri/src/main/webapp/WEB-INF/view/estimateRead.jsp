<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // 세션값 가져오기
    out.println(session.getAttribute("email"));
    out.println(session.getAttribute("granted"));
    out.println(session.getAttribute("login"));
 	// 세션 전체 무효화(로그아웃시 주로 사용)
    //session.invalidate();
 %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>estimate-write</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/mypage.css">
<style>
div {
 	border: 1px dotted #000;
}
</style>
<!-- bootstrap js -->
<script src="js/jquery-1.12.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/mypage.js"></script>
</head>

<body>
	<header class="container-fluid">
		<div class="row text-center">
			<h2>Mypage</h2>
		</div>
	</header>
	<div class="container-fluid">

		<jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>

<!-- 		<form action="chat" method="get"> -->
			<div class="row text-center mypage-bg">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div id="est-write">
						<h3>요청서/견적서 보기</h3>
						<div class="write-wrap">
							<div class="col-lg-6">
								<h4>지도/세부요청서</h4>
								<div class="left-box">
									<div class="map">지도</div>
									<div class="content">
										<!-- 4.수정(두산) -->
										<h4>${q[0]}</h4><br>
										<h5>${q[1]}</h5><br>
										${requestDto.anser1}<br><br>
										<h5>${q[2]}</h5><br>
										${requestDto.anser2}<br><br>
										<h5>${q[3]}</h5><br>
										${requestDto.anser3}<br><br>
										<h5>${q[4]}</h5><br>
										${requestDto.anser4}<br><br>
										<h5>${q[5]}</h5><br>
										${requestDto.anser5}<br><br>
									<!-- 4.수정(두산) -->
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<h4>내 프로필</h4>
								<div class="profile">
								email - ${profileDto.nickname}<br>
								star - ${profileDto.star}<br>
								pro_img - ${profileDto.pro_img}<br>
								self - ${profileDto.self}<br>
								resume - ${profileDto.resume}<br>
								img - ${profileDto.img}<br>
								m_cnt - ${profileDto.m_cnt}
								</div>
								<h4>견적서 내용</h4>
								<div class="right-box">
									<div>
										<span>시급</span> <textarea style="height: 30px; resize: none" readonly>${estimateDto.time_pay}</textarea>
									</div>
									<div>
										<span>총액</span> <textarea style="height: 30px; resize: none" readonly>${estimateDto.total_pay}</textarea> 
									</div>
									<div>
										<span>설명글</span> <textarea style="resize: none; height: 100px; width: 600px" readonly>${estimateDto.anser1}</textarea>
									</div>
									<c:set var="e" value="${matchingDto.m_result}"/>
									<c:if test="${e eq 1}"><input type="button" 
									onclick="location.href='chat?matchingno=${matchingDto.no}&m_result=${matchingDto.m_result}'" value="채팅내용보기"></c:if>
									<c:if test="${e eq 0}"><input type="button" 
									onclick="location.href='chat?matchingno=${matchingDto.no}&m_result=${matchingDto.m_result}'" value="수락/채팅하기"></c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
<!-- 		</form> -->
		
	</div>
</body>

</html>