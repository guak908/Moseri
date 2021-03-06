<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>        
        <div class="container-fluid">
            <div class="row text-center mypage-bg">
                <div class="inner">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div id="req">
                        <h2>받은 요청서</h2>
                        <c:forEach items="${list}" var="list">
						<div class="col-sm-12">
						<c:set var="e" value="${list.estimate_no}"/>
						<!-- 12.수정(두산) -->
						<c:set var="ee" value="${list.m_result}"/>
						<h4><a href="estimateWrite?no=${list.no}">${list.nomal_email}님 요청서 
						<c:if test="${e ne 0}"> (견적서 작성 완료)<c:if test="${ee eq 1}">_(최종 매칭 완료)</c:if></c:if></a></h4>
						<!-- 12.수정(두산) -->
						</div>
						</c:forEach>
                    </div>
                    </div>
                    <div class="col-sm-1"></div>
                </div>
                
            </div>
        </div>
<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>