<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	body{
		background-color: #FAFAFA;
		height:0px;
	}
   img{
      width: 100%;
      height: 100%;
   }
   .top_users{
      position:absolute;
      right:1%;
      top:10px;
      font-size:16px;
   }  
   .top_users a{
		color:white;
   }
   .top_users a:ACTIVE, .top_users a:VISITED,.top_users a:HOVER{
		color:white;
		outline: none;
		text-decoration: none;
   }
   .top_catal{
 	  position:fixed;
      width:100%;
      height:40px;
      background-color:#232323;
   }
   .search_bar{
   	  position:absolute;
   	  top:40px;
   	  margin-left:7%;
      width:25%;
   }
   .search_bar input{
      height:35px;
   }
   .search_bar button{
      height:35px;
   }
   .main_catal{
      position:absolute;
      top:40px;
      width:20%;
      height:800px;
      z-index:99999;
   }
   ul{
      list-style: none;
   }
   .loginBar{
	   	padding:20px;
		width:300px;
	    position:absolute;
		display:none;
		z-index: 99999999 !important;
		top:30px;
		background-color: white;
		border-radius: 10px 10px 10px 10px;
		left: -85px;
   }
   .login_toggle, .sessionId{
      color:white;
      float:left;
      cursor: pointer;
   }
   .top_area{
      border-bottom: 1px solid gray;
   }
   #loginBtn{
      width:100%;
   }
   .gBtn{
        float: right;
        cursor: pointer;
   }
   .socialBtn{
        width:100%;
        text-align: center;
   }
   .content{
		float:left;
		margin-top:400px;
		margin-left:20%;
		width:60% !important;
		z-index:-1;
	}
	.main_left{
		position:absolute;
		left:0;
		top:410px;
		width:16%;
		height:40px;
		background:#FAFAFA;
	}
	.main_right{
		position:absolute;
		right:0;
		top:410px;
		width:16%;
		height:40px;
		background:#FAFAFA;
	}
	.top_one{
		position:fixed;
	    top:40px;
	    width:68%;
	    height:40px;
	    border-top:40px solid #232323;
	    border-left:60px solid transparent;
	    border-right:60px solid transparent;
	    margin-left:16%;
	}
	.main_tr{
		position:absolute;
		top:410px;
		width:68%;
		height:40px;
		border-top:40px solid transparent;
		border-left:60px solid #FAFAFA;
		border-right:60px solid #FAFAFA;
		margin-left:16%;
	}
	.main_img{
		position:absolute;
		top:0;
		width:100%;
		height:450px;
		background-image:url("${pageContext.request.contextPath}/resources/images/main.jpg");
		z-index: -1;
	}
	.catalog{
		position:absolute;
		height:80px;
		width:60%;
		left:20%;
		z-index:999999;
	}
	.catalog li {
		float:left;
		margin-top:40px;
		margin-right:20px;
		color:white;
		font-size:20px;
	}
	.sub_domestic{
		position:fixed;
		top:80px;
		left:34%;
		background-color : #232323;
		width: 130px;
		padding-left:0px;
		color:white;
		display:none;
	}
	.sub_overseas{
		position:fixed;
		top:80px;
		left:39%;
		background-color : #232323;
		width: 130px;
		padding-left:0px;
		color:white;
		display:none;
	}
	.sub_domestic a{
		color:white;
 	}
 	.sub_overseas a{
 		color:white;
 	}
 	.sub_domestic li{
 		margin-left:-15px;
 	}
 	.sub_overseas li{
 		margin-left:-15px;
 	}
   .sub_domestic a:ACTIVE, .sub_domestic a:VISITED,.sub_domestic a:HOVER,
   .sub_overseas a:ACTIVE, .sub_overseas a:VISITED,.sub_overseas a:HOVER{
		color:white;
		outline: none;
		text-decoration: none;
    }
    .catalog li{
    	cursor: pointer;
    }
    .side_bar{
    	position:absolute;
    	top:100px;
    	right:30%;
		width:100px;
		height:400px;
		background-color:#232323; 
    }
}
</style>
<div class="main_img"></div>
<div class="main_left"></div>
<div class="main_right">
	<div class="side_bar">
	</div>
