<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
   img{
      width: 100%;
      height: 100%;
   }
   .main_left{
      position:absolute;
      left:0;
      top:120px;
      width:15%;
      height:800px;
   }
   .main_right{
      position:absolute;
      right:0;
      top:120px;
      width:15%;
      height:800px;
   }
   .sub_domestic,.sub_overseas{
      display:none;
   }
   .top_users{
      position:absolute;
      right:10%;
      top:10px;
      font-size:15px;
   }
   .top_catal{
      width:100%;
      height:120px;
      background:black;
   }
   .logo{
      position:absolute;
      top:20px;
      left:50px;
      width:10%;
      height:80px;
      cursor: pointer;
      background:white;
   }
   .search_bar{
      margin-left:35%;
      padding-top:50px;
      width:30%;
   }
   .search_bar input{
      height:40px;
   }
   .search_bar button{
      height:40px;
   }
   a{
   	  margin-left:15px;
      color:white;
      
   }
   a:HOVER{
      color:grey;
      text-decoration: none;
   }
   .main_catal{
      position:absolute;
      top:120px;
      left:15%;
   }
   .main_catal{
      background-color:black;
      width:200px;
      height:800px;
      font-size:17px;
   }
   .adver{
      width:200px;
      height:600px;
      background-color: black;
   }
   ul{
      list-style: none;
      color:white;
   }
   .loginBar{
   padding:20px;
   width:300px;
    position:absolute;
      display:none;
      z-index: 999999 !important;
      top:20px;
      background-color: white;
      border-radius: 10px 10px 10px 10px;
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
}
</style>
<div class="catalog">
   <div class="top_catal">
      <img class="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" onclick="location.href='/dvd/home.do?type=list'"/>
      <form action="/dvd/movie/search.do" method="get">
         <div class="input-group search_bar">
             <input type="text" class="form-control" name="keyword" placeholder="Search..">
             <input type="hidden" name="type" value="list" />
             <span class="input-group-btn">
                <button class="btn btn-default"><p class="glyphicon glyphicon-search"></p></button>
             </span>
          </div>
      </form>
       <div class="top_users">
       <c:choose>
             <c:when test="${id eq null}">
                <div class="login_toggle">로그인</div>
             </c:when>
             <c:otherwise>
                <div class="sessionId"><a href="/dvd/users/info.do">${id } 님 로그인중..</a></div>
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
	               <label for="id" >아이디</label>
	               <input type="text" class="form-control"  name="id"  id="id"/>
	            </div>
	            <div class="form-group">
	               <label for="pwd" >비밀번호</label>
	               <input type="password" class="form-control" name="pwd"  id="pwd"/>
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
      <c:choose>
             <c:when test="${id eq null}">
                <a href="/dvd/users/insert_form.do?type=views">회원가입</a>
                 <a href="">장바구니</a>
             </c:when>
             <c:otherwise>
                <a href="/dvd/users/logout.do">로그아웃</a>
             </c:otherwise>
       </c:choose>
      </div>
   </div>
   <div class="main_left">
      <img src="${pageContext.request.contextPath}/resources/images/left.PNG"/>
   </div>
   <div class="main_right">
      <img src="${pageContext.request.contextPath}/resources/images/Right.PNG"/>
   </div>
   
   <div class="main_catal">
      <ul>
         <li>카테고리 ${dvd_num}</li>      
         <li>
            <a href="/dvd/movie/domestic_main.do?type=list&national=domestic">국내 영화</a>
            <div class="sub_domestic">
               <ul class="sub">
                  <li><a href="/dvd/movie/domestic_main.do?type=list&national=domestic&genre=action">액션</a></li>
                  <li>범죄,드라마</li>
                  <li>코미디</li>
                  <li>멜로/로맨스</li>
                  <li>기 타</li>
               </ul>
            </div>
         </li>
         <li>
            <a href="/dvd/movie/domestic_main.do?type=list&national=overseas">해외 영화</a></li>
            <div class="sub_overseas">
               <ul class="sub">
                  <li>액션</li>
                  <li>범죄,드라마</li>
                  <li>코미디</li>
                  <li>멜로/로맨스</li>
                  <li>기 타</li>
               </ul>
            </div>
         </li>
      </ul>
      <div class="adver"></div>
   </div>
</div>

<script>
   //서브 catalog
   if("${param.national}"=="domestic"){
      $(".sub_domestic").show();
   }else if("${param.national}"=="overseas"){
      $(".sub_overseas").show();
   }
   
   $(".login_toggle").click(function(){
    $(".loginBar").slideToggle(300);
   });
   
   $(".gBtn").click(function(){
	 $(".loginBar").slideToggle(300);  
   });
   
   
   // 로그인
   $("#loginBtn").click(function(){
      
      var formData = $("#login").serialize();
   
      $.ajax({
         url:"/dvd/users/login.do",
         type:"post",
         data:formData,
         success:function(data){
            alert(data);
            if(data){
               alert("로그인 성공");
               location.reload();
            }else{
               alert("실패");
            }
         }   
      });
   });
   
</script>