<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<style>
@media(max-width:1700px){
	.search_bar,.catalog{
		display:none;
	}
	.top_one{
		display:none;
	}
	.glyphicon-menu-hamburger{
		float:right;
		display: block !important;
	}
	.res_loginBar{
		width: 80%;
		margin: 0 auto;
	}
	.res_socialBtn{
		width: 100%;
		text-align: center !important;
		margin-bottom: 5px;
	}
	.top_area{
		border-bottom: 1px solid gray;
	}
	#loginBtn{
		width:70px !important;
	}
	.btnFloat{
		float:right;
	}
	.col-img{
		margin-left: 30px;
	}
	.col-img-logout{
		width:20%;
	}
	.col-img-schedule{
		width:20%;
	}
	.col-img-cart{
		width:20%;
		margin-left: 15px;
	}
	
	
}
</style>

<!-- css 링크!! -->
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
   		<div class="response_Menu">
			<div class="response_SubMenu">
				<ul>
					<span class="glyphicon glyphicon-arrow-right toggle_responseUp"></span>
					<li class="response_serach">
						<form action="/dvd/movie/movie_main.do">
							<div class="input-group response_search_bar">
								<input type="text" class="form-control" name="keyword" placeholder="Search..">
								<input type="hidden" name="type" value="list" />
								<input type="hidden" name="num" value="1" />
								<span class="input-group-btn">
									<button class="btn btn-default"><p class="glyphicon glyphicon-search"></p></button>
								</span>
							</div>
						</form>
					</li>
					</li>
					<li onclick="location.href='/dvd/home.do'">MAIN</li>
					<li class="res_domestic" onclick="res_domesticCatal()">한국 영화  <p style ="margin-left:40%;" class="glyphicon glyphicon-menu-down"></p>
						<ul class="response_subDomestic">
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic'">전체보기</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic&genre=action'">액션</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic&genre=romance'">로맨스</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic&genre=comedy'">코미디</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic&genre=horor'">공포</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic&genre=drama'">드라마</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic&genre=etc'">기타</li>
						</ul>
					</li>
					<li class="res_overseas" onclick="res_overseasCatal()">해외 영화  <p style ="margin-left:40%;" class="glyphicon glyphicon-menu-down"></p>
						<ul class="response_subOverseas">
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&national=overseas'">전체보기</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=overseas&genre=action'">액션</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=overseas&genre=romance'">로맨스</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=overseas&genre=comedy'">코미디</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=overseas&genre=horor'">공포</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=overseas&genre=drama'">드라마</li>
							<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=overseas&genre=etc'">기타</li>
						</ul>
					</li>
					<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&production=new'">최신 영화</li>
					<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&grade=1'">인기 영화</li>
					<li style="background-color:white; margin-left:0;">
					<c:choose>
						<c:when test="${id eq null}">
							<div class="res_loginBar">
								<form id=login>
									<div class="form-group">
										<label style="color:black"  for="login_id">아이디</label>
										<input type="text" class="form-control" name="id" id="login_id" />								
									</div>
									<div class="form-group">
										<label style="color:black" for="login_pwd">비밀번호</label>
										<input type="password" class="form-control" name="pwd" id="login_pwd" />								
									</div>
									<div class="btnFloat">
										<button class="btn btn-default" type="button" id="loginBtn">로그인</button>
										<button class="btn btn-default" type="button" id="signUpBtn" 
										 onclick="location.href='/dvd/users/insert_form.do?type=views' ">회원가입</button>								
									</div>
									<br/>
									<br/>
									<div class="res_buttonGroup">
										<button class="btn btn-social btn-facebook res_socialBtn">
											<span class="fa fa-facebook"></span>Sign in with <strong style="font-size:16px;">Facebook</strong>
										</button>
										<button class="btn btn-social btn-twitter res_socialBtn">
											<span class="fa fa-twitter"></span>Sign in with <strong style="font-size:16px;">Twitter</strong>
										</button>
									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
						<div class="col-img-float col-img">
							<a href="/dvd/basket/list.do?id=${id }">
								<img class="col-img-cart" src="/dvd/resources/images/cart1.png" />
							</a>
							<a href="/dvd/users/info.do">
								<img class="col-img-schedule col-img" src="/dvd/resources/images/schedule1.png" />
							</a>
							<a href="/dvd/users/logout.do" >
								<img class="col-img-logout col-img" src="/dvd/resources/images/logout.png" />
							</a>						
						</div>
						</c:otherwise>
					</c:choose>
					</li>
				</ul>
			</div>
		</div>
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
		<span class="glyphicon glyphicon-menu-hamburger toggle_responseDown"></span>
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
<script>
  function res_domesticCatal(){
	  $(".response_subDomestic").stop().slideToggle();
	  $(".res_domestic").children("p").toggleClass("glyphicon-menu-up");
  }
  
  function res_overseasCatal(){
	  $(".response_subOverseas").stop().slideToggle();
	  $(".res_overseas").children("p").toggleClass("glyphicon-menu-up");
  }
  $(".toggle_responseDown").click(function(){
	  $(".response_Menu").stop().show();
  });
  $(".toggle_responseUp").click(function(){
	  $(".response_Menu").stop().hide();
  })
</script>
<!--  javascript 링크 -->
<script src="${pageContext.request.contextPath }/resources/js_each/catalog.js"></script>
