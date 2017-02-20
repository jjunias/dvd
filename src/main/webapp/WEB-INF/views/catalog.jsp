<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<!-- css 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css_each/catalog/catalog.css"/>
<div class="main_img"></div>
<div class="main_left"></div>
<div class="main_right"></div>
<div data-spy="affix" data-offset-top="300" data-offset-bottom="300">
   <div class="side_bar">
      <div class="sideBtn">
         <span class="glyphicon glyphicon-chevron-up">Top</span>
      </div><br/>
      <div class="cartBtn">
         <a class="cartUnderline" href="">
            <img class="cartImg" src="/dvd/resources/images/cart1.png" alt="장바구니 사진" />
         </a>
      </div>
      <div class="infoBtn">
         <a href="/dvd/users/info.do">
            <img class="infoImg" src="/dvd/resources/images/users1.png" alt="" />
         </a>
      </div>
      <div class="scheduleBtn">
         <a href="">
            <img class="scheduleImg" src="/dvd/resources/images/schedule1.png" alt="" />
         </a>
      </div>
      <div class="questionBtn">
         <a href="">
            <img class="questionImg" src="/dvd/resources/images/question.png" alt="" />
         </a>
      </div>
   </div>
</div>
<div class="main_tr"></div>
<div>
   <div class="top_catal">
      <ul class="catalog">
         <li onclick="location.href='/dvd/home.do'" style="margin-left:15%">MAIN</li>
         <li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic'">한국 영화</li>
         <li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&national=overseas'">해외 영화</li>
         <li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&production=new'">최신 영화</li>
         <li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&grade=1'">인기 영화</li>
         <li>
            <form action="/dvd/movie/movie_main.do">
               <div class="input-group search_bar">
                  <input type="text" class="form-control" name="keyword" placeholder="Search..">
                  <input type="hidden" name="type" value="list" />
                  <input type="hidden" name="num" value="1" />
                  <span class="input-group-btn">
                     <button class="btn btn-default"><p class="glyphicon glyphicon-search"></p></button>
                  </span>
               </div>
            </form>
         </li>
      </ul>
      <div class="top_one"></div>
      <div class="top_users"/>
      <c:choose>
         <c:when test="${id eq null}">
            <div class="login_toggle">로그인</div><span> 　| 　</span>
            <a href="/dvd/users/insert_form.do?type=views" style="margin-right:50px;">회원가입</a>
         </c:when>
         <c:otherwise>
            <div class="sessionId"><a href="/dvd/users/info.do">내 정보</a></div><span> | </span>
            <a href="/dvd/basket/list.do?id=${id }">장바구니</a><span> | </span>
            <a href="/dvd/users/logout.do">로그아웃</a>
         </c:otherwise>
      </c:choose>
      <div class="loginBar">
         <div class="gBtn"><span class="glyphicon glyphicon-remove "></span></div>
         <h3 style="text-align: center"><strong>Log in</strong></h3><br/>
            <div class="top_area"></div><br/>
         <form id="login" >
            <div class="form-group">
               <label for="login_id" >아이디</label>
               <input type="text" class="form-control"  name="id"  id="login_id" />
            </div>
            <div class="form-group">
               <label for="login_pwd" >비밀번호</label>
               <input type="password" class="form-control" name="pwd"  id="login_pwd" />
            </div>
            <button class="btn btn-info btn1"  type="button" id="loginBtn" >로그인</button>
         </form><br/>
         <div class="top_area"></div>
         <h4 style="text-align: center">SNS Log in</h4>
         <div class="buttonGroup">
            <form action="">
               <button class="btn btn-social btn-facebook socialBtn"><span class="fa fa-facebook"></span>Sign in with <strong style="font-size:16px;">Facebook</strong></button>
               <button class="btn btn-social btn-twitter socialBtn"><span class="fa fa-twitter"></span>Sign in with <strong style="font-size:16px;">Twitter</strong></button>
            </form>
         </div>
         </div>
      </div>
   </div>
</div>
<!--  javascript 링크 -->
<script src="${pageContext.request.contextPath }/resources/js_each/catalog.js"></script>