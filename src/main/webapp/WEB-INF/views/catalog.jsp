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
   
}
</style>
<div class="catalog">

   <div class="top_catal">
      <img class="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" onclick="location.href='/dvd/home.do?type=list'"/>
      <form action="/dvd/movie/search.do" method="get">
         <div class="input-group search_bar">
             <input type="text" class="form-control" name="keyword" placeholder="Search..">
             <span class="input-group-btn">
                <button class="btn btn-default"><p class="glyphicon glyphicon-search"></p></button>
             </span>
          </div>
       </form>
       <div class="top_users">
         <a href="">로그인</a> |
         <a href="/dvd/users/insert_form.do?type=views">회원가입</a> |
         <a href="">장바구니</a>
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
         <li>카테고리</li>      
         <li>
            <a href="/dvd/movie/domestic_main.do?type=list&national=domestic">국내 영화</a>
            <div class="sub_domestic">
               <ul class="sub">
                  <li>액션</li>
                  <li>범죄,드라마</li>
                  <li>코미디</li>
                  <li>멜로/로맨스</li>
                  <li>기 타</li>
               </ul>
            </div>
         </li>
         <li>
            <a href="/dvd/movie/overseas_main.do?type=list&national=overseas">해외 영화</a></li>
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
</script>