</div>
<div class="main_tr">
      <div class="sub_domestic">
          <ul>
             <li><a href="/dvd/movie/movie_main.do?type=list&national=domestic&genre=action">액션</a></li>
             <li><a href="/dvd/movie/movie_main.do?type=list&national=domestic&genre=drama">범죄,드라마</a></li>
             <li><a href="/dvd/movie/movie_main.do?type=list&national=domestic&genre=comedy">코미디</a></li>
             <li><a href="/dvd/movie/movie_main.do?type=list&national=domestic&genre=romance">멜로/로맨스</a></li>
             <li><a href="/dvd/movie/movie_main.do?type=list&national=domestic&genre=etc">기 타</a></li>
          </ul>
       </div>
        <div class="sub_overseas">
               <ul class="sub">
                  <li><a href="/dvd/movie/movie_main.do?type=list&national=overseas&genre=action">액션</a></li>
                  <li><a href="/dvd/movie/movie_main.do?type=list&national=overseas&genre=drama">범죄,드라마</a></li>
                  <li><a href="/dvd/movie/movie_main.do?type=list&national=overseas&genre=comedy">코미디</a></li>
                  <li><a href="/dvd/movie/movie_main.do?type=list&national=overseas&genre=romance">멜로/로맨스</a></li>
                  <li><a href="/dvd/movie/movie_main.do?type=list&national=overseas&genre=etc">기 타</a></li>
               </ul>
            </div>
</div>
<div>
   <div class="top_catal">
          <ul class="catalog">
      		<li style="margin-left:15%">MAIN</li>
      		<li onclick="domestic()">한국 영화</li>
      		<li onclick="overseas()">해외 영화</li>
      		<li onclick="location.href='/dvd/movie/movie_main.do?type=list&production=new'">최신 영화</li>
      		<li onclick="location.href='/dvd/movie/movie_main.do?type=list&grade=1'">인기 영화</li>
      		<li>
      		<form action="/dvd/movie/movie_main.do">
      			<div class="input-group search_bar">
		             <input type="text" class="form-control" name="keyword" placeholder="Search..">
		             <input type="hidden" name="type" value="list" />
		             <span class="input-group-btn">
                <button class="btn btn-default"><p class="glyphicon glyphicon-search"></p></button>
		             </span>
		        </div>
      		</li>
      	  </ul>
      </form>
      <div class="top_one"></div>
      <div class="top_users"/>
       <c:choose>
             <c:when test="${id eq null}">
                <div class="login_toggle">로그인</div><span> | </span>
                <a href="/dvd/users/insert_form.do?type=views">회원가입</a><span> | </span>
                <a href="">장바구니</a>
             </c:when>
             <c:otherwise>
                <div class="sessionId"><a href="/dvd/users/info.do">내 정보</a></div><span> | </span>
                <a href="">장바구니</a><span> | </span>
                <a href="/dvd/users/logout.do">로그아웃</a>
             </c:otherwise>
       </c:choose>
         <div class="loginBar">
             <div class="gBtn"><span class="glyphicon glyphicon-remove "></span></div>
            <h3 style="text-align: center"><strong>Log in</strong></h3>
            <br/>
            <div class="top_area"></div>
            <br/>
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
            </form>
            <br/>
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
	var domestic = function(){
		$(".sub_domestic").stop().slideToggle();
		$(".sub_overseas").slideUp();
	}
	var overseas = function(){
		$(".sub_overseas").stop().slideToggle();
		$(".sub_domestic").slideUp();
	}
   $(".login_toggle").click(function(){
    $(".loginBar").stop().slideToggle(300);
   });
   
   $(".gBtn").click(function(){
    $(".loginBar").stop().slideToggle(300);  
   });
   
   // 로그인
   $("#loginBtn").click(function(){
      
      var formData = $("#login").serialize();
   
      $.ajax({
         url:"/dvd/users/login.do",
         type:"post",
         data:formData,
         success:function(data){
            if(data){
               location.reload();
            }else{
            }
         }   
      });
   });
</script>